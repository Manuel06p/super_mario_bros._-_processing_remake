/**
 * Class used to manage the power up Flag. It extends the PowerUp class.
 */
class Flag extends PowerUp {    

    Sprite flag;

    /**
     * Create a new Flag object.
     * - x: horizontal coordinate.
     * - y: vertical coordinate.
     */
    Flag(float x, float y) {
        super(
            FLAG_STAND, // Texture string path
            new PVector(x, y), // Position
            0, // Gravity
            0, // Movement speed
            0, // Small jump value
            0, // Super jump value
            true // Starts moving to the right
        );

        flag = new Sprite(FLAG, new PVector(position.x - 145, position.y + 10));
    }
    //

    /**
     * Update the Flag status.
     * - platforms: ArrayList of platforms.
     * - powerUps: ArrayList of power ups.
     */
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
    //
    
    /**
     * Draw the Flag.
     */
    @Override
    void draw() {
        super.draw();
        flag.draw();
    }
    //

}
//