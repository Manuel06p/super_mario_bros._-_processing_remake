// File: Player.pde

class Player extends Entity {
  
  int boostValue;
  int lives;
  int coins;
  
  boolean isBoosted;
  int powerLevel = 1;
  int damage;
  final int DAMAGE_TIMEOUT_VALUE = 120;
  int damageTimeout;
  boolean isDead = false;
  HashMap<Integer, String> powerLevelSet = new HashMap<Integer, String>();

  Timer deadJump;
  

  String leftKey;
  String rightKey;
  String boostKey;
  String jumpKey;
  
  
  
  

  


  Player(String path, PVector initialPosition) {
    //super(path: String, posizione iniziale: PVector, salute: int, gravità: float, velocità: float, salto: float)
    super(path, //Texture
          initialPosition, //Intial Position
          GRAVITY, //Gravity
          5.0, //Speed
          10.0, //smallJump
          20.0, //superJump
          1, //breakingValueUp
          0, //breakingValueDown
          0, //breakingValueLeft
          0 //breakingValueRight
    );

    lives = 3;    
    damageTimeout = DAMAGE_TIMEOUT_VALUE;
    deadJump = new Timer(20);

    

    powerLevelSet.put(1, MARIO_BASE);
    powerLevelSet.put(2, MARIO_SUPER_MUSHROOM);
    powerLevelSet.put(3, MARIO_FIRE_FLOWER);

    imageDictionary.put(MARIO_BASE + "mario_dead", new ArrayList<PImage>() {{
      add(loadImage(MARIO + MARIO_BASE + MARIO_DEAD));
    }});

    imageDictionary.put(MARIO_BASE + RX + "_mario_neutral", new ArrayList<PImage>() {{
      add(loadImage(MARIO + MARIO_BASE + RX + MARIO_NEUTRAL));
    }});

    imageDictionary.put(MARIO_BASE + LX + "_mario_neutral", new ArrayList<PImage>() {{
      add(loadImage(MARIO + MARIO_BASE + LX + MARIO_NEUTRAL));
    }});

    imageDictionary.put(MARIO_BASE + RX + "_mario_jump", new ArrayList<PImage>() {{
      add(loadImage(MARIO + MARIO_BASE + RX + MARIO_JUMP));
    }});

    imageDictionary.put(MARIO_BASE + LX + "_mario_jump", new ArrayList<PImage>() {{
      add(loadImage(MARIO + MARIO_BASE + LX + MARIO_JUMP));
    }});


    imageDictionary.put(MARIO_BASE + RX + "_mario_walk", new ArrayList<PImage>() {{
      add(loadImage(MARIO + MARIO_BASE + RX + MARIO_WALK_1));
      add(loadImage(MARIO + MARIO_BASE + RX + MARIO_WALK_2));
      add(loadImage(MARIO + MARIO_BASE + RX + MARIO_WALK_3));
    }});

    imageDictionary.put(MARIO_BASE + LX + "_mario_walk", new ArrayList<PImage>() {{
      add(loadImage(MARIO + MARIO_BASE + LX + MARIO_WALK_1));
      add(loadImage(MARIO + MARIO_BASE + LX + MARIO_WALK_2));
      add(loadImage(MARIO + MARIO_BASE + LX + MARIO_WALK_3));
    }});



    imageDictionary.put(MARIO_SUPER_MUSHROOM + RX + "_mario_neutral", new ArrayList<PImage>() {{
      add(loadImage(MARIO + MARIO_SUPER_MUSHROOM + RX + MARIO_NEUTRAL));
    }});

    imageDictionary.put(MARIO_SUPER_MUSHROOM + LX + "_mario_neutral", new ArrayList<PImage>() {{
      add(loadImage(MARIO + MARIO_SUPER_MUSHROOM + LX + MARIO_NEUTRAL));
    }});

    imageDictionary.put(MARIO_SUPER_MUSHROOM + RX + "_mario_jump", new ArrayList<PImage>() {{
      add(loadImage(MARIO + MARIO_SUPER_MUSHROOM + RX + MARIO_JUMP));
    }});

    imageDictionary.put(MARIO_SUPER_MUSHROOM + LX + "_mario_jump", new ArrayList<PImage>() {{
      add(loadImage(MARIO + MARIO_SUPER_MUSHROOM + LX + MARIO_JUMP));
    }});

    imageDictionary.put(MARIO_SUPER_MUSHROOM + RX + "_mario_walk", new ArrayList<PImage>() {{
      add(loadImage(MARIO + MARIO_SUPER_MUSHROOM + RX + MARIO_WALK_1));
      add(loadImage(MARIO + MARIO_SUPER_MUSHROOM + RX + MARIO_WALK_2));
      add(loadImage(MARIO + MARIO_SUPER_MUSHROOM + RX + MARIO_WALK_3));
    }});

    imageDictionary.put(MARIO_SUPER_MUSHROOM + LX + "_mario_walk", new ArrayList<PImage>() {{
      add(loadImage(MARIO + MARIO_SUPER_MUSHROOM + LX + MARIO_WALK_1));
      add(loadImage(MARIO + MARIO_SUPER_MUSHROOM + LX + MARIO_WALK_2));
      add(loadImage(MARIO + MARIO_SUPER_MUSHROOM + LX + MARIO_WALK_3));
    }});


    //Fire flower
    imageDictionary.put(MARIO_FIRE_FLOWER + RX + "_mario_neutral", new ArrayList<PImage>() {{
      add(loadImage(MARIO + MARIO_FIRE_FLOWER + RX + MARIO_NEUTRAL));
    }});

    imageDictionary.put(MARIO_FIRE_FLOWER + LX + "_mario_neutral", new ArrayList<PImage>() {{
      add(loadImage(MARIO + MARIO_FIRE_FLOWER + LX + MARIO_NEUTRAL));
    }});

    imageDictionary.put(MARIO_FIRE_FLOWER + RX + "_mario_jump", new ArrayList<PImage>() {{
      add(loadImage(MARIO + MARIO_FIRE_FLOWER + RX + MARIO_JUMP));
    }});

    imageDictionary.put(MARIO_FIRE_FLOWER + LX + "_mario_jump", new ArrayList<PImage>() {{
      add(loadImage(MARIO + MARIO_FIRE_FLOWER + LX + MARIO_JUMP));
    }});

    imageDictionary.put(MARIO_FIRE_FLOWER + RX + "_mario_walk", new ArrayList<PImage>() {{
      add(loadImage(MARIO + MARIO_FIRE_FLOWER + RX + MARIO_WALK_1));
      add(loadImage(MARIO + MARIO_FIRE_FLOWER + RX + MARIO_WALK_2));
      add(loadImage(MARIO + MARIO_FIRE_FLOWER + RX + MARIO_WALK_3));
    }});

    imageDictionary.put(MARIO_FIRE_FLOWER + LX + "_mario_walk", new ArrayList<PImage>() {{
      add(loadImage(MARIO + MARIO_FIRE_FLOWER + LX + MARIO_WALK_1));
      add(loadImage(MARIO + MARIO_FIRE_FLOWER + LX + MARIO_WALK_2));
      add(loadImage(MARIO + MARIO_FIRE_FLOWER + LX + MARIO_WALK_3));
    }});

    this.boostValue = 3;

    this.isBoosted = false;
    
    this.damage = 1;
    
    this.leftKey = "left_arrow_key";
    this.rightKey = "right_arrow_key";
    this.boostKey = "shift_key";
    this.jumpKey = "spacebar_key";
    
    
  }

