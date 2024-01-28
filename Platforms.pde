Platform ground(float x, float y) {
  return new Platform(
    GROUND_GROUP, //texture
    new PVector(x, y),  //position
    true, //hasBounds
    0, //breakabilityUp
    0, //breakabilityDown
    0, //breakabilityLeft
    0 //breakabilityRight
  );
}

Platform ground_17x1(float x, float y) {
  return new Platform(
    GROUND_17X1, //texture
    new PVector(x, y),  //position
    true, //hasBounds
    0, //breakabilityUp
    0, //breakabilityDown
    0, //breakabilityLeft
    0 //breakabilityRight
  );
}

Platform brick(float x, float y) {
  return new Platform(
    BRICK, //texture
    new PVector(x, y),  //position
    true, //hasBounds
    3, //breakabilityUp
    2, //breakabilityDown
    3, //breakabilityLeft
    3 //breakabilityRight
  );
}

Platform block(float x, float y) {
  return new Platform(
    BLOCK, //texture
    new PVector(x, y),  //position
    true, //hasBounds
    3, //breakabilityUp
    3, //breakabilityDown
    3, //breakabilityLeft
    3 //breakabilityRight
  );
}

QuestionBlock question_block(float x, float y, String powerUp) {
  return new QuestionBlock(
    QUESTION_BLOCK + QUESTION_BLOCK_1, //texture
    new PVector(x, y),  //position
    true, //hasBounds
    3, //breakabilityUp
    3, //breakabilityDown
    3, //breakabilityLeft
    3, //breakabilityRight
    powerUp // powerUp
  );
}