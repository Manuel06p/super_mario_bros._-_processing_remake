class QuestionBlock extends Platform {
    
    boolean isActive = true;

    QuestionBlock(String path, PVector initialPosition, boolean hasBounds, int breakabilityUp, int breakabilityDown, int breakabilityLeft, int breakabilityRight) {
        super(path, initialPosition, hasBounds, breakabilityUp, breakabilityDown, breakabilityLeft, breakabilityRight);


        imageDictionary.put("question_block", new ArrayList<PImage>() {{
            add(loadImage(QUESTION_BLOCK + QUESTION_BLOCK_1));
            add(loadImage(QUESTION_BLOCK + QUESTION_BLOCK_2));
            add(loadImage(QUESTION_BLOCK + QUESTION_BLOCK_3));
        }});

        imageDictionary.put("question_block_empty", new ArrayList<PImage>() {{
            add(loadImage(QUESTION_BLOCK + QUESTION_BLOCK_EMPTY));
        }});
        
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