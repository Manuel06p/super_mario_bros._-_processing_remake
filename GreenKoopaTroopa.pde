/**
 * Class used to manage the koopa GreenKoopaTroopa. It extends the Koopa class.
 */
class GreenKoopaTroopa extends Koopa {

    /**
     * Create a new GreenKoopaTroopa object.
     * - x: horizontal coordinate.
     * - y: vertical coordinate.
     * - isRight: starts moving to the right
     */
    GreenKoopaTroopa(float x, float y, boolean isRight) {
        super(  
            KOOPA + LX + GREEN_KOOPA_TROOPA + KOOPA_0, // Texture string path
            x, // Horizontal coordinate
            y, // Vertical coordinate
            isRight, // Starts moving to the right
            GREEN_KOOPA_TROOPA // Koopa type
        );
        
        livingKoopa();
    }
    //
 
    /**
     * Update the GreenKoopaTroopa status.
     * - platforms: ArrayList of platforms.
     * - powerUps: ArrayList of power ups.
     */
    @Override
    void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
        super.update(platforms, powerUps);
    }
    //

    /**
     * Draw the GreenKoopaTroopa.
     */
    @Override
    void draw() {
        super.draw();
    }
    //

}
//