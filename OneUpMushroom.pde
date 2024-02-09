class OneUpMushroom extends PowerUp {    
  
    OneUpMushroom(float x, float y, boolean isRight) {
        //super(path: String, posizione iniziale: PVector, gravità: float, velocità: float, salto: float)
        
        super(POWER_UP + ONE_UP_MUSHROOM, new PVector(x, y), GRAVITY, 5, 0, 0, isRight);

        this.isRight = isRight;
    }

    @Override
    void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
        super.update(platforms, powerUps);     
        isRight = moveAuto(isRight);

        if (collideDown(player) || collideRight(player) || collideLeft(player) || collideUp(player)) {
            player.getLife();
            isActive = false;
        }
    }
    
    @Override
    void draw() {
        super.draw();
    }
}
