/**
 * Class used to manage the Timer.
 */
class Timer {
  int delay;
  int elapsed;
  
  /**
   * Create a new Timer object.
   * - delay: timer duration.
   */
  Timer(int delay) {
    this.delay = delay;
    elapsed = 0;
  }
  //

  /**
   * Reset the Timer.
   */
  void reset() {
    elapsed = 0;
  }
  //

  /**
   * Update the Timer status when is not finished.
   */
  void update() {
    if (elapsed <= delay) {
      elapsed++;
    }
  }
  //

  /**
   * Check the Timer status.
   * - returns true if the Timer is finished, false otherwise.
   */
  boolean tick() {
    if (elapsed >= delay) {
      return true;
    }
    return false;
  }
  //

}
//