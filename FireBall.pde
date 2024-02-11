/**
 * Class used to manage the entity FireBall. It extends the Entity class.
 */
class FireBall extends Entity {
  
  int damage = 1;
  int bounce = 0;
  boolean isDead = false;
  
  /**
  * Create a new FireBall object.
  * - x: horizontal coordinate.
  * - y: vertical coordinate.
  * - side: side of the sprite.
  */
  FireBall(float x, float y, String side) {
    super(
      FIRE_BALL_0, // Texture string path
      new PVector(x, y), // Initial position
      12, // Gravity
      13.0, // Movement speed
      6, // Small jump value
      0, // Super jump value
      0, // Breaking up value
      0, // Breaking down value
      0, // Breaking left value
      0 // Breaking right value
    );

    animation(imageDictionary.get("fireBall"), 4);
    currentAnimation = 0;
    
    this.side = side;
    
    if (side == RX) {
      speed.x = movementSpeed;
    } else {;
      speed.x = -movementSpeed; 
    }
  }
  //
  
  /**
  * Update the FireBall status.
  * - platforms: ArrayList of platforms.
  * - powerUps: ArrayList of power ups.
  */
  @Override
  void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
    super.update(platforms, powerUps);
    if (upCollision || leftCollision || rightCollision || bounce > 8) {
       isDead = true;
    } else if (downCollision) {
      jump = true;
      jumpTimeout = 0;
      bounce += 1;
    } 
  }
  //
  
  /**
  * Draw the FireBall.
  */
  @Override
  void draw() {
   super.draw(); 
  }
  //
  
}
//