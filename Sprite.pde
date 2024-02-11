/**
 * Class used to manage the sprites.
 */
class Sprite {
  PImage texture;
  float width;
  float height;
  PVector position;
  PVector speed;
  
  float collisionFraction = 30.0;

  float downCollisionY;
  boolean downCollision = false;

  float rightCollisionX;
  boolean rightCollision = false;

  float leftCollisionX;
  boolean leftCollision = false;

  float upCollisionY;
  boolean upCollision = false;
  
  ArrayList<PImage> currentFrameSet = new ArrayList<PImage>();

  int frameCount;
  int frameFrequency = 0;
  int currentFrame;
  int currentAnimation = -1;

  String side = RX;

  /**
   * Create a new Sprite object.
   * - path: texture path.
   */
  Sprite(String path) {
    position = new PVector();
    speed = new PVector();
    
    if (!path.isEmpty()) {
      texture = loadImage(path);

      width = texture.width;
      height = texture.height;

      speed.x = 0;
      speed.y = 0;
    }
  }
  //

  /**
   * Create a new Sprite object.
   * - path: texture path.
   * - initialPosition: PVector containing coordinates of the starting position.
   */
  Sprite(String path, PVector initialPosition) {
    this(path);
    position.set(initialPosition);
  }
  //

  /**
   * Check if the sprite collides down with another one.
   * - sprite: sprite to check the collision with.
   * - returns true if it collides down, false otherwise.
   */
  boolean collideDown(Sprite sprite) {
    boolean downCollisionTemp = false;
    if (sprite.position.y - (position.y + height) <= 0 &&
        sprite.position.y - (position.y + height) > -collisionFraction &&
        sprite.position.x - (position.x + width) < 0 &&
        (sprite.position.x + sprite.width) - position.x > 0)
    {
      downCollisionY = sprite.position.y - height;
      downCollisionTemp = true;
    }
    return downCollisionTemp;
  }
  //

  /**
   * Check if the sprite collides down with another one. It checks with tolerance.
   * - sprite: sprite to check the collision with.
   * - returns true if it collides down, false otherwise.
   */
  boolean collideDownTolerant(Sprite sprite) {
    boolean downCollisionTemp = false;
    if (sprite.position.y - (position.y + height) <= collisionFraction &&
        sprite.position.y - (position.y + height) > -collisionFraction &&
        sprite.position.x - (position.x + width) < 0 &&
        (sprite.position.x + sprite.width) - position.x > 0)
    {
      downCollisionTemp = true;
    }
    return downCollisionTemp;
  }
  //
   
  /**
   * Check if the sprite collides right with another one.
   * - sprite: sprite to check the collision with.
   * - returns true if it collides right, false otherwise.
   */
  boolean collideRight(Sprite sprite) {
    boolean rightCollisionTemp = false;
    if (sprite.position.x - (position.x + width) < 0 &&
        sprite.position.x - (position.x + width) > -collisionFraction &&
        sprite.position.y - (position.y + height) < 0 &&
        (sprite.position.y + sprite.height) - (position.y) > 0)
    {
      rightCollisionX = sprite.position.x - width;
      rightCollisionTemp = true;
    }
    return rightCollisionTemp;
  }
  //

  /**
   * Check if the sprite collides right with another one. It checks with tolerance.
   * - sprite: sprite to check the collision with.
   * - returns true if it collides right, false otherwise.
   */
   boolean collideRightTolerant(Sprite sprite) {
    boolean rightCollisionTemp = false;
    if (sprite.position.x - (position.x + width) < collisionFraction &&
        sprite.position.x - (position.x + width) > -collisionFraction &&
        sprite.position.y - (position.y + height) < 0 &&
        (sprite.position.y + sprite.height) - (position.y) > 0)
    {
      rightCollisionTemp = true;
    }
    return rightCollisionTemp;
  }
  //
  
