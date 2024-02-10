/**
 * Class used to manage the entity Enemy. It extends the Entity class.
 */
class Enemy extends Entity {
  int damage;
  int health;
  boolean isActive = true;

  /**
    * Create a new Enemy object.
    * - path: texture path.
    * - initialPosition: PVector containing coordinates of the starting position. The y is calculated from the base.
    * - health: health value.
    * - damage: damage value.
    * - gravity: gravity value.
    * - speed: speed value.
    * - smallJumpValue: small jump value.
    * - superJumpValue: super jump value.
    * - breakingValueUp: breaking value up.
    * - breakingValueDown: breaking value down.
    * - breakingValueLeft: breaking value left.
    * - breakingValueRight: breaking value right.
  */
  Enemy(String path, PVector initialPosition, int health, int damage, float gravity, float speed, float smallJumpValue, float superJumpValue, int breakingValueUp, int breakingValueDown, int breakingValueLeft, int breakingValueRight) {
    super(
      path, 
      new PVector(initialPosition.x, GAME_HEIGHT-initialPosition.y),
      gravity, 
      speed, 
      smallJumpValue, 
      superJumpValue, 
      breakingValueUp, 
      breakingValueDown,
      breakingValueLeft,
      breakingValueRight
    );
    this.health = health;
    this.damage = damage;
  }
  //

  /**
    * Manage the Enemy when it get damaged.
    * - damage: damage received value.
  */
  @Override
  void takeDamage(int damage) {
    super.takeDamage(damage);
    health -= damage;
    if (health <= 0 || damage == -1) {
        if (damage != - 1) {
          kick_effect.play();
        }
        
        isActive = false;
    }
  }
  //

  /**
    * Update the Enemy status.
    * - platforms: ArrayList of platforms.
    * - powerUps: ArrayList of power ups.
  */
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
        
      }
    }
  }
  //

  /**
    * Draw the Enemy.
  */
  @Override
  void draw() {
    super.draw();
  }
  //

}
//