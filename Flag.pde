class Flag extends PowerUp {    


    Sprite flag;

    Flag(float x, float y) {
        //super(path: String, posizione iniziale: PVector, gravità: float, velocità: float, salto: float)
        
        super(FLAG_STAND, new PVector(x, y), 0, 0, 0, 0, true);
        flag = new Sprite(FLAG, new PVector(position.x - 145, position.y + 10));
    }



    @Override
    void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
        if (!level.isFinished && !player.isDead) {
            if (collideUp(player)) {
                player.getLife();
                level.finished();
            } else  if (collideDown(player) || collideRight(player) || collideLeft(player) ) {
                level.finished();
            }
        }
    }
    
    @Override
    void draw() {
        super.draw();
        flag.draw();
    }
}
