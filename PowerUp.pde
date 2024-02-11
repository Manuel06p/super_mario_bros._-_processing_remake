/**
 * Class used to manage the entity PowerUp. It extends the Entity class.
 */
class PowerUp extends Entity {
    
  boolean isActive = true;
  boolean isRight;
  
  /**
   * Create a new Player object.
   * - path: texture path.
   * - PVector: initial position, vertical coordinate starts from the base.
   * - gravity: gravity value.
   * - movementSpeed: movement speed.
   * - smallJumpValue: small jump value.
   * - superJumpValue: super jump value.
   * - isRight: starts moving to the right.
   */
  PowerUp(String path, PVector initialPosition, float gravity, float movementSpeed, float smallJumpValue, float superJumpValue, boolean isRight) {
      super(
        path, // Texture string path
        new PVector(initialPosition.x, GAME_HEIGHT-initialPosition.y), // Initial position
        gravity, // Gravity
        movementSpeed, // Movement speed
        smallJumpValue, // Small jump value
        superJumpValue, // Super jump value
        -1, // Breaking up value
        -1, // Breaking down value
        -1, // Breaking left value
        -1 // Breaking right value
      );
      
      this.isRight = isRight;
  }
  //

  /**
   * Update the PowerUp status.
   * - platforms: ArrayList of platforms.
   * - powerUps: ArrayList of power ups.
   */
  @Override
  void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
      super.update(platforms, powerUps);
  }
  //
  
  /**
   * Manage the PowerUp when it get damaged.
   * - damage: damage received value.
   */
  @Override
  void takeDamage(int damage) {
    if (damage == -1) {
      isActive = false;
    }
  }
  //
  
  /**
   * Draw the PowerUp.
   */
  @Override
  void draw() {
      super.draw();
  }
  //

}
//