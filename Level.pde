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
    

    PVector playerInitialPosition;

    Level(Sound music) {
        this.music = music;
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
        cameraX += cameraSpeed;

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
        /**/
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
}
