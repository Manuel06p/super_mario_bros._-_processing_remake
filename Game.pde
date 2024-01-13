// File: Game.pde
import java.util.Iterator;
import java.util.Collections;

Level level;
Player player;
HashMap<String, Key> keyMap;

Sound overworld_ost;
Sound powerup_effect;
Sound jump_super_effect;
Sound coin_effect;

void setup() {
  fullScreen();
  windowTitle(GAME_TITLE);
  frameRate(FRAME_RATE);
  level = livello1();

  keyMap = new HashMap<String, Key>();
  
  // Aggiungi gli oggetti Key al dizionario
  keyMap.put("a_key", new Key('a'));
  keyMap.put("d_key", new Key('d'));
  keyMap.put("left_arrow_key", new Key(LEFT));
  keyMap.put("right_arrow_key", new Key(RIGHT));
  keyMap.put("shift_key", new Key(SHIFT));
  keyMap.put("spacebar_key", new Key(32));

  overworld_ost = new Sound(this, SOUND + OVERWORLD_OST);
  powerup_effect = new Sound(this, SOUND + POWERUP_EFFECT);
  jump_super_effect = new Sound(this, SOUND + JUMP_SUPER_EFFECT);
  coin_effect = new Sound(this, SOUND + COIN_EFFECT);

  player = new Player(MARIO + MARIO_BASE + RX + MARIO_NEUTRAL, level.playerInitialPosition.copy());

  overworld_ost.loop();
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

// Aggiorna la logica del gioco
void update() {
  level.update();
  player.update(level.platforms, level.powerUps);

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
