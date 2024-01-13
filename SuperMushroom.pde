class SuperMushroom extends PowerUp {    
    boolean isRight;

    SuperMushroom(float x, float y, boolean isRight) {
        //super(path: String, posizione iniziale: PVector, salute: int, gravità: float, velocità: float, salto: float)
        
        super(POWER_UP + SUPER_MUSHROOM, new PVector(x, y), 15.0, 5, 6);

        this.isRight = isRight;
    }

    @Override
    void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
        super.update(platforms, powerUps);     
        isRight = moveAuto(isRight);

        if (collideDown(player) || collideRight(player) || collideLeft(player) || collideUp(player)) {
            player.superMushroomPower();
            isActive = false;
            powerup_effect.play();
        }
    }
    
    @Override
    void draw() {
        super.draw();
    }
}

