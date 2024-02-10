class Level2 extends Level {
    Level2() {
        super(overworld_ost);
        reset();
    }

    @Override
    void reset() {
        super.reset();;

        length = 7200;
        cameraSpeed = 5;
        playerInitialPosition = new PVector(480, GAME_HEIGHT-1200);
        backgroundColor = BACKGROUND_1;
        tag = "level_2";
        name = "Level 2";
        id = 2;


        platforms.add(ground(0, 120, 17, 1));
        
        enemies.add(new Goomba(1200, 120 + 90, false));
        enemies.add(new Goomba(1200 + 240, 120 + 90, false));
        
        powerUps.add(new Coin(1440 + 35 - 600, 360));
        powerUps.add(new Coin(1440 - 600 + 120 + 35, 360));
        powerUps.add(new Coin(1440 - 600 + 35 + 120, 360 + 120));
        powerUps.add(new Coin(1440 - 600 + 35 + 240, 360));

        powerUps.add(new Coin(1440 + 35, 360));
        powerUps.add(new Coin(1440 + 120 + 35, 360));
        powerUps.add(new Coin(1440 + 120 + 35, 360 + 120));
        powerUps.add(new Coin(1440 + 240 + 35, 360));

        platforms.add(block(2040 + 240, 240, 1, 1));
        platforms.add(block(2040 + 600, 360, 1, 1));
        platforms.add(block(2040 + 960, 480, 1, 1));
        
        platforms.add(ground(2040 + 1320, 600, 17, 1));
        platforms.add(question_block(2040 + 1320, 720, FIRE_FLOWER, true));
        //enemies.add(new GreenKoopaTroopa(2040 + 1320 + 240, 960, true));
        enemies.add(new Goomba(2040 + 1320 + 240, 960, true));
        enemies.add(new GreenKoopaTroopa(2040 + 1320 + 600, 960, true));
        enemies.add(new Goomba(2040 + 1320 + 960, 960, true));
        platforms.add(block(2040 + 1200 + 2040, 720, 1, 1));
        
        platforms.add(ground(5280 + 360, 120, 17, 1));
        platforms.add(brick(5280 + 360, 240, 1, 1));
        enemies.add(new GreenKoopaTroopa(5280 + 600, 960, false));

        platforms.add(block(5280 + 1320, 240, 1, 1));
        powerUps.add(new Flag(5280 + 1320 + 52, 680 + 240));
        
        
    }
}
