/**
 * Class used to manage the enemy Goomba. It extends the Enemy class.
 */
class Goomba extends Enemy {
    
    boolean isRight;
    
    /**
     * Create a new Goomba object.
     * - x: horizontal coordinate.
     * - y: vertical coordinate.
     * - isRight: starts moving to the right
     */
    Goomba(float x, float y, boolean isRight) {
        super(
            GOOMBA + RX + GOOMBA_NEUTRAL, // Texture string path
            new PVector(x, y), // Initial position
            1, // Health
            1, // Damage
            GRAVITY, // Gravity
            3.0, // Movement speed
            0, // Small jump value
            0, // Super jump value
            1, // Breaking up value
            0, // Breaking down value
            0, // Breaking left value
            0 // Breaking right value
        );
        
        animation(imageDictionary.get("goomba"), 7);
        currentAnimation = 0;

        this.isRight = isRight;
    }
    //

    /**
     * Update the Goomba status.
     * - platforms: ArrayList of platforms.
     * - powerUps: ArrayList of power ups.
     */
    @Override
    void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
        super.update(platforms, powerUps);

        isRight = moveAuto(isRight);

        if (collideUp(player)) {
            takeDamage(player.damage);
            player.bounceOverEnemy();
        }

        if (collideDown(player) || ((collideRight(player) || collideLeft(player)) && player.position.y + player.height > centralPositionY())) {
            player.takeDamage(damage);
        }
    }
    //

    /**
     * Draw the Goomba.
     */
    @Override
    void draw() {
        super.draw();
    }
    //

}
//