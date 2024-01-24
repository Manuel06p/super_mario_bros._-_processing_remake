// File: Player.pde

class Player extends Entity {
  
  int boostValue;
  int lives;
  int coins;
  
  boolean isBoosted;
  int powerLevel = 1;
  int damage;
  final int damageTimeoutValue = 120;
  int damageTimeout;
  boolean isDead = false;
  HashMap<Integer, String> powerLevelSet = new HashMap<Integer, String>();

  String leftKey;
  String rightKey;
  String boostKey;
  String jumpKey;
  
  StringBuilder coinString = new StringBuilder();
  
  
  Text coinHUD;
  


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
    damageTimeout = damageTimeoutValue;

    powerLevelSet.put(1, MARIO_BASE);
    powerLevelSet.put(2, MARIO_SUPER_MUSHROOM);

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

    this.boostValue = 3;

    this.isBoosted = false;
    
    this.damage = 1;
    
    this.leftKey = "left_arrow_key";
    this.rightKey = "right_arrow_key";
    this.boostKey = "shift_key";
    this.jumpKey = "spacebar_key";
    
    coinString.append("x");
    coinString.append(coins);
    
    this.coinHUD = new Text(STANDARD_FONT, 200, 200, coinString, 255);
  }

  // Altri metodi specifici del giocatore, se necessario
  void reset(PVector initialPosition) {
    basePower();
    position = initialPosition;
    
    coins = 0;
    
    isDead = false;
    damageTimeout = damageTimeoutValue;
    if (isBoosted) {
      isBoosted = false;
      movementSpeed /= boostValue;
    }
  }

  void bounceOverEnemy() {
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
  
  void drawCoinHUD() {
    coinHUD.draw();
  }

  void coin() {
    coins += 1;
    
    if (coins > 99) {
        coins = 0;
    }
    
    coinString.replace(2, 2, "0" + coins);
  }

  // Override della funzione draw() per personalizzarla
  void draw() {
    // Aggiungi eventuali logiche di disegno specifiche per il giocatore
    super.draw();  // Chiama il metodo draw() della classe base (Entity)
    

  }

  void takeDamage(int damage) {
    if (damageTimeout == damageTimeoutValue) {
      if (powerLevel - damage <= 0 ) {
        die_effect.play();
        isDead = true;
      } else if (damage > 0) {
        powerLevel -= damage;
        basePower();
        pipe_effect.play();
      }
      damageTimeout = 0;
    }
  }

  void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
    super.update(platforms, powerUps); // Chiama l'aggiornamento di Entity
    
    
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

    if (damageTimeout < damageTimeoutValue) {
      damageTimeout += 1;
    } 
  }
  
}
