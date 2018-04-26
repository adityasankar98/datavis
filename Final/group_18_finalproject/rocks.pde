float xRocks = 0;
float yRocks = 0;

class rocks {
  
  PShape rocks;
  float x, y, r, p;
  
  rocks(float x, float y, float r, float p) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.p = p;
    rocks = createShape(ELLIPSE, x, y, r, p);
    rocks.setStroke(1);
    rocks.setFill(color(137, 136, 135));
  }
  
  void animate() {
    pushMatrix();
   
    translate(xRocks, yRocks);
    
    shape(rocks);
    
    popMatrix();
  } 
}