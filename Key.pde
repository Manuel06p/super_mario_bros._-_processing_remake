/**
 * Class used to manage the keys of the keyboard.
 */
class Key {

  int keyCode;
  boolean pressed;

  /**
   * Create a new Key object.
   * - keyCode: keyCode of the key.
   */
  Key(int keyCode) {
    this.keyCode = keyCode;
    pressed = false;
  }
  //

  /**
   * Set pressed true if the key is pressed.
   */
  void keyPressed() {
    pressed = true;
  }
  //

  /**
   * Set pressed fasle if the key is released.
   */
  void keyReleased() {
    pressed = false;
  }
  //

}
//