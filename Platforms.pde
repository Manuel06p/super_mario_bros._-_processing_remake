Platform single_brick(int x, int y) {
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

QuestionBlock question_block(int x, int y) {
    return new QuestionBlock(
      QUESTION_BLOCK + QUESTION_BLOCK_1, //texture
      new PVector(x, GAME_HEIGHT - y),  //position
      true, //hasBounds
      3, //breakabilityUp
      3, //breakabilityDown
      3, //breakabilityLeft
      3 //breakabilityRight
    );
}