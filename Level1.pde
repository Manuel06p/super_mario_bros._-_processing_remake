class Level1 extends Level {
    Level1() {
        super(overworld_ost);
        reset();
    }

    @Override
    void reset() {
        super.reset();;

        length = 11520;
        cameraSpeed = 0.5;
        playerInitialPosition = new PVector(50, 50);
        tag = "level_1";
        name = "Livello 1";
        id = 1;


        platforms.add(ground(0, 120));
        platforms.add(single_brick(1080, 500));
        platforms.add(question_block(1200, 500));
        platforms.add(single_brick(1320, 500));
        platforms.add(single_brick(1800, 240));
        platforms.add(single_brick(800, 240));

        powerUps.add(new Coin(1500, 500));

        enemies.add(new Goomba(1000, 350, false));
    }
}