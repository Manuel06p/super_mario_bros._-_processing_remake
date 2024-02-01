// File: Game.pde
import java.util.Iterator;
import java.util.Collections;
import java.lang.Object.*;


Level level;
Player player;
HashMap<String, Key> keyMap;
HashMap<String, Level> levels;

Sound overworld_ost;
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

Timer deadResetTimeout;
Timer deadScreenTimeout;

Text coinLoadLevelText;
Sprite coinLoadLevelIcon;
HashMap<String, ArrayList<PImage>> imageDictionary;
Text lifeLoadLevelText;
Sprite lifeLoadLevelIcon;

StringBuilder levelNameString = new StringBuilder();

void setup() {
  overworld_ost = new Sound(this, SOUND + OVERWORLD_OST);
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

  deadResetTimeout = new Timer(200); //Tempo della durata del dead screen, prima del reset
  deadScreenTimeout = new Timer(150); //Tempo di durata dell'animazione, prima dell'inizio del dead screen

  booleanSide.put(true, RX);
  booleanSide.put(false, LX);

  /**
   * Dictionary of sprites
   */
  imageDictionary = new HashMap<String, ArrayList<PImage>>();

  /**
   * Coin
   */
    imageDictionary.put("coin", new ArrayList<PImage>() {{
      add(loadImage(POWER_UP + COIN_0));
      add(loadImage(POWER_UP + COIN_1));
      add(loadImage(POWER_UP + COIN_2));
      add(loadImage(POWER_UP + COIN_3));
    }});

  /**
   * Fire Ball
   */
    imageDictionary.put("fireFlower", new ArrayList<PImage>() {{
      add(loadImage(POWER_UP + FIRE_FLOWER_0));
      add(loadImage(POWER_UP + FIRE_FLOWER_1));
      add(loadImage(POWER_UP + FIRE_FLOWER_2));
      add(loadImage(POWER_UP + FIRE_FLOWER_3));
    }});

  /**
   * Goomba
   */
    imageDictionary.put("goomba", new ArrayList<PImage>() {{
      add(loadImage(GOOMBA + RX + GOOMBA_NEUTRAL));
      add(loadImage(GOOMBA + LX + GOOMBA_NEUTRAL));
    }});

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
  
  
  fullScreen();
  windowTitle(GAME_TITLE);
  frameRate(FRAME_RATE);

  levels = new HashMap<String, Level>();

  levels.put("level_1", new Level1());

  level = levels.get("level_1");

  keyMap = new HashMap<String, Key>();

  
  // Aggiungi gli oggetti Key al dizionario
  keyMap.put("a_key", new Key('a'));
  keyMap.put("d_key", new Key('d'));
  keyMap.put("x_key", new Key('x'));
  keyMap.put("X_key", new Key('X'));
  keyMap.put("left_arrow_key", new Key(LEFT));
  keyMap.put("right_arrow_key", new Key(RIGHT));
  keyMap.put("shift_key", new Key(SHIFT));
  keyMap.put("spacebar_key", new Key(32));

  
  

  player = new Player(MARIO + MARIO_BASE + RX + MARIO_NEUTRAL, level.playerInitialPosition);

  coinLoadLevelIcon = new Sprite(POWER_UP + COIN_0_BIG, new PVector(740, 600));
  coinLoadLevelText = new Text(STANDARD_FONT, coinLoadLevelIcon.position.x + 120, coinLoadLevelIcon.position.y + 135, level.coinHudString, 255, 100);

  lifeLoadLevelIcon = new Sprite(POWER_UP + ONE_UP_MUSHROOM_BIG, new PVector(700, 200));
  lifeLoadLevelText = new Text(STANDARD_FONT, lifeLoadLevelIcon.position.x + 195, lifeLoadLevelIcon.position.y + 135, level.lifeHudString, 255, 100);

  levelNameString.append(level.name);

  lifeLoadLevelText = new Text(STANDARD_FONT, 195, 135, levelNameString, 255, 100);

}

// Aggiorna la logica del gioco
void updateLevel() {
  level.update();
  player.update(level.platforms, level.powerUps);
}

void drawLevel() {
  background(159, 203, 255);
  pushMatrix();
    updateLevel();
    // Spostare il display in base alla posizione della telecamera
    translate(-level.cameraX, 0);
  
    // Disegnare il livello
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

  
    // Reimpostare la trasformazione per il prossimo frame
    translate(level.cameraX, 0);
  popMatrix();

  level.drawHud();
}



void loadLevelDraw() {
  background(0);
  coinLoadLevelIcon.draw();
  coinLoadLevelText.draw();
  lifeLoadLevelIcon.draw();
  lifeLoadLevelText.draw();
}

void draw() {
  // Chiamare la funzione update del livello
  if (!player.isDead) {
      drawLevel();
  } else if (player.lives <= 0) {
    
  } else {
    if (deadResetTimeout.tick()) { // Attiva il reset del player alla fine del timer
      level.reset();
      player.reset(level.playerInitialPosition);
      deadResetTimeout.reset();
      deadScreenTimeout.reset();
    } else {
      deadScreenTimeout.update();
      if (deadScreenTimeout.tick()) { // Attiva lo screen delle vite dopo l'animazione alla fine del timer
        deadResetTimeout.update();
        loadLevelDraw();
      } else {
        drawLevel();
      }      
    }
  }

  
  
}



void keyPressed() {
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

boolean getKeyStatus(String keyName) {
  return keyMap.get(keyName).pressed;
}
