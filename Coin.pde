/**
 * Class used to manage the power up Coin. It extends the PowerUp class.
 */
class Coin extends PowerUp {    

    /**
     * Creates a new Coin object.
     * - x: horizontal coordinate.
     * - y: vertical coordinate.
     */
    Coin(float x, float y) {
        //super(path: String, posizione iniziale: PVector, salute: int, gravità: float, velocità: float, salto: float)
        super(  
            POWER_UP + COIN_0, // Texture string path
            new PVector(x, y), // Position
            0, // Gravity
            0, // Movement speed
            0, // Small jump value
            0, // Super jump value
            true // Starts moving to the right
        );

        animation(imageDictionary.get("coin"), 8);
        currentAnimation = 0;
    }

    /**
     * Update the Coin status.
     * - platforms: ArrayList of platforms.
     * - powerUps: ArrayList of power ups.
     */
    @Override
    void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
        super.update(platforms, powerUps);     

        if ((collideDown(player) || collideRight(player) || collideLeft(player) || collideUp(player)) && !player.isDead) {
            player.coin();
            isActive = false;
            coin_effect.play();
        }
    }
    
    
    /**
     * Draw the Coin.
     */
    @Override
    void draw() {
        super.draw();
    }
}
//