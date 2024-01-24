class SuperMushroom extends PowerUp {    
    boolean isRight;

    SuperMushroom(float x, float y, boolean isRight) {
        //super(path: String, posizione iniziale: PVector, gravità: float, velocità: float, salto: float)
        
        super(POWER_UP + SUPER_MUSHROOM, new PVector(x, y), GRAVITY, 5, 0, 0);

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