  /**
   * Check if the sprite collides left with another one.
   * - sprite: sprite to check the collision with.
   * - returns true if it collides left, false otherwise.
   */
  boolean collideLeft(Sprite sprite) {
    boolean leftCollisionTemp = false;
    if ((sprite.position.x + sprite.width) - position.x > -0 &&
        (sprite.position.x + sprite.width) - position.x < collisionFraction &&
        sprite.position.y - (position.y + height) < 0 &&
        (sprite.position.y + sprite.height) - (position.y) > 0)
    {
      leftCollisionX = sprite.position.x + sprite.width;
      leftCollisionTemp = true;
    }
    return leftCollisionTemp;
  }
  //

  /**
   * Check if the sprite collides left with another one. It checks with tolerance.
   * - sprite: sprite to check the collision with.
   * - returns true if it collides left, false otherwise.
   */
  boolean collideLeftTolerant(Sprite sprite) {
    boolean leftCollisionTemp = false;
    if ((sprite.position.x + sprite.width) - position.x > -collisionFraction &&
        (sprite.position.x + sprite.width) - position.x < collisionFraction &&
        sprite.position.y - (position.y + height) < 0 &&
        (sprite.position.y + sprite.height) - (position.y) > 0)
    {
      leftCollisionTemp = true;
    }
    return leftCollisionTemp;
  }
  //

  /**
   * Check if the sprite collides up with another one.
   * - sprite: sprite to check the collision with.
   * - returns true if it collides up, false otherwise.
   */
  boolean collideUp(Sprite sprite) {
    boolean upCollisionTemp = false;
    if ((sprite.position.y + sprite.height) - position.y > -0 &&
        (sprite.position.y + sprite.height) - position.y < collisionFraction &&
        sprite.position.x - (position.x + width) < -0 &&
        (sprite.position.x + sprite.width) - position.x > 0)
    {
      upCollisionY = sprite.position.y + height;
      upCollisionTemp = true;
    }
    return upCollisionTemp;
  }
  //

  /**
   * Check if exceeds lower bounds.
   * - returns true if exceeds, false otherwise.
   */
  boolean exceedsLowerBound() {
    return this.position.y > GAME_HEIGHT;
  }
  //

  /**
   * Change the current aniamtion set.
   * - currentFrameSet: set of frames.
   * - frameFrequency: frequency of frame change.
   */
  void animation(ArrayList<PImage> currentFrameSet, int frameFrequency) {
    this.currentFrameSet = currentFrameSet;
    this.frameFrequency = frameFrequency;
    texture = currentFrameSet.get(0);
    frameCount = 0;
    currentFrame = 0;
  }
  //
  
  /**
   * Update the sprite status.
   */
  void update() {
    position.y += speed.y;
    position.x += speed.x;

    if (frameFrequency > 0) {
      if (frameCount >= frameFrequency) {
        currentFrame = (currentFrame + 1) % currentFrameSet.size();
        frameCount = 0;
        texture = currentFrameSet.get(currentFrame);
      }
      frameCount += 1;
    }
  }
  //

  /**
   * Stop horizontal and vertical movement.
   */
  void stop() {
    stopX();
    stopY();
  }
  //

  /**
   * Stop horizontal movement.
   */
  void stopX() {
    speed.x = 0;
  }
  //
  
  /**
   * Stop vertical movement.
   */
  void stopY() {
    speed.y = 0;
  }
  //

  /**
   * Calculate horizontal central position.
   * - returns the horizontal central position 
   */
  float centralPositionX() {
    return position.x + (width/2.0);
  }
  //

  /**
   * Calculate vertical central position.
   * - returns the vertical central position 
   */
  float centralPositionY() {
    return position.y + (height/2.0);
  }
  //

  /**
   * Draw the Sprite.
   */
  void draw() {
    if (texture != null) {
      image(texture, position.x, position.y, width, height);  
    }
  }
  //

}
//