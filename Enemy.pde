// File: Enemy.pde

class Enemy extends Entity {
  int damage;
  int health;
  boolean isActive = true;

  Enemy(String path, PVector initialPosition, int health, int damage, float gravity, float speed, float jumpValue, int breakingValueUp, int breakingValueDown, int breakingValueLeft, int breakingValueRight) {
    //super(path: String, posizione iniziale: PVector, salute: int, gravità: float, velocità: float, salto: float)
    super(path, initialPosition, gravity, speed, jumpValue, breakingValueUp, breakingValueDown, breakingValueLeft, breakingValueRight);
    this.health = health;
    this.damage = damage;
  }

  void takeDamage(int damage) {
    health -= damage;
    if (health <= 0) {
      isActive = false;
    }
  }

  @Override
  void update() {
    super.update();
  }

  @Override
  void draw() {
    super.draw();
  }
}
