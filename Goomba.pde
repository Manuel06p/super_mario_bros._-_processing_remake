class Goomba extends Enemy {
  int damage;
  int health;
  boolean isActive = true;

  Goomba(float x, float y) {

    super(GOOMBA + RX + GOOMBA_NEUTRAL, //path
            new PVector(x, y), //initialPosition
            1, //health
            1, //damage
            GRAVITY, //gravity
            3.0, //speed
            5.0, //jumpValue
            1, //breakingValueUp
            0, //breakingValueDown
            0, //breakingValueLeft
            0 //breakingValueRight
    );
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
