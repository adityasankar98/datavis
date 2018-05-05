float yHook = 0;
float xHook = 0;
float angleHook = 0;

class hook {
  PImage img; 
  
  float x, y;
  
  hook(float x, float y){
    this.x = x;
    this.y = y;
    img = loadImage("hook.png");
    
    //Credit to Freepik at flaticon.com for images
  }
  
  void animate() {

    img.resize(30,30);
    
    pushMatrix();
   
    translate(x, y + yHook);
    
    rotate(radians(angleHook));
    
    image(img, 0, 0);
    
    popMatrix();
    
    if (millis()/1000 % 2 == 0){
      yHook +=.5;
    }
    else {
      yHook -=.5;
    }
    
    if (millis()/1000 % 2 == 0){
      angleHook += .4;
    }
    else {
      angleHook -= .4;
    }
  }  
}