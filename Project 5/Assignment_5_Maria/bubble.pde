float xBubble = 0;
float yBubble = 0;

class bubble {
  PShape bubble;
  float x, y, r;
  
  bubble(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
    bubble = createShape(SPHERE, r);
    bubble.setStroke(1);
    bubble.setFill(color(10, 219, 245));
  }
  
  void animate() {
    pushMatrix();
    
    translate(x, y, 0);
    translate(xBubble, yBubble, 0);
    
    shape(bubble);
    rotateX(PI);
    
    popMatrix();
    
    if (yBubble < 400 && yBubble > -350){
      yBubble -= .1;
    }
    else{
      yBubble = 399;
    }
  
    if (millis()/1000 % 2 == 0){
      xBubble += .1;
    }
    else {
      xBubble -=.1;
    }
  } 
}