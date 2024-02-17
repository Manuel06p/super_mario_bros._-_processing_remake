/**
 * 
 * Main class.
 *
 */



/**
 * Imported Libraries
 */
  import java.util.Iterator;
  import java.util.Collections;
  import java.lang.Object.*;
  import processing.sound.*;
//


Level level;
Player player;
HashMap<String, Key> keyMap;
ArrayList<Level> levels;

/**
 * Sound declaration
 */
  Sound overworld_ost;
  Sound overworld_remix_ost;
  Sound powerup_effect;
  Sound jump_effect;
  Sound coin_effect;
  Sound kick_effect;
  Sound pipe_effect;
  Sound die_effect;
  Sound one_up_effect;
  Sound powerup_appears_effect;
  Sound fire_ball_effect;
  Sound break_block_effect;
  Sound game_over_effect;
  Sound course_clear_effect;
  Sound lets_a_go_effect;
//

/**
 * Timer declaration
 */
  Timer loadLevelScreenTimeDuration;
  Timer deathAnimationLevelTimeDuration;
  Timer newLevelAnimationLevelTimeDuration;
  Timer gameOverScreenTimeDuration;
  Timer pauseKeyTimeDuration;
//

/**
 * Text
 */
  Text coinLoadLevelText;
  Text lifeLoadLevelText;
  Text titleLoadLevelText;
  Text gameOverText;
  Text pauseText;
//

Sprite coinLoadLevelIcon;
HashMap<String, ArrayList<PImage>> imageDictionary;

Sprite lifeLoadLevelIcon;
boolean pause;

HashMap<Boolean, String> booleanSide;

StringBuilder levelNameString = new StringBuilder();

/**
 * Setup and start the windows and the global objects.
 */
