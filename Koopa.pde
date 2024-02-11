/**
 * Class used to manage the enemy Koopa. It extends the Enemy class.
 */
class Koopa extends Enemy {

    boolean isRight;
    boolean isShell;
    boolean movingShell;

    Timer movingShellTimeout;
    Timer immunityShellTimeout;
    Timer staticShellTimeout;

    String koopaType;

    float shellSpeed = 12;

    /**
     * Create a new Koopa object.
     * - path: texture path
     * - x: horizontal coordinate.
     * - y: vertical coordinate.
     * - isRight: starts moving to the right.
     * - koopaType: Koopa type.
     */
    Koopa(String path, float x, float y, boolean isRight, String koopaType) {
        super(  
            path, // Texture string path
            new PVector(x, y), // Initial position
            1, // Health
            1, // Damage
            GRAVITY, // Gravity
            3.0, // Movement speed
            0, // Small jump value
            0, // Super jump value
            1, // Breaking up value
            0, // Breaking down value
            0, // Breaking left value
            0 // Breaking right value
        );
        
        this.koopaType = koopaType;
        movingShellTimeout = new Timer(13);
        immunityShellTimeout = new Timer(10);
        staticShellTimeout = new Timer(300);

        this.isRight = isRight;
        isShell = false;
        movingShell = false;
        speed.x = 4;
    }

    /**
     * Update the Koopa status.
     * - platforms: ArrayList of platforms.
     * - powerUps: ArrayList of power ups.
     */
    @Override
    void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
        super.update(platforms, powerUps);

        if (!isShell) // Living Koopa
        { 
            isRight = moveAuto(isRight);
            if (collideUp(player)) {
                if (player.damage > 1) {
                    takeDamage(player.damage);
                } else {
                    staticShell();
                }
                
                player.bounceOverEnemy();
            }

            if (collideDown(player) || ((collideRight(player) || collideLeft(player)) && player.position.y + player.height > centralPositionY())) {
                player.takeDamage(damage);
            }
        } 
        else if (!movingShell) // Static shell
        { 
            movingShellTimeout.update();
            staticShellTimeout.update();
            if (staticShellTimeout.elapsed == staticShellTimeout.delay-50) {
                animation(imageDictionary.get(KOOPA + koopaType + KOOPA_SHELL_1), 0);
                currentAnimation = 2;
            }
            if (staticShellTimeout.tick()) {
                livingKoopa();
            } else {
                if (collideUp(player) && movingShellTimeout.tick()) {
                    movingShell();
                    isRight = !isRight;
                    player.bounceOverEnemy();
                } else if (collideRight(player) && movingShellTimeout.tick()) {
                    kick_effect.play();
                    isRight = false;
                    movingShell();
                } else if (collideLeft(player) && movingShellTimeout.tick()) {
                    kick_effect.play();
                    isRight = true;
                    movingShell();
                }
            }  
        } 
        else // Moving shell
        { 
            movingShellTimeout.update();
            immunityShellTimeout.update();
            
            
            for (Enemy enemy : level.enemies) {
              if (collideDown(enemy) || ((collideRight(enemy) || collideLeft(enemy)) && enemy.position.y + enemy.height > centralPositionY())) {
                enemy.takeDamage(damage);
                leftCollision = false;
                rightCollision = false;
              }
            }
            
            if ((collideDown(player) || ((collideRight(player) || collideLeft(player)) && player.position.y + player.height > centralPositionY())) && immunityShellTimeout.tick()) {
                player.takeDamage(damage);
                leftCollision = false;
                rightCollision = false;
                
            }
            if (collideUp(player) && movingShellTimeout.tick()) {
                if (player.damage > 1) {
                    takeDamage(player.damage);
                } else {
                    staticShell();
                }
                
                player.bounceOverEnemy();
            }
            isRight = moveAuto(isRight);
        }
    }
    //
   
    /**
     * Draw the Koopa.
     */
    @Override
    void draw() {
        super.draw();
    }
    //

    /**
     * Manage the change of direction of the Koopa.
     * - isRightNew: the new movement direction is to the right.
     */
    @Override
    void directionChanged(boolean isRightNew) {
        super.directionChanged(isRightNew);
        if (currentAnimation == 0) {
            animation(imageDictionary.get(KOOPA + koopaType + booleanSide.get(isRightNew)), 7);
        }
    }
    //

    /**
     * Manage koopa when it's in the shell status.
     */
    void staticShell() {
        isShell = true;
        movingShell = false;
        
        speed.x = 0;
        breakingValue.put("left", 0);
        breakingValue.put("right", 0);
        animation(imageDictionary.get(KOOPA + koopaType + KOOPA_SHELL_0), 0);
        currentAnimation = 1;
    }
    //

    /**
     * Manage koopa when it's in the moving shell status.
     */
    void movingShell() {
        immunityShellTimeout.reset();
        staticShellTimeout.reset();
        movingShell = true;
        speed.x = shellSpeed;
        breakingValue.put("left", 2);
        breakingValue.put("right", 2);
        animation(imageDictionary.get(KOOPA + koopaType + KOOPA_SHELL_0), 0);
        currentAnimation = 1;
    }
    //

    /**
     * Manage koopa when it's in the living status.
     */
    void livingKoopa() {
        speed.x = movementSpeed;
        isShell = false;
        movingShell = false;
        movingShellTimeout.reset();
        staticShellTimeout.reset();

        animation(imageDictionary.get(KOOPA + koopaType + booleanSide.get(isRight)), 7);
        currentAnimation = 0;
    }
    //

}
//