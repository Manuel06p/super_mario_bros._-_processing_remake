// File: Game.pde
import java.util.Iterator;
import java.util.Collections;

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

void setup() {
  overworld_ost = new Sound(this, SOUND + OVERWORLD_OST);
  powerup_effect = new Sound(this, SOUND + POWERUP_EFFECT);
  jump_effect = new Sound(this, SOUND + JUMP_EFFECT);
  coin_effect = new Sound(this, SOUND + COIN_EFFECT);
  kick_effect = new Sound(this, SOUND + KICK_EFFECT);
  pipe_effect = new Sound(this, SOUND + PIPE_EFFECT);
  die_effect = new Sound(this, SOUND + DIE_EFFECT);

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
  keyMap.put("left_arrow_key", new Key(LEFT));
  keyMap.put("right_arrow_key", new Key(RIGHT));
  keyMap.put("shift_key", new Key(SHIFT));
  keyMap.put("spacebar_key", new Key(32));

  

  player = new Player(MARIO + MARIO_BASE + RX + MARIO_NEUTRAL, level.playerInitialPosition.copy());
}

// Aggiorna la logica del gioco
void update() {
  if (player.isDead) {
    level.reset();
    player.reset(level.playerInitialPosition);
  }
  level.update();
  player.update(level.platforms, level.powerUps);

}


void draw() {
  background(159, 203, 255);

  // Chiamare la funzione update del livello
  update();

  // Spostare il display in base alla posizione della telecamera
  translate(-level.cameraX, 0);

  // Disegnare il livello
  level.draw();
  player.draw();

  // Reimpostare la trasformazione per il prossimo frame
  translate(level.cameraX, 0);
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
