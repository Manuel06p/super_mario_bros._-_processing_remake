/**
 * Class used to manage the power up SuperMushroom. It extends the PowerUp class.
 */
class SuperMushroom extends PowerUp {    

    /**
     * Create a new SuperMushroom object.
     * - x: horizontal coordinate.
     * - y: vertical coordinate.
     * - isRight: starts moving to the right.
     */
    SuperMushroom(float x, float y, boolean isRight) {
        super(
            POWER_UP + SUPER_MUSHROOM, // Texture string path
            new PVector(x, y), // Inital position
            GRAVITY, // Gravity
            5, // Movement speed
            0, // Small jump value
            0, // Super jump value
            isRight // Starts moving to the right
        );
    }
    //

    /**
     * Update the SuperMushroom status.
     * - platforms: ArrayList of platforms.
     * - powerUps: ArrayList of power ups.
     */
    @Override
    void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
        super.update(platforms, powerUps);     
        isRight = moveAuto(isRight);

        if ((collideDown(player) || collideRight(player) || collideLeft(player) || collideUp(player)) && !player.isDead) {
            player.superMushroomPower();
            isActive = false;
            powerup_effect.play();
        }
    }
    //
    
    /**
     * Draw the SuperMushroom.
     */
    @Override
    void draw() {
        super.draw();
    }
    //

}
//