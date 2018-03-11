float yFish = 0;

class fishing_line {
  PShape fishing_line;
  float x, y;
  
  fishing_line(float x, float y) {
    this.x = x;
    this.y = y;
    fishing_line = createShape(RECT, 0, 0, 1, 200);
    fishing_line.setFill(#D3D3D3);
  }
  
  void animate() {

    pushMatrix();
    translate(x, y, 0);
    
    translate(0, yFish, 0);
        
    shape(fishing_line);
    popMatrix();
    
    if (millis()/1000 % 2 == 0){
      yFish +=.5;
    }
    else {
      yFish -=.5;
    }
  }
}