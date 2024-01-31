class FireBall extends Entity {
  
  int damage = 1;
  int bounce = 0;
  boolean isDead = false;
  
  
  FireBall(float x, float y, String side) {
    super(FIRE_BALL_0,
          new PVector(x, y),
          12, //gravity
          13.0, //speed
          6, //smallJumpValue
          0, //superJumpValue
          0, //breakingValueUp
          0, //breakingValueDown
          0, //breakingValueLeft
          0 //breakingValueRight)
    );

    imageDictionary.put("fireBall", new ArrayList<PImage>() {{
        add(loadImage(FIRE_BALL_0));
        add(loadImage(FIRE_BALL_1));
        add(loadImage(FIRE_BALL_2));
        add(loadImage(FIRE_BALL_3));
    }});

    animation(imageDictionary.get("fireBall"), 4);
    currentAnimation = 0;
    
    this.side = side;
    
    if (side == RX) {
      speed.x = movementSpeed;
    } else {;
      speed.x = -movementSpeed; 
    }
    

  }
  
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
  
  @Override
  void draw() {
   super.draw(); 
  }
  
}
