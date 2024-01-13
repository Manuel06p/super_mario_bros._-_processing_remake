// File: Enemy.pde

class Enemy extends Entity {
  int damage;
  int health;

  Enemy(String path, PVector initialPosition, int health, int damage, float gravity, float speed, float jumpValue, int breakingValueUp, int breakingValueDown, int breakingValueLeft, int breakingValueRight) {
    //super(path: String, posizione iniziale: PVector, salute: int, gravità: float, velocità: float, salto: float)
    super(path, initialPosition, gravity, speed, jumpValue, breakingValueUp, breakingValueDown, breakingValueLeft, breakingValueRight);
    this.health = health;
    this.damage = damage;
  }

  // Altri metodi specifici del nemico, se necessario

  /**
   * Riduci la salute del nemico.
   * - damage: valore del danno inflitto.
   */
  void takeDamage(int damage) {
    health -= damage;
    if (health <= 0) {
      // Il nemico è stato sconfitto, puoi implementare ulteriori azioni qui
    }
  }


  /**
   * Ottieni il valore del danno inflitto dal nemico.
   * - ritorna il valore del danno.
   */
  int getDamage() {
    return damage;
  }

  @Override
  void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
    super.update(platforms, powerUps); // Chiama l'aggiornamento di Entity
  }

  /**
   * Disegna il nemico.
   */
  @Override
  void draw() {
    super.draw();  // Chiamare il metodo draw della classe madre (Entity)
    // Puoi aggiungere ulteriori dettagli di disegno specifici per il nemico, se necessario
  }
}
