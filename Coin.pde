class Coin extends PowerUp {    
    Coin(float x, float y) {
        //super(path: String, posizione iniziale: PVector, salute: int, gravità: float, velocità: float, salto: float)
        super(POWER_UP + COIN_0, new PVector(x, y), 0, 0, 0);

        imageDictionary.put("coin", new ArrayList<PImage>() {{
            add(loadImage(POWER_UP + COIN_0));
            add(loadImage(POWER_UP + COIN_1));
            add(loadImage(POWER_UP + COIN_2));
            add(loadImage(POWER_UP + COIN_3));
        }});

        animation(imageDictionary.get("coin"), 8);
        currentAnimation = 0;

        

    }

    @Override
    void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
        super.update(platforms, powerUps);     

        if (collideDown(player) || collideRight(player) || collideLeft(player) || collideUp(player)) {
            //player.coin();
            isActive = false;
            coin_effect.play();
        }
    }
    
    @Override
    void draw() {
        super.draw();
    }
}

