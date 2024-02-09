class Koopa extends Enemy {
    boolean isRight;
    boolean isShell;
    boolean movingShell;

    Timer movingShellTimeout;
    Timer immunityShellTimeout;
    Timer staticShellTimeout;

    String koopaType;

    float shellSpeed = 12;

    Koopa(float x, float y, boolean isRight, String path, String koopaType) {
        super(  path, //path
                new PVector(x, y), //initialPosition
                1, //health
                1, //damage
                GRAVITY, //gravity
                3.0, //speed
                0, //smallJumpValue
                0, //superJumpValue
                1, //breakingValueUp
                0, //breakingValueDown
                0, //breakingValueLeft
                0 //breakingValueRight
        );
        
        this.koopaType = koopaType;
        movingShellTimeout = new Timer(13);
        immunityShellTimeout = new Timer(20);
        staticShellTimeout = new Timer(300);

        this.isRight = isRight;
        isShell = false;
        movingShell = false;
        speed.x = 4;
    }


    @Override
    void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
        super.update(platforms, powerUps);

        

        if (!isShell) { //Living Koopa
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
        } else if (!movingShell){ //Static shell
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
            
        } else { //Moving shell
            movingShellTimeout.update();
            immunityShellTimeout.update();
            
            
            for (Enemy enemy : level.enemies) {
              if ((collideDown(enemy) || ((collideRight(enemy) || collideLeft(enemy)) && enemy.position.y + enemy.height > centralPositionY())) && immunityShellTimeout.tick()) {
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
    
   
    @Override
    void draw() {
        super.draw();
    }

    @Override
    void directionChanged(boolean isRightNew) {
        super.directionChanged(isRightNew);
        if (currentAnimation == 0) {
            animation(imageDictionary.get(KOOPA + koopaType + booleanSide.get(isRightNew)), 7);
        }
    }

    void staticShell() {
        isShell = true;
        movingShell = false;
        
        speed.x = 0;
        breakingValue.put("left", 0);
        breakingValue.put("right", 0);
        animation(imageDictionary.get(KOOPA + koopaType + KOOPA_SHELL_0), 0);
        currentAnimation = 1;
    }

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

    void livingKoopa() {
        speed.x = movementSpeed;
        isShell = false;
        movingShell = false;
        movingShellTimeout.reset();
        staticShellTimeout.reset();

        animation(imageDictionary.get(KOOPA + koopaType + booleanSide.get(isRight)), 7);
        currentAnimation = 0;
    }

}
