/**
 * Class used to manage the Level.
 */
class Level {

    ArrayList<Platform> platforms;
    ArrayList<Enemy> enemies;
    ArrayList<PowerUp> powerUps;
    int length;
    String tag;
    String name;
    int id;
    float cameraX;
    float cameraSpeed;
    Sound music;
    color backgroundColor;
    
    Text coinHudText;
    Sprite coinHudIcon;
    
    Text lifeHudText;
    Sprite lifeHudIcon;

    PVector playerInitialPosition;

    boolean isFinished = false;

    /**
     * Create a new Level object.
     * - music: level background music.
     */
    Level(Sound music) {
        this.music = music;

        coinHudIcon = new Sprite(POWER_UP + COIN_0, new PVector(400, 70));
        coinHudText = new Text(STANDARD_FONT, coinHudIcon.position.x + 62, coinHudIcon.position.y + 62, player.coinHudString, 255, 40);

        lifeHudIcon = new Sprite(POWER_UP + ONE_UP_MUSHROOM, new PVector(70, 70));
        lifeHudText = new Text(STANDARD_FONT, lifeHudIcon.position.x + 98, lifeHudIcon.position.y + 62, player.lifeHudString, 255, 40);

        reset();
        this.cameraX = 0;
    }
    //

    /**
     * Reset Level parameters.
     */
    void reset() {
        music.loop();
        cameraX = 0;
        isFinished = false;
        platforms = new ArrayList<Platform>();
        enemies = new ArrayList<Enemy>();
        powerUps = new ArrayList<PowerUp>();
    }
    //

    /**
     * Manage the Level end.
     */
    void finished() {
        isFinished = true;
        music.stop();
        course_clear_effect.play();
        updateNextLevelName();
    }
    //

    /**
     * Update the Level status.
     */
    void update() {
        ArrayList<Integer> killedEnemies = new ArrayList<Integer>();

        for (int i = 0; i < enemies.size(); i++) {
            Enemy enemy = enemies.get(i);
            enemy.update(platforms, powerUps);
            if (!enemy.isActive) {
                killedEnemies.add(i);
            }
        }
        
        Collections.sort(killedEnemies, Collections.reverseOrder());

        for (int killedEnemy : killedEnemies) {
            enemies.remove(killedEnemy);
        }

        for (Platform platform : platforms) {
            platform.update();
        }
        
        ArrayList<Integer> killedPowerUps = new ArrayList<Integer>();
        
        for (int i = 0; i < powerUps.size(); i++) {
            PowerUp powerUp = powerUps.get(i);
            powerUp.update(platforms, powerUps);
            if (!powerUp.isActive) {
                killedPowerUps.add(i);
            }
        }
        
        Collections.sort(killedPowerUps, Collections.reverseOrder());

        for (int killedPowerUp : killedPowerUps) {
            powerUps.remove(killedPowerUp);
        }
        

        if ((cameraX + GAME_WIDTH) - (player.position.x + player.width) < 800 && cameraX + GAME_WIDTH < length) {
            cameraX += cameraSpeed;
        } else if (player.position.x - cameraX < 800 && cameraX > 0) {
            cameraX -= cameraSpeed;
        }
    }
    //

    /**
     * Draw the Level.
     */
    void draw() {
      
        background(backgroundColor);  
      
        for (Platform platform : platforms) {
            platform.draw();
        }

        for (Enemy enemy : enemies) {
            enemy.draw();
        }

        for (PowerUp powerUp: powerUps) {
            powerUp.draw();
        }
    }
    //

    /**
     * Draw the Level HUD.
     */
    void drawHud() {
        coinHudIcon.draw();
        coinHudText.draw();
        lifeHudIcon.draw();
        lifeHudText.draw();
    }
    //

}
//