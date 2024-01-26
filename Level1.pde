class Level1 extends Level {
    Level1() {
        super(overworld_ost);
        reset();
    }

    @Override
    void reset() {
        super.reset();;

        length = 11520;
        cameraSpeed = 5;
        playerInitialPosition = new PVector(50, 50);
        tag = "level_1";
        name = "Livello 1";
        id = 1;


        platforms.add(ground(0, 120));
        platforms.add(single_brick(1080, 500));
        platforms.add(question_block(1200, 500, SUPER_MUSHROOM));
        platforms.add(single_brick(1320, 500));
        platforms.add(single_brick(1800, 240));
        //platforms.add(single_brick(800, 240));


        powerUps.add(new Coin(1500, 500));
        powerUps.add(new Coin(1600, 500));
        powerUps.add(new Coin(1700, 500));
        powerUps.add(new Coin(1800, 500));
        powerUps.add(new Coin(1900, 500));
        powerUps.add(new Coin(2000, 500));
        powerUps.add(new Coin(2100, 500));
        powerUps.add(new Coin(2200, 500));
        powerUps.add(new Coin(2300, 500));
        powerUps.add(new Coin(2400, 500));
        powerUps.add(new Coin(2500, 500));
        powerUps.add(new Coin(2600, 500));
        powerUps.add(new Coin(2700, 500));
        powerUps.add(new Coin(2800, 500));
        powerUps.add(new Coin(2900, 500));

        enemies.add(new Goomba(1000, 350, false));
    }
}