void setup() {
  /**
   * Sound
   */
    overworld_ost = new Sound(this, SOUND + OVERWORLD_OST);
    overworld_remix_ost = new Sound(this, SOUND + OVERWORLD_REMIX_OST, 0.5);
    powerup_effect = new Sound(this, SOUND + POWERUP_EFFECT);
    jump_effect = new Sound(this, SOUND + JUMP_EFFECT);
    coin_effect = new Sound(this, SOUND + COIN_EFFECT);
    kick_effect = new Sound(this, SOUND + KICK_EFFECT);
    pipe_effect = new Sound(this, SOUND + PIPE_EFFECT);
    die_effect = new Sound(this, SOUND + DIE_EFFECT);
    one_up_effect = new Sound(this, SOUND + ONE_UP_EFFECT);
    powerup_appears_effect = new Sound(this, SOUND + POWERUP_APPEARS_EFFECT);
    fire_ball_effect = new Sound(this, SOUND + FIRE_BALL_EFFECT);
    break_block_effect = new Sound(this, SOUND + BREAK_BLOCK_EFFECT);
    game_over_effect = new Sound(this, SOUND + GAME_OVER_EFFECT, 0.5);
    course_clear_effect = new Sound(this, SOUND + COURSE_CLEAR_EFFECT, 0.5);
    lets_a_go_effect = new Sound(this, SOUND + LETS_A_GO_EFFECT, 0.3);
  //

  /**
   * Timer
   */
    loadLevelScreenTimeDuration = new Timer(200); //Tempo della durata del dead screen, prima del reset
    deathAnimationLevelTimeDuration = new Timer(150); //Tempo di durata dell'animazione, prima dell'inizio del dead screen
    gameOverScreenTimeDuration = new Timer(300); //Tempo di durata del game over screen, prima del reset
    newLevelAnimationLevelTimeDuration = new Timer(450); 
    pauseKeyTimeDuration = new Timer(10);
  //

  /**
   * Dictionary side <boolean - string>
   */
    booleanSide = new HashMap<Boolean, String>();

    booleanSide.put(true, RX);
    booleanSide.put(false, LX);
  //

  /**
   * Dictionary of sprites
   */
    imageDictionary = new HashMap<String, ArrayList<PImage>>();

    /**
    * Player
    */
      /**
      * Player Base
      */
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
      //

      /**
      * Player Super Mushroom Power Up
      */
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
      //

      /**
      * Player Fire Flower Power Up
      */
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
      //
    //
    
    /**
    * Coin
    */
      imageDictionary.put("coin", new ArrayList<PImage>() {{
        add(loadImage(POWER_UP + COIN_0));
        add(loadImage(POWER_UP + COIN_1));
        add(loadImage(POWER_UP + COIN_2));
        add(loadImage(POWER_UP + COIN_3));
      }});
    //

    /**
    * Fire Ball
    */
      imageDictionary.put("fireFlower", new ArrayList<PImage>() {{
        add(loadImage(POWER_UP + FIRE_FLOWER_0));
        add(loadImage(POWER_UP + FIRE_FLOWER_1));
        add(loadImage(POWER_UP + FIRE_FLOWER_2));
        add(loadImage(POWER_UP + FIRE_FLOWER_3));
      }});
    //

    /**
    * Goomba
    */
      imageDictionary.put("goomba", new ArrayList<PImage>() {{
        add(loadImage(GOOMBA + RX + GOOMBA_NEUTRAL));
        add(loadImage(GOOMBA + LX + GOOMBA_NEUTRAL));
      }});
    //

    /**
    * Fire Ball
    */
      imageDictionary.put("fireBall", new ArrayList<PImage>() {{
        add(loadImage(FIRE_BALL_0));
        add(loadImage(FIRE_BALL_1));
        add(loadImage(FIRE_BALL_2));
        add(loadImage(FIRE_BALL_3));
      }});
    //

    /**
    * Green Koopa Troopa
    */
      imageDictionary.put(KOOPA + GREEN_KOOPA_TROOPA + RX, new ArrayList<PImage>() {{
        add(loadImage(KOOPA + RX + GREEN_KOOPA_TROOPA + KOOPA_0));
        add(loadImage(KOOPA + RX + GREEN_KOOPA_TROOPA + KOOPA_1));
      }});

      imageDictionary.put(KOOPA + GREEN_KOOPA_TROOPA + LX, new ArrayList<PImage>() {{
        add(loadImage(KOOPA + LX + GREEN_KOOPA_TROOPA + KOOPA_0));
        add(loadImage(KOOPA + LX + GREEN_KOOPA_TROOPA + KOOPA_1));
      }});
      
      imageDictionary.put(KOOPA + GREEN_KOOPA_TROOPA + KOOPA_SHELL_0, new ArrayList<PImage>() {{
        add(loadImage(KOOPA + GREEN_KOOPA_TROOPA + KOOPA_SHELL_0));

      }});

      imageDictionary.put(KOOPA + GREEN_KOOPA_TROOPA + KOOPA_SHELL_1, new ArrayList<PImage>() {{
        add(loadImage(KOOPA + GREEN_KOOPA_TROOPA + KOOPA_SHELL_1));
      }});
    //
    
    /**
    * Question Block
    */
      imageDictionary.put("question_block", new ArrayList<PImage>() {{
        add(loadImage(QUESTION_BLOCK + QUESTION_BLOCK_1));
        add(loadImage(QUESTION_BLOCK + QUESTION_BLOCK_2));
        add(loadImage(QUESTION_BLOCK + QUESTION_BLOCK_3));
      }});

      imageDictionary.put("question_block_empty", new ArrayList<PImage>() {{
        add(loadImage(QUESTION_BLOCK + QUESTION_BLOCK_EMPTY));
      }});
    //
  //

  /**
   * Settings
   */
    windowTitle(GAME_TITLE);
    frameRate(FRAME_RATE);
    fullScreen();
    surface.setAlwaysOnTop(true);
    noCursor();
  //

  player = new Player(MARIO + MARIO_BASE + RX + MARIO_NEUTRAL, new PVector(0, 0));

  /**
   * Levels
   */
    levels = new ArrayList<Level>();

    levels.add(new Level0());
    levels.add(new Level1());
    levels.add(new Level2());
    levels.add(new Level3());
  //

  /**
   * Key dictionary
   */
    keyMap = new HashMap<String, Key>();

    keyMap.put("a_key", new Key('a'));
    keyMap.put("d_key", new Key('d'));
    keyMap.put("x_key", new Key('x'));
    keyMap.put("X_key", new Key('X'));
    keyMap.put("p_key", new Key('p'));
    keyMap.put("P_key", new Key('P'));
    keyMap.put("e_key", new Key('e'));
    keyMap.put("E_key", new Key('E'));
    keyMap.put("left_arrow_key", new Key(LEFT));
    keyMap.put("right_arrow_key", new Key(RIGHT));
    keyMap.put("shift_key", new Key(SHIFT));
    keyMap.put("spacebar_key", new Key(32));
  //
  
  level = levels.get(0);
  level.startLevel();
  player.resetGameOver();
  
  /**
   * Load level HUD
   */
    levelNameString.append(level.name);
    titleLoadLevelText = new Text(STANDARD_FONT, GAME_WIDTH / 2, 250, levelNameString, 255, 130, CENTER);

    lifeLoadLevelIcon = new Sprite(POWER_UP + ONE_UP_MUSHROOM_BIG, new PVector(700, 400));
    lifeLoadLevelText = new Text(STANDARD_FONT, lifeLoadLevelIcon.position.x + 195 + 10, lifeLoadLevelIcon.position.y + 135, player.lifeHudString, 255, 100);

    coinLoadLevelIcon = new Sprite(POWER_UP + COIN_0_BIG, new PVector(740, 700));
    coinLoadLevelText = new Text(STANDARD_FONT, coinLoadLevelIcon.position.x + 155 + 10, coinLoadLevelIcon.position.y + 135, player.coinHudString, 255, 100);
  //

  /**
   * Game over HUD
   */
    gameOverText = new Text(
      STANDARD_FONT, 
      GAME_WIDTH / 2, 
      GAME_HEIGHT / 2 - 50, 
      new StringBuilder(
          "GAME\n" +
          "OVER"),
      color(255, 255, 255), 
      200,
      CENTER
    );
  //

  /**
   * Pause HUD
   */
    pauseText = new Text(
      STANDARD_FONT, 
      GAME_WIDTH / 2, 
      GAME_HEIGHT / 2 - 180, 
      new StringBuilder(
          "Press P to resume\n" +
          "\n" +
          "or\n" +
          "\n" +
          "Press E to exit"),
      color(255, 255, 255), 
      100,
      CENTER
    );
  //

  pause = false;
}
//

