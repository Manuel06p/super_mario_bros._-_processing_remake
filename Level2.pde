class Level2 extends Level {
    Level2() {
        super(overworld_ost);
        reset();
    }

    @Override
    void reset() {
        super.reset();;

        length = 9240;
        cameraSpeed = 5;
        playerInitialPosition = new PVector(480, GAME_HEIGHT-1200);
        backgroundColor = BACKGROUND_1;
        tag = "level_2";
        name = "Level 2";
        id = 2;


        platforms.add(ground(0, 120, 17, 1));
        
        platforms.add(block(2040 + 240, 240, 1, 1));
        platforms.add(block(2040 + 600, 360, 1, 1));
        platforms.add(block(2040 + 960, 480, 1, 1));
        
        platforms.add(ground(2040 + 1320, 600, 17, 1));
        platforms.add(question_block(2040 + 1320, 720, FIRE_FLOWER, true));
        //enemies.add(new GreenKoopaTroopa(2040 + 1320 + 240, 960, true));
        enemies.add(new Goomba(2040 + 1320 + 240, 960, true));
        enemies.add(new GreenKoopaTroopa(2040 + 1320 + 600, 960, true));
        enemies.add(new Goomba(2040 + 1320 + 960, 960, true));
        platforms.add(block(2040 + 1320 + 2040, 720, 1, 1));
        
        
        platforms.add(block(7200 + 1200, 240, 1, 1));
        powerUps.add(new Flag(7200 + 1200 + 52, 800 + 240));
        
    }
}
