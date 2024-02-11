/**
 * Class used to manage the sprite Entity. It extends the Sprite class.
 */
class Entity extends Sprite {
    
    final int JUMP_TIMEOUT_VALUE = 5;
    int jumpTimeout;
    float gravity;
    float jumpValue;
    float smallJumpValue;
    float superJumpValue;
    float jumpStatus;
    float movementSpeed;

    HashMap<String, Integer> breakingValue;

    boolean horizontalBreak;
    boolean verticalBreak;

    boolean jump = false;

    /**
     * Create a new Entity object.
     * - path: texture path.
     * - initialPosition: PVector containing coordinates of the starting position.
     * - gravity: gravity value.
     * - speed: speed value.
     * - smallJumpValue: small jump value.
     * - superJumpValue: super jump value.
     * - breakingValueUp: breaking value up.
     * - breakingValueDown: breaking value down.
     * - breakingValueLeft: breaking value left.
     * - breakingValueRight: breaking value right.
     */
    Entity(String path, PVector initialPosition, float gravity, float speed, float smallJumpValue, float superJumpValue, int breakingValueUp, int breakingValueDown, int breakingValueLeft, int breakingValueRight) {
        
        super(path, initialPosition);
        this.gravity = gravity;
        this.movementSpeed = speed;
        this.speed.y = 0;
        jumpTimeout = 0;
        this.smallJumpValue = smallJumpValue;
        this.superJumpValue = superJumpValue;
        this.jumpValue = this.smallJumpValue;
        breakingValue = new HashMap<String, Integer>();
        this.breakingValue.put("up", breakingValueUp);
        this.breakingValue.put("down", breakingValueDown);
        this.breakingValue.put("left", breakingValueLeft);
        this.breakingValue.put("right", breakingValueRight);
        horizontalBreak = false;
        verticalBreak = false;
        this.speed.x = movementSpeed;
    }
    //

    /**
     * Update the Entity status.
     * - platforms: ArrayList of platforms.
     * - powerUps: ArrayList of power ups.
     */
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
    //

    /**
     * Manage the Entity when it get damaged.
     * - damage: damage received value.
     */
    void takeDamage(int damage) {

    }
    //

    /**
     * Manage the change of direction of the Entity.
     * - isRightNew: the new movement direction is to the right.
     */
    void directionChanged(boolean isRightNew) {

    }
    //

    /**
     * Apply gravity by changing the vertical speed.
     */
    void applyGravity() {
        speed.y = gravity;
    }
    //
    
    /**
    * Apply negative gravity by changing the vertical speed.
    */
    void applyInvertedGravity() {
        speed.y = -gravity;
    }
    //

    /**
    * Check the collision with platforms or power ups.
    * - platforms: ArrayList of platforms.
    * - powerUps: ArrayList of power ups.
    */
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
    //

    /**
     * Move to left by changing the horizontal speed.
     */
    void moveLeft() {
        if (!leftCollision) {
            speed.x = -movementSpeed;
        }
    }
    //

    /**
     * Move to right by changing the horizontal speed.
     */
    void moveRight() {
        if (!rightCollision) {
            speed.x = movementSpeed;
        }
    }
    //
    
    /**
     * Manage the automatic movement.
     * - isRight: is moving to the right.
     */
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
    //
    
    /**
     * Draw the image.
     */
    @Override
    void draw() {
        super.draw();
    }
    //

}
//