/**
 * Class used to manage the sprite Platform. It extends the Sprite class.
 */
class Platform extends Sprite {

  HashMap<String, Integer> breakability;

  /**
   * Create a new Platform object.
   * - path: texture path.
   * - initialPosition: PVector containing coordinates of the starting position, the vertical coordinate starts from the base.
   * - breakabilityUp: breakability value up.
   * - breakabilityDown: breakability value down.
   * - breakabilityLeft: breakability value left.
   * - breakabilityRight: breakability value right.
   */
  Platform(String path, PVector initialPosition, int breakabilityUp, int breakabilityDown, int breakabilityLeft, int breakabilityRight) {
    super(path, new PVector(initialPosition.x, GAME_HEIGHT-initialPosition.y));

    breakability = new HashMap<String, Integer>();

    this.breakability.put("up", breakabilityUp);
    this.breakability.put("down", breakabilityDown);
    this.breakability.put("left", breakabilityLeft);
    this.breakability.put("right", breakabilityRight);
  }
  //

  /**
   * Update the Platform status.
   * - platforms: ArrayList of platforms.
   * - powerUps: ArrayList of power ups.
   */
  @Override
  void update() {
    super.update();
  }
  //

  /**
   * Draw the Platform.
   */
  @Override
  void draw() {  
    super.draw();
  }
  //

}
//