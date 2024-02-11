/**
 * Class used to manage the level Level1. It extends the Level class.
 */
class Level1 extends Level {

    /**
     * Create a new Level1 object.
     */
    Level1() {
        super(overworld_ost);
        reset();
    }
    //

    /**
     * Reset Level1 parameters.
     */
    @Override
    void reset() {
        super.reset();;
        backgroundColor = BACKGROUND_1;
        length = 9240;
        cameraSpeed = 5;
        playerInitialPosition = new PVector(480, GAME_HEIGHT-1200);
        tag = "level_1";
        name = "Level 1";
        id = 1;

        platforms.add(ground(0, 120, 17, 1));

        platforms.add(brick(1200, 520, 1 ,1));
        platforms.add(question_block(1320, 520, SUPER_MUSHROOM, false));
        platforms.add(brick(1440, 520, 1, 1));

        enemies.add(new Goomba(1680, 210, false));
        enemies.add(new Goomba(1920, 210, false));     
        
        powerUps.add(new Coin(2040 + 35, 520));
        powerUps.add(new Coin(2160 + 35, 520));
        powerUps.add(new Coin(2280 + 35, 520));

        platforms.add(ground(2400, 120, 17, 1));

        platforms.add(block(2400 + 720, 240, 5, 1));
        platforms.add(block(2400 + 840, 360, 3, 1));
        platforms.add(block(2400 + 960, 480, 1, 1));

        platforms.add(brick(2400 + 600, GAME_HEIGHT, 1, 1));
        platforms.add(brick(2400 + 600, GAME_HEIGHT - 120, 1, 1));
        platforms.add(brick(2400 + 720, GAME_HEIGHT - 120, 1, 1));
        platforms.add(brick(2400 + 840, GAME_HEIGHT - 120, 1, 1));
        platforms.add(brick(2400 + 960, GAME_HEIGHT - 120, 1, 1));
        platforms.add(brick(2400 + 1080, GAME_HEIGHT - 120, 1, 1));
        platforms.add(brick(2400 + 1200, GAME_HEIGHT - 120, 1, 1));
        platforms.add(brick(2400 + 1320, GAME_HEIGHT - 120, 1, 1));
        platforms.add(brick(2400 + 1320, GAME_HEIGHT, 1, 1));

        powerUps.add(new OneUpMushroom(2400 + 840, GAME_HEIGHT - 20, true));

        platforms.add(ground(4800, 120, 17, 1));

        platforms.add(block(4800 + 120, 480 + 20, 1, 1));
        platforms.add(brick(4800 + 240, 600 + 20, 1, 1));
        platforms.add(brick(4800 + 240, 360 + 20, 1, 1));
        platforms.add(brick(4800 + 360, 480 + 20, 1, 1));
        powerUps.add(new Coin(4800 + 240 + 35, 485));
        
        enemies.add(new GreenKoopaTroopa(4800 + 360 + 480, 600 + 20 + 140, true));
        
        platforms.add(block(4800 + 480, 480 + 20, 9, 1));
        powerUps.add(new Coin(5280 + 120 + 35, 365));
        powerUps.add(new Coin(5280 + 360 + 35, 365));
        powerUps.add(new Coin(5280 + 600 + 35, 365));
        powerUps.add(new Coin(5280 + 840 + 35, 365));
        
        platforms.add(brick(6240 + 120, 480 + 20, 1, 1));
        platforms.add(brick(6240 + 240, 600 + 20, 1, 1));
        platforms.add(brick(6240 + 240, 360 + 20, 1, 1));
        platforms.add(brick(6240 + 360, 480 + 20, 1, 1));
        powerUps.add(new Coin(6240 + 240 + 35, 485));

        platforms.add(ground(7200, 120, 17, 1));
        
        platforms.add(block(7200 + 240, 240, 5, 1));
        platforms.add(block(7200 + 360, 360, 4, 1));
        platforms.add(block(7200 + 480, 480, 3, 1));
        platforms.add(block(7200 + 600, 600, 2, 1));
        platforms.add(block(7200 + 720, 720, 1, 1));

        platforms.add(block(7200 + 1200, 240, 1, 1));
        powerUps.add(new Flag(7200 + 1200 + 52, 680 + 240));
    }
    //

}
//