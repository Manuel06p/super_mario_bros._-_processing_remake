/**
 * Class used to manage the platform QuestionBlock. It extends the Platform class.
 */
class QuestionBlock extends Platform {
    
    boolean isActive = true;
    String powerUp = "";
    boolean isRight;

    /**
     * Create a new Platform object.
     * - path: texture path.
     * - initialPosition: PVector containing coordinates of the starting position.
     * - breakabilityUp: breakability value up.
     * - breakabilityDown: breakability value down.
     * - breakabilityLeft: breakability value left.
     * - breakabilityRight: breakability value right.
     * - powerUp: power up type.
     * - isRight: starts moving to the right.
     */
    QuestionBlock(String path, PVector initialPosition, int breakabilityUp, int breakabilityDown, int breakabilityLeft, int breakabilityRight, String powerUp, boolean isRight) {
        super(
            path, // Texture string path
            initialPosition, // Initial position
            breakabilityUp, // Breaking up value
            breakabilityDown, // Breaking down value
            breakabilityLeft, // Breaking left value
            breakabilityRight // Breaking right value
        );

        this.powerUp = powerUp;
        this.isRight = isRight;

        animation(imageDictionary.get("question_block"), 10);
        currentAnimation = 0;
    }
    //
    
    /**
     * Change the animation when the block is empty.
     */
    void emptyBlock() {
        animation(imageDictionary.get("question_block_empty"), 0);
        currentAnimation = 1;
    }
    //

    /**
     * Manage the question block hit.
     */
    void hitQuestionBlock() {
        this.isActive = false;
        this.emptyBlock();
        if (this.powerUp == SUPER_MUSHROOM) {
            level.powerUps.add(new SuperMushroom(this.position.x, GAME_HEIGHT - this.position.y + 90, this.isRight));
            powerup_appears_effect.play();
        } else if (this.powerUp == ONE_UP_MUSHROOM) {
            level.powerUps.add(new OneUpMushroom(this.position.x, GAME_HEIGHT - this.position.y + 90, this.isRight));
            powerup_appears_effect.play();
        } else if (this.powerUp == FIRE_FLOWER) {
            level.powerUps.add(new FireFlower(this.position.x + 15, GAME_HEIGHT - this.position.y + 90));
            powerup_appears_effect.play();
        }
    }
    //

    /**
     * Update the QuestionBlock status.
     * - platforms: ArrayList of platforms.
     * - powerUps: ArrayList of power ups.
     */
    @Override
    void update() {
        super.update();
        
        if (isActive) {
            if (collideDownTolerant(player) && player.breakingValue.get("up") >= 1) {
                hitQuestionBlock();
            } else {
                for (Enemy enemy : level.enemies) {
                if (enemy instanceof Koopa) {
                    Koopa koopa = (Koopa) enemy;
                    if (koopa.movingShell && (collideRightTolerant(koopa) || collideLeftTolerant(koopa))) {
                        hitQuestionBlock();
                    }
                }
            }
            }
        }
    }
    //

    /**
     * Draw the QuestionBlock.
     */
    @Override
    void draw() {
        super.draw();
    }
    //

}
//