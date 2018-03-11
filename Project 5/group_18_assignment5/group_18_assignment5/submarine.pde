float xSubmarine = 0;

class submarine {
  PShape submarine;
  float x, y;
  
  submarine(float x, float y) {
    this.x = x;
    this.y = y;
    submarine = loadShape("Deep Blue Sub.obj");
    submarine.scale(12, 12, 12);
    submarine.setFill(color(240, 203, 17));
  }
  
  void animate() {
    pushMatrix();
    
    translate(x, y, 0);
    translate(xSubmarine, 0, 0);
    
    rotateZ(PI);
    rotateY(PI);
    
    shape(submarine);
    
    popMatrix();
    
    if (xSubmarine < 500 && xSubmarine > -350){
      xSubmarine += 1;
    }
    else{
      xSubmarine = -150;
    }
  }
}