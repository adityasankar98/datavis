float xBubble = 0;
float yBubble = 0;

class bubble {
  PShape bubble;
  float x, y, r, p;
  
  bubble(float x, float y, float r, float p) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.p = p;
    bubble = createShape(ELLIPSE, x, y, r, p);
    bubble.setStroke(1);
    bubble.setFill(color(10, 219, 245));
  }
  
  void animate() {
    pushMatrix();
   
    translate(xBubble, yBubble);
    
    shape(bubble);
    
    popMatrix();
    
    if (yBubble < 400 && yBubble > -800){
      yBubble -= .5;
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