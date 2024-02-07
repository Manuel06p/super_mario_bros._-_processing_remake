/**
Classe per la gestione di un suono.
*/
import processing.sound.*;
 
class Sound {
  SoundFile sound;

  /**
  Crea un nuovo oggetto Sound.
  - parent: componente parent del suono.
  - path: percorso della risorsa.
  */  
  Sound(PApplet parent, String path) {
    sound = new SoundFile(parent, path);
  }

  Sound(PApplet parent, String path, float volume) {
    this(parent, path);
    volume(volume);
  }
  
  /**
  Esegue il suono.
  */    
  void play() {
    sound.play();
  }
  
  /**
  Esegue il suono in loop.
  */
  void loop() {
    sound.loop();
  }
  
  /**
  Mette in pausa il suono.
  */
  void pause() {
    sound.pause();
  }
  
  /**
  Interrompe il suono.
  */
  void stop() {
    sound.stop();
  }
  
  /**
  Imposta il volume del suono.
  - value: volume del suono (0.0 - 1.0)
  */
  void volume(float value) {
    sound.amp(value);
  }

  boolean isPlaying() {
    return sound.isPlaying();
  }
}
