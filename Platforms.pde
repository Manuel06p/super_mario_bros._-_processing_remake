/**
 * Methods used to create easily platforms.
 */



/**
 * Create a ground platform.
 * - x: horizontal coordinate.
 * - y: vertical coordinate, starts from the base.
 * - w: number of horizontal blocks.
 * - h: number of vertical blocks.
 */
Platform ground(float x, float y, int width, int height) {
  return new Platform(
    GROUND + width + "x" + height + GROUND_SPRITE,
    new PVector(x, y),
    0,
    0,
    0,
    0
  );
}
//

/**
 * Create a brick platform.
 * - x: horizontal coordinate.
 * - y: vertical coordinate, starts from the base.
 * - w: number of horizontal blocks.
 * - h: number of vertical blocks.
 */
Platform brick(float x, float y, int width, int height) {
  return new Platform(
    BRICK + width + "x" + height + BRICK_SPRITE,
    new PVector(x, y),
    2,
    2,
    2,
    2
  );
}
//

/**
 * Create a brick platform.
 * - x: horizontal coordinate.
 * - y: vertical coordinate, starts from the basee.
 * - w: number of horizontal blocks.
 * - h: number of vertical blocks.
 */
Platform block(float x, float y, int width, int height) {
  return new Platform(
    BLOCK + width + "x" + height + BLOCK_SPRITE,
    new PVector(x, y),
    3,
    3,
    3,
    3
  );
}
//

/**
 * Create a brick platform.
 * - x: horizontal coordinate.
 * - y: vertical coordinate, starts from the base.
 * - powerUp: type of power up.
 * - isRight: starts moving to the right.
 */
QuestionBlock question_block(float x, float y, String powerUp, boolean isRight) {
  return new QuestionBlock(
    QUESTION_BLOCK + QUESTION_BLOCK_1,
    new PVector(x, y),
    3,
    3,
    3,
    3,
    powerUp,
    isRight
  );
}
//



//