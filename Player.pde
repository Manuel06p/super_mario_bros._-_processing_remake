// File: Player.pde

class Player extends Entity {
  
  int boostValue;
  
  boolean isBoosted;
  int powerLevel = 0;

  HashMap<Integer, String> powerLevelSet = new HashMap<Integer, String>();

  String leftKey;
  String rightKey;
  String boostKey;
  String jumpKey;


  Player(String path, PVector initialPosition) {
    //super(path: String, posizione iniziale: PVector, salute: int, gravità: float, velocità: float, salto: float)
    super(path, initialPosition, 5, 20.0, 5.0, 20.0, 1, 0, 0, 0);

    powerLevelSet.put(0, MARIO_BASE);
    powerLevelSet.put(1, MARIO_SUPER_MUSHROOM);

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
    
    
    this.leftKey = "left_arrow_key";
    this.rightKey = "right_arrow_key";
    this.boostKey = "shift_key";
    this.jumpKey = "spacebar_key";
  }

  // Altri metodi specifici del giocatore, se necessario

  void superMushroomPower() {
    powerLevel = 1;
    player.breakingValue.put("up", 2);

    animation(imageDictionary.get(powerLevelSet.get(powerLevel) + side + "_mario_neutral"), 0);
    currentAnimation = 0;
    float oldHeight = height;
    width = texture.width;
    height = texture.height;
    position.y = position.y + oldHeight - height;
  }

  // Override della funzione draw() per personalizzarla
  void draw() {
    // Aggiungi eventuali logiche di disegno specifiche per il giocatore
    super.draw();  // Chiama il metodo draw() della classe base (Entity)
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
      if (jumpStatus == 1) {
        jump_super_effect.play();
      }
    }
  }
  
}
