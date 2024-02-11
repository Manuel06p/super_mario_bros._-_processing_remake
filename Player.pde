/**
 * Class used to manage the entity Player. It extends the Entity class.
 */
class Player extends Entity {
  
  int boostValue;
  int lives;
  int coins;
  
  boolean isBoosted;
  boolean immunity;
  int powerLevel = 1;
  int damage;
  final int DAMAGE_TIMEOUT_VALUE = 120;
  int damageTimeout;
  boolean isDead = false;
  HashMap<Integer, String> powerLevelSet = new HashMap<Integer, String>();
  
  ArrayList<FireBall> fireBalls = new ArrayList<FireBall>();

  StringBuilder coinHudString = new StringBuilder();
  StringBuilder lifeHudString = new StringBuilder();

  Timer deadJump;
  Timer fireBallTimeout;
  
  boolean fireBallAbility = false;

  String leftKey;
  String rightKey;
  String boostKey;
  String jumpKey;
  String fireBallKey_0;
  String fireBallKey_1;

  /**
   * Create a new Player object.
   * - path: texture path
   * - PVector: initial position.
   */
  Player(String path, PVector initialPosition) {
    super(path, // Texture string path
          initialPosition, // Initial position
          GRAVITY, // Gravity
          5.0, // Movement speed
          10.0, // Small jump value
          20.0, // Super jump value
          1, // Breaking up value
          0, // Breaking down value
          0, // Breaking left value
          0 // Breaking right value
    );

    coinHudString.append("x00");
    lifeHudString.append("x03");

    lives = 3;    
    damageTimeout = DAMAGE_TIMEOUT_VALUE;
    deadJump = new Timer(20);
    fireBallTimeout = new Timer(20);

    powerLevelSet.put(1, MARIO_BASE);
    powerLevelSet.put(2, MARIO_SUPER_MUSHROOM);
    powerLevelSet.put(3, MARIO_FIRE_FLOWER);

    this.boostValue = 3;

    this.isBoosted = false;
    this.immunity = false;
    
    this.damage = 1;
    
    this.leftKey = "left_arrow_key";
    this.rightKey = "right_arrow_key";
    this.boostKey = "shift_key";
    this.jumpKey = "spacebar_key";
    this.fireBallKey_0 = "x_key";
    this.fireBallKey_1 = "X_key";
  }
  //

  /**
   * Reset the base player parameters.
   */
  void reset() {
    side = RX;
    position = level.playerInitialPosition;
    fireBalls.clear();
    deadJump.reset();
    isDead = false;
    damageTimeout = DAMAGE_TIMEOUT_VALUE;
    if (isBoosted) {
      isBoosted = false;
      movementSpeed /= boostValue;
    }

    updateLifeHud();
    updateCoinHud();
  }
  //

  /**
   * Reset the player paramters when is dead.
   */
  void resetDead() {
    reset();
    basePower();
  }
  //

  /**
   * Reset the player when it runs out of lives.
   */
  void resetGameOver() {
    coins = 0;
    lives = 3;
    resetDead();
  }
  //

  /**
   * It manages the bounce over an enemy.
   */
  void bounceOverEnemy() {
    if (damage > 0) {
      kick_effect.play();
    }

    player.downCollision = true;
    player.jump = true;
    player.jumpTimeout = 0;
    player.jumpStatus = 1;
  }
  //

  /**
   * Set the player power to base.
   */
  void basePower() {
    powerLevel = 1;
    player.breakingValue.put("up", 1);
    animation(imageDictionary.get(powerLevelSet.get(powerLevel) + side + "_mario_neutral"), 0);
    currentAnimation = 0;
    float oldHeight = height;
    width = texture.width;
    height = texture.height;
    position.y = position.y + oldHeight - height;
    fireBallAbility = false;
    damage = 1;
  }
  //

  /**
   * Set the player power to super mushroom.
   */
  void superMushroomPower() {
    powerLevel = 2;
    player.breakingValue.put("up", 2);

    animation(imageDictionary.get(powerLevelSet.get(powerLevel) + side + "_mario_neutral"), 0);
    currentAnimation = 0;
    float oldHeight = height;
    width = texture.width;
    height = texture.height;
    position.y = position.y + oldHeight - height;
    fireBallAbility = false;
    damage = 1;
  }
  //

  /**
   * Set the player power to fire flower.
   */
  void fireFlowerPower() {
    powerLevel = 3;
    player.breakingValue.put("up", 2);
    animation(imageDictionary.get(powerLevelSet.get(powerLevel) + side + "_mario_neutral"), 0);
    currentAnimation = 0;
    float oldHeight = height;
    width = texture.width;
    height = texture.height;
    position.y = position.y + oldHeight - height;
    fireBallAbility = true;
    damage = 1;
  }
  //

  /**
   * Manage the gain of a coin.
   */
  void coin() {
    coins += 1;

    if (coins > 99) {
        coins = 0;
        getLife();
    }

    updateCoinHud();
  }
  //

  /**
   * Draw the Player.
   */
  void draw() {
    super.draw();
  }
  //
  
  /**
   * Manage the Player when it get damaged.
   * - damage: damage received value.
   */
  @Override
  void takeDamage(int damage) {
    super.takeDamage(damage);
    if (!immunity) {
      if (damage == -1) {
        die();
      } else {
        if (damageTimeout == DAMAGE_TIMEOUT_VALUE) {
          if (powerLevel - damage == 0 ) {
            die();
          } else {
            powerLevel -= damage;
            pipe_effect.play();
            if (powerLevel == 1) {
              basePower();
            } else if (powerLevel == 2) {
              superMushroomPower();
            }
          }
          damageTimeout = 0;
        }
      }
    }
  }
  //

  /**
   * Manage the gain of a life.
   */
  void getLife() {
    if (lives < 99) {
      lives += 1;
      one_up_effect.play();
      updateLifeHud();
    }
  }
  //

  /**
   * Manage the player when it dies.
   */
  void die() {
    die_effect.play();
    overworld_ost.stop();
    isDead = true;
    lives -= 1;
    powerLevel = 1;
    updateLifeHud();

    animation(imageDictionary.get(MARIO_BASE + "mario_dead"), 0);
    currentAnimation = 3;
    damage = 0;
    
    float oldHeight = height;
    width = texture.width;
    height = texture.height;
    position.y = position.y + oldHeight - height;

    stopX();
  }
  //

  /**
   * Update the life HUD status.
   */
  void updateLifeHud() {
    if (lives < 10) {
      lifeHudString.replace(lifeHudString.length()-1, lifeHudString.length(), lives + "");
    } else {
      lifeHudString.replace(lifeHudString.length()-2, lifeHudString.length(), lives + "");
    }
  }
  //

  /**
   * Update the coin HUD.
   */
  void updateCoinHud() {
    if (coins < 10) {
      coinHudString.replace(coinHudString.length()-1, coinHudString.length(), coins + "");
    } else {
      coinHudString.replace(coinHudString.length()-2, coinHudString.length(), coins + "");
    }
  }
  //

  /**
   * Update the Player status.
   * - platforms: ArrayList of platforms.
   * - powerUps: ArrayList of power ups.
   */
  @Override
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
      

      fireBallTimeout.update();

      if (fireBallAbility && (getKeyStatus(fireBallKey_0) || getKeyStatus(fireBallKey_1)) && fireBallTimeout.tick()) {
        fire_ball_effect.play();
        fireBallTimeout.reset();
        fireBalls.add(new FireBall(player.centralPositionX(), player.centralPositionY() - 40, side));
        
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
  //

}
//