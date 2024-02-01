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
        playerInitialPosition = new PVector(480, GAME_HEIGHT-1200);
        tag = "level_1";
        name = "Livello 1";
        id = 1;


        platforms.add(ground_17x1(0, 120));
        platforms.add(brick(1200, 520));
        platforms.add(question_block(1320, 520, FIRE_FLOWER));
        platforms.add(brick(1440, 520));

        //enemies.add(new Goomba(1680, 210, false));
        //enemies.add(new Goomba(1920, 210, false));
        enemies.add(new GreenKoopaTroopa(1920, 120 + 135, false));
        

        powerUps.add(new Coin(2040 + 35, 520));
        powerUps.add(new Coin(2160 + 35, 520));
        powerUps.add(new Coin(2280 + 35, 520));

        platforms.add(ground_17x1(2400, 120));

        platforms.add(block(2400 + 720, 240));
        platforms.add(block(2400 + 840, 360));
        platforms.add(block(2400 + 960, 480));
        platforms.add(block(2400 + 1080, 360));
        platforms.add(block(2400 + 1200, 240));

        platforms.add(brick(2400 + 600, GAME_HEIGHT));
        platforms.add(brick(2400 + 600, GAME_HEIGHT - 120));
        platforms.add(brick(2400 + 720, GAME_HEIGHT - 120));
        platforms.add(brick(2400 + 840, GAME_HEIGHT - 120));
        platforms.add(brick(2400 + 960, GAME_HEIGHT - 120));
        platforms.add(brick(2400 + 1080, GAME_HEIGHT - 120));
        platforms.add(brick(2400 + 1200, GAME_HEIGHT - 120));
        platforms.add(brick(2400 + 1320, GAME_HEIGHT - 120));
        platforms.add(brick(2400 + 1320, GAME_HEIGHT));

        powerUps.add(new OneUpMushroom(2400 + 840, GAME_HEIGHT - 20, true));

        platforms.add(ground_17x1(4800, 120));

        platforms.add(brick(4800 + 120, 600 + 20));
        platforms.add(brick(4800 + 120, 480 + 20));
        platforms.add(brick(4800 + 240, 600 + 20));
        platforms.add(brick(4800 + 240, 360 + 20));
        platforms.add(brick(4800 + 360, 480 + 20));
        powerUps.add(new Coin(4800 + 240 + 35, 485));

        
    }
}
