Platform ground(float x, float y) {
  return new Platform(
    GROUND_GROUP, //texture
    new PVector(x, GAME_HEIGHT - y),  //position
    true, //hasBounds
    0, //breakabilityUp
    0, //breakabilityDown
    0, //breakabilityLeft
    0 //breakabilityRight
  );
}

Platform single_brick(float x, float y) {
  return new Platform(
    BRICK, //texture
    new PVector(x, GAME_HEIGHT - y),  //position
    true, //hasBounds
    3, //breakabilityUp
    2, //breakabilityDown
    3, //breakabilityLeft
    3 //breakabilityRight
  );
}

QuestionBlock question_block(float x, float y, String powerUp) {
  return new QuestionBlock(
    QUESTION_BLOCK + QUESTION_BLOCK_1, //texture
    new PVector(x, GAME_HEIGHT - y),  //position
    true, //hasBounds
    3, //breakabilityUp
    3, //breakabilityDown
    3, //breakabilityLeft
    3, //breakabilityRight
    powerUp // powerUp
  );
}