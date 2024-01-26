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

    StringBuilder coinHudString = new StringBuilder();
    Text coinHudText;
    Sprite coinHudIcon;
    

    PVector playerInitialPosition;

    Level(Sound music) {
        this.music = music;

        //HUD
        coinHudString.append("x00");
        coinHudIcon = new Sprite(POWER_UP + COIN_0, new PVector(70, 70));
        coinHudText = new Text(STANDARD_FONT, coinHudIcon.position.x + 62, coinHudIcon.position.y + 62, coinHudString, 255, 40);

        reset();
        this.cameraX = 0;
    }

    void reset() {
        music.loop();
        cameraX = 0;
        platforms = new ArrayList<Platform>();
        enemies = new ArrayList<Enemy>();
        powerUps = new ArrayList<PowerUp>();
    }

    void update() {
        // Aggiorna la posizione della telecamera in base alla velocità specifica del livello
        

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
        
        if ((cameraX + GAME_WIDTH) - (player.position.x + player.width) < 800) { //Verso destra
            cameraX += cameraSpeed;
        } else if (player.position.x - cameraX < 800 && cameraX > 0) { //Verso sinistra
            cameraX -= cameraSpeed;
        }
        
    }

    void draw() {
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

    void drawHud() {
        coinHudIcon.draw();
        coinHudText.draw();
    }
}
