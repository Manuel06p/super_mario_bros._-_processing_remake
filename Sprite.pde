/**
 * Classe per la gestione di uno sprite.
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
  

  HashMap<String, ArrayList<PImage>> imageDictionary = new HashMap<String, ArrayList<PImage>>();
  ArrayList<PImage> currentFrameSet = new ArrayList<PImage>();

  int frameCount;
  int frameFrequency = 0;
  int currentFrame;
  int currentAnimation = -1;

  String side = RX;


  /**
   * Crea un nuovo oggetto Sprite.
   * - path: percorso della risorsa.
   */
  Sprite(String path) {
    position = new PVector();
    speed = new PVector();
    
    // Carica l'immagine solo se il percorso non è vuoto
    if (!path.isEmpty()) {
      texture = loadImage(path);
      // Imposta la larghezza e l'altezza dell'immagine
      width = texture.width;
      height = texture.height;

      speed.x = 0;
      speed.y = 0;
    }

    
  }

  /**
   * Crea un nuovo oggetto Sprite con una posizione iniziale.
   * - path: percorso della risorsa.
   * - initialPosition: posizione iniziale dello sprite.
   */
  Sprite(String path, PVector initialPosition) {
    this(path);
    position.set(initialPosition);
  }

  boolean collideDown(Sprite sprite) {
    boolean downCollisionTemp = false;
    if (sprite.position.y - (position.y + height) <= 0 &&
        //Quando la differenza tra la Y della parte alta dello sprite e la Y della parte bassa di this è minore di collisionFraction

        sprite.position.y - (position.y + height) > -collisionFraction &&
        //Quando la differenza tra la Y della parte alta dello sprite e la Y della parte bassa di this è maggiore di -collisionFraction

        sprite.position.x - (position.x + width) < 0 &&
        //Quando la differenza tra la X della parte sinsitra dello sprite e la X della parte destra di this è minore di 0

        (sprite.position.x + sprite.width) - position.x > 0)
        //Quando la differenza tra la X della parte destra dello sprite e la X della parte sinsitra di this è  maggiore di 0
    {
      downCollisionY = sprite.position.y - height;
      downCollisionTemp = true;
    }
    return downCollisionTemp;
  }
   
  boolean collideRight(Sprite sprite) {
    boolean rightCollisionTemp = false;
    if (sprite.position.x - (position.x + width) < 0 &&
        //Quando la differenza tra la X della parte sinistra dello sprite e la X della parte destra di this è minore di collisionFraction
        
        sprite.position.x - (position.x + width) > -collisionFraction &&
        //Quando la differenza tra la X della parte sinistra dello sprite e la X della parte destra di this è maggiore di -collisionFraction

        sprite.position.y - (position.y + height) < 0 &&
        //Quando la differenza tra la Y della parte alta dello sprite e la Y della parte bassa di this è minore di 0

        (sprite.position.y + sprite.height) - (position.y) > 0)
        //Quando la differenza tra la Y della parte bassa dello sprite e la Y della parte alta di this è minore di 0
    {
      rightCollisionX = sprite.position.x - width;
      rightCollisionTemp = true;
    }
    return rightCollisionTemp;
  }

  boolean collideLeft(Sprite sprite) {
    boolean leftCollisionTemp = false;
    if ((sprite.position.x + sprite.width) - position.x > -0 &&
        //Quando la differenza tra la X della parte destra dello sprite e la X della parte sinistra di this è maggiore di -collisionFraction
        
        (sprite.position.x + sprite.width) - position.x < collisionFraction &&
        //Quando la differenza tra la X della parte destra dello sprite e la X della parte sinistra di this è minore di collisionFraction

        sprite.position.y - (position.y + height) < 0 &&
        //Quando la differenza tra la Y della parte alta dello sprite e la Y della parte bassa di this è minore di 0

        (sprite.position.y + sprite.height) - (position.y) > 0)
        //Quando la differenza tra la Y della parte bassa dello sprite e la Y della parte alta di this è minore di 0
    {
      leftCollisionX = sprite.position.x + sprite.width;
      leftCollisionTemp = true;
    }
    return leftCollisionTemp;
  }

  boolean collideUp(Sprite sprite) {
    boolean upCollisionTemp = false;
    if ((sprite.position.y + sprite.height) - position.y > -0 &&
        //Quando la differenza tra la Y della parte inferiore dello sprite e la Y della parte alta di this è minore di collisionFraction

        (sprite.position.y + sprite.height) - position.y < collisionFraction &&
        //Quando la differenza tra la Y della parte alta dello sprite e la Y della parte bassa di this è minore di -collisionFraction

        sprite.position.x - (position.x + width) < -0 && //-collisionFraction
        //Quando la differenza tra la X della parte sinsitra dello sprite e la X della parte destra di this è minore di 0

        (sprite.position.x + sprite.width) - position.x > 0) //-collisionFraction
        //Quando la differenza tra la X della parte destra dello sprite e la X della parte sinsitra di this è  maggiore di 0
    {
      upCollisionY = sprite.position.y + height;
      upCollisionTemp = true;
    }
    return upCollisionTemp;
  }

  void animation(ArrayList<PImage> currentFrameSet, int frameFrequency) {
    this.currentFrameSet = currentFrameSet;
    this.frameFrequency = frameFrequency;
    texture = currentFrameSet.get(0);
    frameCount = 0;
    currentFrame = 0;
  }
  
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

  void stop() {
    stopX();
    stopY();
  }

  void stopX() {
    speed.x = 0;
  }
  
  void stopY() {
    speed.y = 0;
  }

  float centralPositionX() {
    return position.x + (width/2.0);
  }

  float centralPositionY() {
    return position.y + (height/2.0);
  }

  void draw() {
    if (texture != null) {
      image(texture, position.x, position.y, width, height);  
    }
  }
}
