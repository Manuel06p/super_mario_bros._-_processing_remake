class Entity extends Sprite {
    
    

    final int JUMP_TIMEOUT_VALUE = 5;
    int jumpTimeout;
    float gravity;
    float jumpValue;
    float jumpStatus;
    float movementSpeed;

    HashMap<String, Integer> breakingValue = new HashMap<String, Integer>();

    boolean jump = false;

    Entity(String path, PVector initialPosition, float gravity, float speed, float jumpValue, int breakingValueUp, int breakingValueDown, int breakingValueLeft, int breakingValueRight) {
        super(path, initialPosition);
        this.gravity = gravity;
        this.movementSpeed = speed;
        this.speed.y = 0;
        jumpTimeout = 0;
        this.jumpValue = jumpValue;

        this.breakingValue.put("up", breakingValueUp);
        this.breakingValue.put("down", breakingValueDown);
        this.breakingValue.put("left", breakingValueLeft);
        this.breakingValue.put("right", breakingValueRight);
    }

    

    void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
        
        super.update();

        checkCollisions(platforms, powerUps);

        if (!downCollision && jumpStatus == 0 ) {
            applyGravity();
        } else if ((jump || jumpStatus > 0) && jumpTimeout == 0) {
            if (jumpStatus<jumpValue && !upCollision) {
                jumpStatus += 1;
                applyInvertedGravity();
            } else {
                jumpStatus = 0;
                jump = false;
                jumpTimeout = JUMP_TIMEOUT_VALUE;
            }
            
        } else {
            stopY();
        }

        if (jumpTimeout > 0 && downCollision) {
            jump = false;
            jumpTimeout -= 1;
        }

        if (speed.x == 0) {
            /*
            if (rightCollision) {
                position.x = rightCollisionX;
            } else if (leftCollision) {
                position.x = leftCollisionX;
            }
            */
        }
    }

    void applyGravity() {
        speed.y = gravity;
    }

    void applyInvertedGravity() {
        speed.y = -gravity;
    }

    void checkCollisions(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
        downCollision = false;
        rightCollision = false;
        leftCollision = false;
        upCollision = false;

        ArrayList<Integer> killedPlatforms = new ArrayList<Integer>();

        for (int i = 0; i < platforms.size(); i++) {
            Platform platform = platforms.get(i);
            boolean remove = false;

            boolean rightCollisionOld = rightCollision;
            boolean leftCollisionOld = leftCollision;
            boolean downCollisionOld = downCollision;
            boolean upCollisionOld = upCollision;

            float positionYOld = position.y;
            float positionXOld = position.x;

            boolean rightCollisionCurrent = false;
            boolean leftCollisionCurrent = false;
            boolean downCollisionCurrent = false;
            boolean upCollisionCurrent = false;


            /*
            if (!(rightCollisionCurrent = collideRight(platform))) {
                if (!(leftCollisionCurrent = collideLeft(platform))) {
                    if (!(downCollisionCurrent = collideDown(platform))) {
                        upCollisionCurrent = collideUp(platform);
                    }
                }
            }
            */
            
            if (rightCollisionCurrent = collideRight(platform)) {
                position.x = rightCollisionX;
            }
            if (leftCollisionCurrent = collideLeft(platform)) {
                position.x = leftCollisionX;
            }
            if (upCollisionCurrent = collideUp(platform)) {
                position.y = upCollisionY;
            }
            if (downCollisionCurrent = collideDown(platform)) {
                position.y = downCollisionY;
            }
            
            downCollision = downCollisionCurrent || downCollision;
            rightCollision = rightCollisionCurrent || rightCollision;
            leftCollision = leftCollisionCurrent || leftCollision;
            upCollision = upCollisionCurrent || upCollision;

            if (upCollisionCurrent && platform instanceof QuestionBlock) {
                QuestionBlock questionBlock = (QuestionBlock) platform;
                if (this instanceof Player && questionBlock.isActive) {
                    questionBlock.isActive = false;
                    questionBlock.emptyBlock();
                    powerUps.add(new SuperMushroom(questionBlock.position.x, questionBlock.position.y - questionBlock.height, true));
                }
                
            }
            
            
            if (rightCollisionCurrent && 
                platform.breakability.get("left") != 0 && 
                breakingValue.get("right") >= platform.breakability.get("left")
            ) {
                rightCollision = rightCollisionOld;
                remove = true;
            }
            if (leftCollisionCurrent &&
                platform.breakability.get("right") != 0 &&
                breakingValue.get("left") >= platform.breakability.get("right")
            ) {
                leftCollision = leftCollisionOld;
                remove = true;
            }
            if (downCollisionCurrent && 
                platform.breakability.get("up") != 0 && 
                breakingValue.get("down") >= platform.breakability.get("up")
            ) {
                downCollision = downCollisionOld;
                remove = true;
            }
            if (upCollisionCurrent && 
                platform.breakability.get("down") != 0 &&
                breakingValue.get("up") >= platform.breakability.get("down")
            ) {
                upCollision = upCollisionOld;
                remove = true;
            }

            if (remove) {
                position.y = positionYOld;
                position.x = positionXOld;
                killedPlatforms.add(i);
            }
        }
        
        Collections.sort(killedPlatforms, Collections.reverseOrder());
        
        
        for (int killedPlatformIndex : killedPlatforms) {

            platforms.remove(killedPlatformIndex);
        }

    }

    

    void moveLeft() {
        if (!leftCollision) {
            speed.x = -movementSpeed; // Regola la velocità di movimento
        }
    }

    void moveRight() {
        if (!rightCollision) {
            speed.x = movementSpeed; // Regola la velocità di movimento
        }
    }

    boolean moveAuto(boolean isRight) {
        if (isRight) {
            if (!rightCollision) {
                speed.x = movementSpeed;
            } else {
                speed.x = -movementSpeed;
                isRight = false;
            }
        } else {
            if (!leftCollision) {
                speed.x = -movementSpeed;
            } else {
                speed.x = movementSpeed;
                isRight = true;
            }
        }

        return isRight;
    }

    @Override
    void draw() {
        super.draw();
    }
}
