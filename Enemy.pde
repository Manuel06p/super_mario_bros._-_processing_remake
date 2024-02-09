// File: Enemy.pde

class Enemy extends Entity {
  int damage;
  int health;
  boolean isActive = true;

  Enemy(String path, PVector initialPosition, int health, int damage, float gravity, float speed, float smallJumpValue, float superJumpValue, int breakingValueUp, int breakingValueDown, int breakingValueLeft, int breakingValueRight) {
    //super(path: String, posizione iniziale: PVector, salute: int, gravitWà: float, velocità: float, salto: float)
    super(path, new PVector(initialPosition.x, GAME_HEIGHT-initialPosition.y), gravity, speed, smallJumpValue, superJumpValue, breakingValueUp, breakingValueDown, breakingValueLeft, breakingValueRight);
    this.health = health;
    this.damage = damage;
  }

  @Override
  void takeDamage(int damage) {
    super.takeDamage(damage);
    health -= damage;
    if (health <= 0 || damage == -1) {
        isActive = false;
    }
  }

  @Override
  void update(ArrayList<Platform> platforms, ArrayList<PowerUp> powerUps) {
    super.update(platforms, powerUps);
    
    for (Enemy enemy : level.enemies) {
      if (collideLeft(enemy)) {
        leftCollision = true;
      } else if(collideRight(enemy)){
        rightCollision = true;
      }
    }

    for (FireBall fireBall : player.fireBalls) {
      if (collideDown(fireBall) || collideUp(fireBall) || collideRight(fireBall) || collideLeft(fireBall)) {
        takeDamage(fireBall.damage);
        fireBall.isDead = true;
        kick_effect.play();
      }
    }
  }

  @Override
  void draw() {
    super.draw();
  }
}
