class FireFlower extends PowerUp {    

    FireFlower(float x, float y) {
        super(POWER_UP + FIRE_FLOWER_0, new PVector(x, y), GRAVITY, 0, 0, 0, true);
        

        animation(imageDictionary.get("fireFlower"), 8);
        currentAnimation = 0;
    }

    @Override
    void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
        super.update(platforms, powerUps);     

        if ((collideDown(player) || collideRight(player) || collideLeft(player) || collideUp(player)) && !player.isDead) {
            player.fireFlowerPower();
            isActive = false;
            powerup_effect.play();
        }
    }
    
    @Override
    void draw() {
        super.draw();
    }
}
