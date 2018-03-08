PShape bubbles, submarine, hook, fishingLine; 
PShape bubble, subCone, subTelescope, subWindow, subMotor;
float xBubble, yBubble, xSubmarine, yHook, angleHook;

void setup() {
  
  size(500, 500, P3D);
  
  submarine = loadShape("Deep Blue Sub.obj");
  submarine.scale(12, 12, 12);
  submarine.setFill(color(240, 203, 17));
  
  hook = loadShape("fish_hook.obj");
  hook.scale(.2, .2, .2);
  hook.setFill(color(160, 159, 155));
  
  fishingLine = createShape(RECT, 0, 0, 1, 200);
  fishingLine.setFill(color(0));
  
  bubbles = createShape(GROUP);
  bubble = createShape(SPHERE, 7);
  bubble.setStroke(1);
  bubble.setFill(color(10, 219, 245));
  
  bubbles.addChild(bubble);
  
  yBubble = 0;
  xBubble = 0;
  yHook = 0;
  angleHook = 0;
  xSubmarine = 0;
}

void draw(){
  lights();
  background(10, 101, 245);
  translate(0, 0);
  
  if (yBubble < 400 && yBubble > -350){
    yBubble -= .75;
  }
  else{
    yBubble = 399;
  }
  
  if (millis()/1000 % 2 == 0){
    xBubble += 2;
  }
  else {
    xBubble -=2;
  }
  
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
  
  if (xSubmarine < 500 && xSubmarine > -350){
    xSubmarine += 1;
  }
  else{
    xSubmarine = -150;
  }
  
  pushMatrix();
  translate(width/2, height/2, 0);
  translate(xBubble, yBubble, 0);
  rotateX(PI);
  shape(bubbles.getChild(0));
  popMatrix();
  
  pushMatrix();
  translate(width/2 + 100, height/2 + 100, 0);
  translate(xBubble, yBubble, 0);
  rotateX(PI);
  shape(bubbles.getChild(0));
  popMatrix();
  
  pushMatrix();
  translate(width/2 + 150, height/2 - 100, 0);
  translate(xBubble, yBubble, 0);
  rotateX(PI);
  shape(bubbles.getChild(0));
  popMatrix();
  
  pushMatrix();
  translate(width/2 + 100, height/2 - 150, 0);
  translate(xBubble, yBubble, 0);
  rotateX(PI);
  shape(bubbles.getChild(0));
  popMatrix();
  
  pushMatrix();
  translate(width/2 - 200, height/2 - 300, 0);
  translate(0, yHook, 0);
  shape(fishingLine);
  popMatrix();
  
  pushMatrix();
  translate(width/2 - 200, height/2 - 100, 0);
  translate(0, yHook, 0);
  rotateZ(PI);
  rotate(radians(angleHook));
  shape(hook);
  popMatrix();
  
  pushMatrix();
  translate(width/2 - 150, height/2 - 150, 0);
  translate(xSubmarine, 0, 0);
  rotateZ(PI);
  rotateY(PI);
  shape(submarine);
  popMatrix();  
}