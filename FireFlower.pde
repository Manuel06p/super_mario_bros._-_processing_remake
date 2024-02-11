/**
 * Class used to manage the power up FireFlower. It extends the PowerUp class.
 */
class FireFlower extends PowerUp {    

    /**
     * Create a new FireFlower object.
     * - x: horizontal coordinate.
     * - y: vertical coordinate.
     */
    FireFlower(float x, float y) {
        super(
            POWER_UP + FIRE_FLOWER_0, // Texture string path
            new PVector(x, y), // Position
            GRAVITY, // Gravity
            0, // Movement speed
            0, // Small jump value
            0, // Super jump value
            true // Starts moving to the right
        );

        animation(imageDictionary.get("fireFlower"), 8);
        currentAnimation = 0;
    }
    //

    /**
     * Update the FireFlower status.
     * - platforms: ArrayList of platforms.
     * - powerUps: ArrayList of power ups.
     */
    @Override
    void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
        super.update(platforms, powerUps);     

        if ((collideDown(player) || collideRight(player) || collideLeft(player) || collideUp(player)) && !player.isDead) {
            player.fireFlowerPower();
            isActive = false;
            powerup_effect.play();
        }
    }
    //
    
    /**
     * Draw the FireFlower.
     */
    @Override
    void draw() {
        super.draw();
    }
    //

}
//