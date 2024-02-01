class GreenKoopaTroopa extends Koopa{


    GreenKoopaTroopa(float x, float y, boolean isRight) {
        super(  x,
                y,
                isRight,
                (KOOPA + LX + GREEN_KOOPA_TROOPA + KOOPA_0),
                (GREEN_KOOPA_TROOPA)
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
    }

    @Override
    void movingShell() {
        super.movingShell();
    }

    @Override
    void livingKoopa() {
        super.livingKoopa();
    }
}