/**
 * Update the level status.
 */
void updateLevel() {
  level.update();
  player.update(level.platforms, level.powerUps);
}
//

/**
 * Draw the level.
 */
void drawLevel() {
  pushMatrix();
    updateLevel();

    translate(-level.cameraX, 0);
  
    level.draw();
    
    for (int i = player.fireBalls.size() - 1; i >= 0; i--) {
      FireBall fireBall = player.fireBalls.get(i);
      fireBall.update(level.platforms, level.powerUps);
      fireBall.draw();
      if (fireBall.isDead) {
        player.fireBalls.remove(i);
      }
    } 
    player.draw();

    translate(level.cameraX, 0);
  popMatrix();

  level.drawHud();
}
//

/**
 * Draw the game over screen.
 */
void gameOverDraw() {
  background(0, 0, 0);
  gameOverText.draw();
}

/**
 * Draw the load level screen.
 */
void loadLevelDraw() {
  background(0);
  coinLoadLevelIcon.draw();
  coinLoadLevelText.draw();
  lifeLoadLevelIcon.draw();
  lifeLoadLevelText.draw();
  titleLoadLevelText.draw();
}

/**
 * Manage the pause Key when it is pressed, by setting pause true and resetting the timer.
 */
void pauseKeyTrue() {
  if (getKeyStatus("p_key") || getKeyStatus("P_key")) {
    pause = true;
    pauseKeyTimeDuration.reset();
  }
}
//

/**
 * Manage the pause Key when it is pressed, by setting pause false and resetting the timer.
 */
void pauseKeyFalse() {
  if (getKeyStatus("p_key") || getKeyStatus("P_key")) {
    pause = false;
    pauseKeyTimeDuration.reset();
  }
}

/**
 * Draw the pause screen.
 */
void pauseDraw() {
  background(0);
  pauseText.draw();
}

/**
 * Draw the main window.
 */
