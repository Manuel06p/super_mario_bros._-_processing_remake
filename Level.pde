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
    

    PVector playerInitialPosition;

    Level(ArrayList<Platform> platforms, ArrayList<Enemy> enemies, ArrayList<PowerUp> powerUps, int length, String tag, String name, int id, float cameraSpeed, PVector playerInitialPosition) {
        this.platforms = platforms;
        this.enemies = enemies;
        this.powerUps = powerUps;
        this.length = length;
        this.tag = tag;
        this.name = name;
        this.id = id;
        this.cameraX = 0;
        this.cameraSpeed = cameraSpeed;
        this.playerInitialPosition = playerInitialPosition;
        
    }

    void update() {
        // Aggiorna la posizione della telecamera in base alla velocità specifica del livello
        cameraX += cameraSpeed;
        for (Enemy enemy : enemies) {
            enemy.update(platforms, powerUps);
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
