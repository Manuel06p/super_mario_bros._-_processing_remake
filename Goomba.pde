class Goomba extends Enemy {
    boolean isRight;

    Goomba(float x, float y, boolean isRight) {
        super(GOOMBA + RX + GOOMBA_NEUTRAL, //path
                new PVector(x, y), //initialPosition
                1, //health
                1, //damage
                GRAVITY, //gravity
                3.0, //speed
                0, //smallJumpValue
                0, //superJumpValue
                1, //breakingValueUp
                0, //breakingValueDown
                0, //breakingValueLeft
                0 //breakingValueRight
        );

        imageDictionary.put("goomba", new ArrayList<PImage>() {{
            add(loadImage(GOOMBA + RX + GOOMBA_NEUTRAL));
            add(loadImage(GOOMBA + LX + GOOMBA_NEUTRAL));
        }});

        animation(imageDictionary.get("goomba"), 7);
        currentAnimation = 0;

        this.isRight = isRight;
    }

    

    @Override
    void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
        super.update(platforms, powerUps);

        isRight = moveAuto(isRight);

        
        if (collideUp(player)) {
            takeDamage(player.damage);
            player.bounceOverEnemy();
            kick_effect.play();
        }

        if (collideDown(player) || ((collideRight(player) || collideLeft(player)) && player.position.y + player.height > centralPositionY())) {
            player.takeDamage(damage);
        }
        

    }

    @Override
    void draw() {
        super.draw();
    }
}
