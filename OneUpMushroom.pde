/**
 * Class used to manage the power up OneUpMushroom. It extends the PowerUp class.
 */
class OneUpMushroom extends PowerUp {    
    
    /**
     * Create a new OneUpMushroom object.
     * - x: horizontal coordinate.
     * - y: vertical coordinate.
     * - isRight: starts moving to the right.
     */
    OneUpMushroom(float x, float y, boolean isRight) {
        super(
            POWER_UP + ONE_UP_MUSHROOM,  // Texture string path
            new PVector(x, y), // Inital position
            GRAVITY, // Gravity
            5, // Movement speed
            0, // Small jump value
            0, // Super jump value
            isRight // Starts moving to the right
        );

        this.isRight = isRight;
    }
    //

    /**
     * Update the OneUpMushroom status.
     * - platforms: ArrayList of platforms.
     * - powerUps: ArrayList of power ups.
     */
    @Override
    void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
        super.update(platforms, powerUps);     
        isRight = moveAuto(isRight);

        if ((collideDown(player) || collideRight(player) || collideLeft(player) || collideUp(player)) && !player.isDead) {
            player.getLife();
            isActive = false;
        }
    }
    //
    
    /**
     * Draw the OneUpMushroom.
     */
    @Override
    void draw() {
        super.draw();
    }
    //

}
//