class PowerUp extends Entity {
    
    boolean isActive = true;
    

    PowerUp(String path, PVector initialPosition, float gravity, float speed, float jumpValue) {
        //super(path: String, posizione iniziale: PVector, salute: int, gravità: float, velocità: float, salto: float)
        
        super(path, initialPosition, gravity, speed, jumpValue, -1, -1, -1, -1);

    }

    @Override
    void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
        super.update(platforms, powerUps);
    }
    
    @Override
    void draw() {
        super.draw();
    }
}