  // Altri metodi specifici del giocatore, se necessario
  void reset(PVector initialPosition) {
    side = RX;
    basePower();
    position = initialPosition;
    updateLifeHud();
    updateCoinHud();

    
    deadJump.reset();
    
    isDead = false;
    damageTimeout = DAMAGE_TIMEOUT_VALUE;
    if (isBoosted) {
      isBoosted = false;
      movementSpeed /= boostValue;
    }
  }

  void bounceOverEnemy() {
    if (damage > 0) {
      kick_effect.play();
    }

    player.downCollision = true;
      player.jump = true;
      player.jumpTimeout = 0;
      player.jumpStatus = player.jumpValue/3.0*2.0;
  }

  void basePower() {
    powerLevel = 1;
    player.breakingValue.put("up", 1);
    animation(imageDictionary.get(powerLevelSet.get(powerLevel) + side + "_mario_neutral"), 0);
    currentAnimation = 0;
    float oldHeight = height;
    width = texture.width;
    height = texture.height;
    position.y = position.y + oldHeight - height;
    damage = 1;
  }

  void superMushroomPower() {
    powerLevel = 2;
    player.breakingValue.put("up", 2);

    animation(imageDictionary.get(powerLevelSet.get(powerLevel) + side + "_mario_neutral"), 0);
    currentAnimation = 0;
    float oldHeight = height;
    width = texture.width;
    height = texture.height;
    position.y = position.y + oldHeight - height;
    damage = 1;
  }

