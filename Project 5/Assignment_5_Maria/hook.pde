float yHook = 0; 
float angleHook = 0;

class hook {
  PShape hook;
  float x, y;
  
  hook(float x, float y) {
    this.x = x;
    this.y = y;

    hook = loadShape("fish_hook.obj");
    hook.scale(.2, .2, .2);
    hook.setFill(color(160, 159, 155));
  }
  
  void animate() {
    
    pushMatrix();
    
    translate(x, y, 0);
    
    translate(0, yHook, 0);
    
    rotateZ(PI);
    rotate(radians(angleHook));
    
    shape(hook);
    popMatrix();
    
    if (millis()/1000 % 2 == 0){
      yHook +=.5;
    }
    else {
      yHook -=.5;
    }
    
    if (millis()/1000 % 2 == 0){
      angleHook +=.75;
    }
    else {
      angleHook -=.75;
    }
  
  }
}