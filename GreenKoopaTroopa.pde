class GreenKoopaTroopa extends Koopa{


    GreenKoopaTroopa(float x, float y, boolean isRight) {
        super(  x,
                y,
                isRight,
                (GREEN_KOOPA_TROOPA + LX + GREEN_KOOPA_TROOPA_0)
        );
        
        
        livingKoopa();
        
    }

    @Override
    void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
        super.update(platforms, powerUps);
    }

    @Override
    void draw() {
        super.draw();
    }

    @Override
    void staticShell() {
        super.staticShell();

        animation(imageDictionary.get("green_koopa_troopa_shell_0"), 0);
        currentAnimation = 1;

    }

    @Override
    void movingShell() {
        super.movingShell();
    }

    @Override
    void livingKoopa() {
        super.livingKoopa();

        animation(imageDictionary.get("green_koopa_troopa_" + booleanSide.get(isRight)), 7);
        currentAnimation = 0;
    }
}