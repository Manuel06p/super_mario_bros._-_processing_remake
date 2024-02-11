/**
 * Class used to manage the level Level3. It extends the Level class.
 */
class Level3 extends Level {

    /**
     * Create a new Level3 object.
     */
    Level3() {
        super(overworld_ost);
        reset();
    }
    //

    /**
     * Reset Level3 parameters.
     */
    @Override
    void reset() {
        super.reset();;

        length = 7200;
        cameraSpeed = 5;
        playerInitialPosition = new PVector(480, GAME_HEIGHT-1200);
        backgroundColor = BACKGROUND_1;
        tag = "level_3";
        name = "Level 3";
        id = 3;


        platforms.add(ground(0, 120, 17, 1));
        platforms.add(ground(2040, 120, 17, 1));
        
        enemies.add(new Goomba(960 + 120*2, 120 + 90, false));
        enemies.add(new Goomba(960 + 120*4, 120 + 90, false));
        enemies.add(new Goomba(960 + 120*6, 120 + 90, false));
        enemies.add(new Goomba(960 + 120*8, 120 + 90, false));
        enemies.add(new Goomba(960 + 120*10, 120 + 90, false));
        enemies.add(new Goomba(960 + 120*12, 120 + 90, false));
        enemies.add(new Goomba(960 + 120*14, 120 + 90, false));

        
        powerUps.add(new Coin(720 + 35, 120 + 720)); powerUps.add(new Coin(720 + 35 + 120, 120 + 720)); powerUps.add(new Coin(720 + 35 + 240, 120 + 720));
        powerUps.add(new Coin(720 + 35, 120 + 600));
        powerUps.add(new Coin(720 + 35, 120 + 480)); powerUps.add(new Coin(720 + 35 + 120, 120 + 480)); powerUps.add(new Coin(720 + 35 + 240, 120 + 480));
        powerUps.add(new Coin(720 + 35, 120 + 360));
        powerUps.add(new Coin(720 + 35, 120 + 240)); powerUps.add(new Coin(720 + 35 + 120, 120 + 240)); powerUps.add(new Coin(720 + 35 + 240, 120 + 240));

        
        powerUps.add(new Coin(1200 + 35, 120 + 720)); powerUps.add(new Coin(1200 + 35 + 120, 120 + 720));                                                                                               powerUps.add(new Coin(1200 + 35 + 480, 120 + 720));
        powerUps.add(new Coin(1200 + 35, 120 + 600));                                               powerUps.add(new Coin(1200 + 35 + 240, 120 + 600));                                                 powerUps.add(new Coin(1200 + 35 + 480, 120 + 600));
        powerUps.add(new Coin(1200 + 35, 120 + 480));                                               powerUps.add(new Coin(1200 + 35 + 240, 120 + 480));                                                 powerUps.add(new Coin(1200 + 35 + 480, 120 + 480));
        powerUps.add(new Coin(1200 + 35, 120 + 360));                                               powerUps.add(new Coin(1200 + 35 + 240, 120 + 360));                                                 powerUps.add(new Coin(1200 + 35 + 480, 120 + 360));
        powerUps.add(new Coin(1200 + 35, 120 + 240));                                                                                              powerUps.add(new Coin(1200 + 35 + 360, 120 + 240));  powerUps.add(new Coin(1200 + 35 + 480, 120 + 240));
     
        
        powerUps.add(new Coin(1920 + 35, 120 + 720)); powerUps.add(new Coin(1920 + 35 + 120, 120 + 720));
        powerUps.add(new Coin(1920 + 35, 120 + 600));                                                        powerUps.add(new Coin(1920 + 35 + 240, 120 + 600));
        powerUps.add(new Coin(1920 + 35, 120 + 480));                                                        powerUps.add(new Coin(1920 + 35 + 240, 120 + 480));
        powerUps.add(new Coin(1920 + 35, 120 + 360));                                                        powerUps.add(new Coin(1920 + 35 + 240, 120 + 360));
        powerUps.add(new Coin(1920 + 35, 120 + 240)); powerUps.add(new Coin(1920 + 35 + 120, 120 + 240));
    }
    //

}
//