float xHook = 0;
float yHook = 0;
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
   
    translate(xHook, yHook);
    translate(0, yFish);
    
    image(img, x, y);
    
    popMatrix();
    
    if (millis()/1000 % 2 == 0){
      yFish +=.5;
    }
    else {
      yFish -=.5;
    }
  }  
}