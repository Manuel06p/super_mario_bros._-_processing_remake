class Koopa extends Enemy {
    boolean isRight;
    boolean isShell;
    boolean movingShell;

    Timer movingShellTimeout;
    Timer immunityShellTimeout;

    float shellSpeed = 15;

    Koopa(float x, float y, boolean isRight, String path) {
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

        movingShellTimeout = new Timer(13);
        immunityShellTimeout = new Timer(25);

        this.isRight = isRight;
        isShell = false;
        movingShell = false;
        speed.x = 4;
    }


    @Override
    void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
        super.update(platforms, powerUps);

        

        if (!isShell) {
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
        } else if (!movingShell){
            movingShellTimeout.update();
            if (collideUp(player) && movingShellTimeout.tick()) {
                movingShell();
                isRight = !isRight;
                movingShellTimeout.reset();
                player.bounceOverEnemy();
            } else if (collideRight(player) && movingShellTimeout.tick()) {
                isRight = false;
                movingShell();
                movingShellTimeout.reset();
            } else if (collideLeft(player) && movingShellTimeout.tick()) {
                isRight = true;
                movingShell();
                movingShellTimeout.reset();
            }
        } else {
            movingShellTimeout.update();
            immunityShellTimeout.update();
            isRight = moveAuto(isRight);
            if ((collideDown(player) || ((collideRight(player) || collideLeft(player)) && player.position.y + player.height > centralPositionY())) && immunityShellTimeout.tick()) {
                player.takeDamage(damage);
            }
            if (collideUp(player) && movingShellTimeout.tick()) {
                if (player.damage > 1) {
                    takeDamage(player.damage);
                } else {
                    staticShell();
                }
                movingShellTimeout.reset();
                player.bounceOverEnemy();
            }
        }

    }

    @Override
    void draw() {
        super.draw();
    }

    void staticShell() {
        isShell = true;
        movingShell = false;
        speed.x = 0;
        breakingValue.put("left", 0);
        breakingValue.put("right", 0);
    }

    void movingShell() {
        immunityShellTimeout.reset();
        movingShell = true;
        speed.x = shellSpeed;
        breakingValue.put("left", 1);
        breakingValue.put("right", 1);

    }

    void livingKoopa() {
        speed.x = movementSpeed;
        isShell = false;
        movingShell = false;
    }

}