class QuestionBlock extends Platform {
    
    boolean isActive = true;
    String powerUp = "";
    boolean isRight;

    QuestionBlock(String path, PVector initialPosition, boolean hasBounds, int breakabilityUp, int breakabilityDown, int breakabilityLeft, int breakabilityRight, String powerUp, boolean isRight) {
        super(path, initialPosition, hasBounds, breakabilityUp, breakabilityDown, breakabilityLeft, breakabilityRight);
        this.powerUp = powerUp;
        this.isRight = isRight;
          
        
        animation(imageDictionary.get("question_block"), 10);
        currentAnimation = 0;
    }

    void emptyBlock() {
        animation(imageDictionary.get("question_block_empty"), 0);
        currentAnimation = 1;
    }

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

    @Override
    void draw() {
        super.draw();
    }
}
