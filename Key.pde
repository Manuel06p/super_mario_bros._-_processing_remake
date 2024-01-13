class Key {
  int keyCode;
  boolean pressed;

  Key(int keyCode) {
    this.keyCode = keyCode;
    pressed = false;
  }

  void keyPressed() {
    pressed = true;
  }

  void keyReleased() {
    pressed = false;
  }
}
