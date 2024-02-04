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

    @Override
    void update() {
        super.update();
    }

    @Override
    void draw() {
        super.draw();
    }
}
