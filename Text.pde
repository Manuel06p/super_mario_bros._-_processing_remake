class Text {
  PVector position;
  color font_color;
  int size;
  PFont font;
  StringBuilder text;
  int textAlignment = LEFT;
  
  Text(String path, float x, float y, StringBuilder text, color font_color, int size) {
    position = new PVector(x, y);
    this.font_color = font_color;
    this.size = size;
    this.text = text;
    font = createFont(path, size); 
  }

  Text(String path, float x, float y, StringBuilder text, color font_color, int size, int alignment) {
    this(path, x, y, text, font_color, size);
    this.textAlignment = alignment;
  }
  
  void draw() {
    textAlign(textAlignment);
    textFont(font);
    fill(font_color);
    textSize(size);
    text(text.toString(), position.x, position.y);
  }
}
