Level livello1() {
  ArrayList<Platform> platforms = new ArrayList<>();
  ArrayList<Enemy> enemies = new ArrayList<>();
  ArrayList<PowerUp> powerUps = new ArrayList<>();
  int length = 11520;
  float cameraSpeed = 0.5;
  PVector playerInitialPosition = new PVector(50, 50);  // Imposta la posizione iniziale del giocatore

  //Piattaforme
  platforms.add(
    new Platform(
      GROUND_GROUP, //texture
      new PVector(0, GAME_HEIGHT-120),  //position
      true, //hasBounds
      0, //breakabilityUp
      0, //breakabilityDown
      0, //breakabilityLeft
      0 //breakabilityRight
    )
  );

  platforms.add(single_brick(1080, 500));
  platforms.add(question_block(1200, 500));
  platforms.add(single_brick(1320, 500));
  platforms.add(single_brick(1800, 240));
  platforms.add(single_brick(800, 240));

  powerUps.add(new Coin(1500, 500));

  //Nemici
  enemies.add(new Goomba(150, 350));
  //String path, PVector initialPosition, int health, int damage, float gravity, float speed, float jumpValue

  // Crea e restituisci un nuovo livello
  return new Level(platforms, enemies, powerUps, length, "level_1", "Livello 1", 1, cameraSpeed, playerInitialPosition);
}
