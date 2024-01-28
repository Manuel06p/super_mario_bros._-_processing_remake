// File: Platform.pde
class Platform extends Sprite {
  // Puoi aggiungere ulteriori caratteristiche specifiche della piattaforma qui

  boolean hasBounds;


  HashMap<String, Integer> breakability = new HashMap<String, Integer>();



  /**
   * Crea una nuova piattaforma.
   * - path: percorso della risorsa.
   * - initialPosition: posizione iniziale della piattaforma.
   */
  Platform(String path, PVector initialPosition, boolean hasBounds, int breakabilityUp, int breakabilityDown, int breakabilityLeft, int breakabilityRight) {
    super(path, new PVector(initialPosition.x, GAME_HEIGHT-initialPosition.y));
    this.hasBounds = hasBounds;


    this.breakability.put("up", breakabilityUp);
    this.breakability.put("down", breakabilityDown);
    this.breakability.put("left", breakabilityLeft);
    this.breakability.put("right", breakabilityRight);

  }

  @Override
  void update() {
    super.update();
    // Aggiorna la logica della piattaforma, se necessario
  }

  /**
   * Disegna la piattaforma.
   * - Puoi sovrascrivere questo metodo per personalizzare il disegno della piattaforma.
   */
  @Override
  void draw() {  
    super.draw();  // Chiamare il metodo draw della classe madre
    // Puoi aggiungere ulteriori dettagli di disegno specifici della piattaforma, se necessario
  }
}
