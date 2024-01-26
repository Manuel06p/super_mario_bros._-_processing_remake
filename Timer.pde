/**
Classe per la gestione di un timer.
*/
class Timer {
  int delay;
  int elapsed;
  
  /**
  Crea un nuovo oggetto Timer.
  - delay: numero di frame di attesa.
  */
  Timer(int delay) {
    this.delay = delay;
    elapsed = 0;
  }

  /**
  Reimposta il timer.
  */
  void reset() {
    elapsed = 0;
  }

  /**
  Aggiorna il timer.
  */
  void update() {
    if (elapsed <= delay) {
      elapsed++;
    }
  }

  /**
  Verifica il tick del timer.
  - ritorna true se il timer ha eseguito un tick, altrimenti false.
  */
  boolean tick() {
    if (elapsed >= delay) {
      //elapsed = 0;
      return true;
    }
    return false;
  }
}