  void fireFlowerPower() {
    powerLevel = 3;
    player.breakingValue.put("up", 2);
    animation(imageDictionary.get(powerLevelSet.get(powerLevel) + side + "_mario_neutral"), 0);
    currentAnimation = 0;
    float oldHeight = height;
    width = texture.width;
    height = texture.height;
    position.y = position.y + oldHeight - height;
    damage = 2;
  }
  

  void coin() {
    coins += 1;

    if (coins > 99) {
        coins = 0;
        getLife();
    }

    updateCoinHud();
    
  }

  // Override della funzione draw() per personalizzarla
  void draw() {
    // Aggiungi eventuali logiche di disegno specifiche per il giocatore
    super.draw();  // Chiama il metodo draw() della classe base (Entity)
  }
  
  @Override
  void takeDamage(int damage) {
    super.takeDamage(damage);
    if (damage == -1) {
      die();
    } else {
      if (damageTimeout == DAMAGE_TIMEOUT_VALUE) {
      if (powerLevel - damage <= 0 ) {
        die();
      } else if (damage > 0) {
        powerLevel -= damage;
        basePower();
        pipe_effect.play();
      }
      damageTimeout = 0;
    }
    }
  }

  void getLife() {
    if (lives < 99) {
      lives += 1;
      updateLifeHud();
    }
  }

  void die() {
    die_effect.play();
    overworld_ost.stop();
    isDead = true;
    lives -= 1;
    updateLifeHud();
    animation(imageDictionary.get(powerLevelSet.get(1) + "mario_dead"), 0);
    damage = 0;
    
    float oldHeight = height;
    width = texture.width;
    height = texture.height;
    position.y = position.y + oldHeight - height;

    stopX();
    
  }

  void updateLifeHud() {
    if (lives < 10) {
      level.lifeHudString.replace(level.lifeHudString.length()-1, level.lifeHudString.length(), lives + "");
    } else {
      level.lifeHudString.replace(level.lifeHudString.length()-2, level.lifeHudString.length(), lives + "");
    }
  }

  void updateCoinHud() {
    if (coins < 10) {
      level.coinHudString.replace(level.coinHudString.length()-1, level.coinHudString.length(), coins + "");
    } else {
      level.coinHudString.replace(level.coinHudString.length()-2, level.coinHudString.length(), coins + "");
    }
  }

  void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
    

    if (isDead) {
      deadJump.update();
      if (deadJump.tick()) {
        position.y += gravity;
      } else {
        position.y += -gravity;
      }
    } else {
      
      super.update(platforms, powerUps);
      
      if (position.x < 0) {
        leftCollision = true;
        position.x = 0;
      } else if (position.x + width > level.length) {
        rightCollision = true;
        position.x = level.length - width;
      }

      if (getKeyStatus(leftKey)) {
        if (currentAnimation != 1) {
          animation(imageDictionary.get(powerLevelSet.get(powerLevel) + LX + "_mario_walk"), 5);
          currentAnimation = 1;
        }
        moveLeft();
        side = LX;
      } else if (getKeyStatus(rightKey)) {
          if (currentAnimation != 2) {
            animation(imageDictionary.get(powerLevelSet.get(powerLevel) + RX + "_mario_walk"), 5);
            currentAnimation = 2;
          }
        
        side = RX;
        moveRight();
      } else {
        stopX();
        if (currentAnimation != 0) {
          animation(imageDictionary.get(powerLevelSet.get(powerLevel) + side + "_mario_neutral"), 0);
          currentAnimation = 0;
        }
      }

      if (!downCollision) {
        if (currentAnimation != 3) {
          animation(imageDictionary.get(powerLevelSet.get(powerLevel) + side + "_mario_jump"), 0);
          currentAnimation = 3;
        }
      }

      if (getKeyStatus(boostKey) && !isBoosted) {
        movementSpeed *= boostValue;
        isBoosted = true;
      } else if (isBoosted) {
        movementSpeed /= boostValue;
        isBoosted = false;
      }

      if (getKeyStatus(jumpKey)) {
        jump = true;
        
      }
      if (jumpStatus == 1) {
        jump_effect.play();
      }

      if (damageTimeout < DAMAGE_TIMEOUT_VALUE) {
        damageTimeout += 1;
      } 
    }
  }
}
