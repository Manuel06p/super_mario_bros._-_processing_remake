/**
 * Class used to manage the text.
 */
class Text {

  PVector position;
  color font_color;
  int size;
  PFont font;
  StringBuilder text;
  int textAlignment = LEFT;
  
  /**
   * Create a new Text object.
   * - path: texture path.
   * - x: horizontal coordinate.
   * - y: vertical coordinate.
   * - text: text passed as StringBuilder, so it acts like if the text was passed for reference.
   * - font_color: color of the text.
   * - size: text size.
   */
  Text(String path, float x, float y, StringBuilder text, color font_color, int size) {
    position = new PVector(x, y);
    this.font_color = font_color;
    this.size = size;
    this.text = text;
    font = createFont(path, size); 
  }
  //

  /**
   * Create a new Text object.
   * - path: texture path.
   * - x: horizontal coordinate.
   * - y: vertical coordinate.
   * - text: text passed as StringBuilder, so it acts like if the text was passed for reference.
   * - font_color: color of the text.
   * - size: text size.
   * - alignment: text alignment.
   */
  Text(String path, float x, float y, StringBuilder text, color font_color, int size, int alignment) {
    this(path, x, y, text, font_color, size);
    this.textAlignment = alignment;
  }
  //
  
  /**
   * Draw the Text.
   */
  void draw() {
    textAlign(textAlignment);
    textFont(font);
    fill(font_color);
    textSize(size);
    text(text.toString(), position.x, position.y);
  }
  //

}
//