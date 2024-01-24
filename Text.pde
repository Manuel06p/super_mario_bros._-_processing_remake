class Text {
  PVector position;
  color font_color;
  int size;
  PFont font;
  StringBuilder text;
  
  Text(String path, float x, float y, StringBuilder text, color font_color) {
    position = new PVector(x, y);
    this.font_color = font_color;
    size = 20;
    this.text = text;
    font = createFont(path, size); 
  }
  
  void draw() {
    textFont(font);
    fill(font_color);
    textSize(size);
    text(text.toString(), position.x, position.y);    
  }
}
