class PowerUp extends Entity {
    
    boolean isActive = true;
    

    PowerUp(String path, PVector initialPosition, float gravity, float speed, float smallJumpValue, float superJumpValue) {
        //super(path: String, posizione iniziale: PVector, salute: int, gravità: float, velocità: float, salto: float)
        super(path, new PVector(initialPosition.x, GAME_HEIGHT-initialPosition.y), gravity, speed, smallJumpValue, superJumpValue, -1, -1, -1, -1);

    }

    @Override
    void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
        super.update(platforms, powerUps);
    }
    
    @Override
    void takeDamage(int damage) {
      if (damage == -1) {
        isActive = false;
      }
    }
    
    @Override
    void draw() {
        super.draw();
    }
}