void draw() {
  if (!player.isDead) { // When the player is not dead
    if (level.isFinished) {
      if (loadLevelScreenTimeDuration.tick()) {
        if (level.id + 1 < levels.size()) {
          level = levels.get(level.id + 1);
          player.reset();
        } else {
          level = levels.get(0);
          for (Level level : levels) {
            level.reset();
          }
          player.resetGameOver();
        }

        player.immunity = false;
        
        level.startLevel();
        
        newLevelAnimationLevelTimeDuration.reset();
        loadLevelScreenTimeDuration.reset();
        drawLevel();
      } else {
        newLevelAnimationLevelTimeDuration.update();
        if (newLevelAnimationLevelTimeDuration.tick()) { 
          loadLevelScreenTimeDuration.update();
          loadLevelDraw();
        } else {
          player.stopX();
          player.jump = false;
          player.immunity = true;
          drawLevel();
        }      
      }   
    } else {
      if (pause) {
        if (pauseKeyTimeDuration.tick()) {
          pauseKeyFalse();
          if (getKeyStatus("e_key") || getKeyStatus("E_key")) {
            exit();
          }
        } else {
          pauseKeyTimeDuration.update();
        }

        pauseDraw();
        if (!pause) {
          level.music.play();
        } else {
          level.music.pause();
        }
        
      } else {
        if (pauseKeyTimeDuration.tick()) {
          pauseKeyTrue();
        } else {
          pauseKeyTimeDuration.update();
        }
        
        drawLevel();
      }
      
    }
  } 
  else if (player.lives <= 0)  // When the player runs out of lives
  {
    if (gameOverScreenTimeDuration.tick()) {
      player.immunity = false;
      level = levels.get(0);
      for (Level level : levels) {
        level.reset();
      }
      level.startLevel();
      levelNameString.replace(0, levelNameString.length(), level.name);
      player.resetGameOver();
      gameOverScreenTimeDuration.reset();
      deathAnimationLevelTimeDuration.reset();
    } else {
      deathAnimationLevelTimeDuration.update();
      if (deathAnimationLevelTimeDuration.tick()) {
        if (gameOverScreenTimeDuration.elapsed == 0) {
          game_over_effect.play();
        }
        gameOverScreenTimeDuration.update();
        gameOverDraw();
      } else {
        player.immunity = true;
        drawLevel();
      }      
    }
  } 
  else //When the player dies
  { 
    if (loadLevelScreenTimeDuration.tick()) {
      player.immunity = false;
      level.startLevel();
      player.resetDead();
      loadLevelScreenTimeDuration.reset();
      deathAnimationLevelTimeDuration.reset();
    } else {
      deathAnimationLevelTimeDuration.update();
      if (deathAnimationLevelTimeDuration.tick()) {
        loadLevelScreenTimeDuration.update();
        loadLevelDraw();
      } else {
        player.immunity = true;
        drawLevel();
      }      
    }
  }
}
//

/**
 * Update the levelNameString with the name of the next level.
 */
void updateNextLevelName() {
  if (level.id + 1 <  levels.size()) {
    levelNameString.replace(0, levelNameString.length(), levels.get(level.id + 1).name);
  } else {
    levelNameString.replace(0, levelNameString.length(), levels.get(0).name);
  }
}
//

/**
 * Manage the key pressing.
 */
void keyPressed() {
  if (key == ESC) {
    key = 0;
  } else {
    for (Key keyToUpdate : keyMap.values()) {
    if (key == CODED) {
      if (keyCode == keyToUpdate.keyCode) {
        keyToUpdate.keyPressed();
      }
    } 
    else {
      if (key == keyToUpdate.keyCode) {
        keyToUpdate.keyPressed();
      }
    }
  }
  }
}
//

/**
 * Manage the key releasing.
 */
void keyReleased() {
  for (Key keyToUpdate : keyMap.values()) {
    if (key == CODED) {
      if (keyCode == keyToUpdate.keyCode) {
        keyToUpdate.keyReleased();
      }
    } 
    else {
      if (key == keyToUpdate.keyCode) {
        keyToUpdate.keyReleased();
      }
    }
  }
}
//

/**
 * Check the key status.
 * - return the key status, true if pressed, else otherwise.
 */
boolean getKeyStatus(String keyName) {
  return keyMap.get(keyName).pressed;
}
//
