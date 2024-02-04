class Entity extends Sprite {
    
    

    final int JUMP_TIMEOUT_VALUE = 5;
    int jumpTimeout;
    float gravity;
    float jumpValue;
    float smallJumpValue;
    float superJumpValue;
    float jumpStatus;
    float movementSpeed;

    HashMap<String, Integer> breakingValue = new HashMap<String, Integer>();

    boolean horizontalBreak;
    boolean verticalBreak;



    boolean jump = false;

    Entity(String path, PVector initialPosition, float gravity, float speed, float smallJumpValue, float superJumpValue, int breakingValueUp, int breakingValueDown, int breakingValueLeft, int breakingValueRight) {
        super(path, initialPosition);
        this.gravity = gravity;
        this.movementSpeed = speed;
        this.speed.y = 0;
        jumpTimeout = 0;
        

        this.smallJumpValue = smallJumpValue;
        this.superJumpValue = superJumpValue;

        this.jumpValue = this.smallJumpValue;


        this.breakingValue.put("up", breakingValueUp);
        this.breakingValue.put("down", breakingValueDown);
        this.breakingValue.put("left", breakingValueLeft);
        this.breakingValue.put("right", breakingValueRight);

        horizontalBreak = false;
        verticalBreak = false;
        this.speed.x = movementSpeed;
    }

    void jump() {
        
    }

    void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
        
        super.update();
        
        if (exceedsLowerBound()) {
          this.takeDamage(-1);
        } else {
            
            checkCollisions(platforms, powerUps);

            if (!downCollision && jumpStatus == 0 ) {
                applyGravity();
            } else if ((jump || jumpStatus > 0) && jumpTimeout == 0) {
                if (jumpStatus<jumpValue && !upCollision) {
                    jumpStatus += 1;
                    jump = false;
                    applyInvertedGravity();
                } else if (jump && jumpValue == smallJumpValue && jumpStatus > 3) {
                    jumpValue = superJumpValue;
                } else {
                    jumpValue = smallJumpValue;
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

        horizontalBreak = false;
        verticalBreak = false;

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
                    if (questionBlock.powerUp == SUPER_MUSHROOM) {
                        powerUps.add(new SuperMushroom(questionBlock.position.x, questionBlock.position.y + questionBlock.height - 10, questionBlock.isRight));
                        powerup_appears_effect.play();
                    } else if (questionBlock.powerUp == ONE_UP_MUSHROOM) {
                        powerUps.add(new OneUpMushroom(questionBlock.position.x, questionBlock.position.y + questionBlock.height - 10, questionBlock.isRight));
                        powerup_appears_effect.play();
                    } else if (questionBlock.powerUp == FIRE_FLOWER) {
                        powerUps.add(new FireFlower(questionBlock.position.x + 15, questionBlock.position.y + questionBlock.height - 10));
                        powerup_appears_effect.play();
                    }
                }
                
            }
            
            
            if (rightCollisionCurrent && 
                platform.breakability.get("left") != 0 && 
                breakingValue.get("right") >= platform.breakability.get("left")
            ) {
                rightCollision = rightCollisionOld;
                horizontalBreak = true;
                remove = true;
            }
            if (leftCollisionCurrent &&
                platform.breakability.get("right") != 0 &&
                breakingValue.get("left") >= platform.breakability.get("right")
            ) {
                leftCollision = leftCollisionOld;
                horizontalBreak = true;
                remove = true;
            }
            if (downCollisionCurrent && 
                platform.breakability.get("up") != 0 && 
                breakingValue.get("down") >= platform.breakability.get("up")
            ) {
                downCollision = downCollisionOld;
                verticalBreak = true;
                remove = true;
            }
            if (upCollisionCurrent && 
                platform.breakability.get("down") != 0 &&
                breakingValue.get("up") >= platform.breakability.get("down")
            ) {
                upCollision = upCollisionOld;
                verticalBreak = true;
                remove = true;
            }


            if (remove) {
                position.y = positionYOld;
                position.x = positionXOld;
                killedPlatforms.add(i);
            }
        }

        if (horizontalBreak || verticalBreak) {
            break_block_effect.play();
        }
        
        Collections.sort(killedPlatforms, Collections.reverseOrder());
        
        
        for (int killedPlatformIndex : killedPlatforms) {

            platforms.remove(killedPlatformIndex);
        }

    }

    void directionChanged(boolean isRightNew) {

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
        boolean isRightNew = isRight;
        if (isRightNew) {
            if (rightCollision || horizontalBreak) {
                isRightNew = false;
                directionChanged(isRightNew);
                speed.x = -abs(speed.x);
                
                
            } else {
                speed.x = abs(speed.x);
            }
        } else {
            if (leftCollision || horizontalBreak) {
                isRightNew = true;

                directionChanged(isRightNew);
                
                speed.x = abs(speed.x);
                
            } else {
                speed.x = -abs(speed.x);
            }
        }

        return isRightNew;
    }
    
    void takeDamage(int damage) {
      
    }

    @Override
    void draw() {
        super.draw();
    }
}
