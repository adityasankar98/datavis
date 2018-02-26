PShape cannon; 
PShape barrel, wheel, top, top_circle, rect_1, rect_2, axel;
float x, y, angle, change, angleChange, xChange, xPos;

void setup() {
  size(500, 500);
  smooth();
  frameRate(5);
  
  cannon = createShape(GROUP);
  barrel = createShape();
  barrel.beginShape();
  barrel.strokeWeight(2);
  barrel.fill(85, 56, 56);
  barrel.vertex(100, 415);
  barrel.vertex(100, 395);
  barrel.vertex(175, 425);
  barrel.vertex(175, 450);
  barrel.vertex(100, 415);
  barrel.endShape(CLOSE);
  
  top = createShape(ELLIPSE, 100, 405, 20, 20);
  top.setFill(color(121, 121, 121)); 
  
  top_circle = createShape(ELLIPSE, 100, 405, 12, 12);
  top_circle.setFill(color(0));
   
  wheel = createShape(ELLIPSE, 170, 440, 40, 40);
  wheel.setFill(color(203, 105, 0));  
  
  rect_1 = createShape(RECT, 165, 425, 10, 30);
  rect_1.setFill(color(85, 56, 56));
  
  rect_2 = createShape(RECT, 160, 435, 20, 10);
  rect_2.setFill(color(85, 56, 56));
  
  axel = createShape(ELLIPSE, 170, 440, 10, 10);
  axel.setFill(color(0)); 
  
  cannon.addChild(barrel);
  cannon.addChild(top);
  cannon.addChild(top_circle);
  cannon.addChild(wheel);
  cannon.addChild(rect_1);
  cannon.addChild(rect_2);
  cannon.addChild(axel);
  
  change = .3;
  angle = 2.0;
  angleChange = .8;
  x = 8;
  xChange = 5;
  xPos = 0;
}

void draw(){
  
  background(28,183,239); 
  translate(0,0);
  
  x -= xChange;
  if (x < 10 || x > 0){
    xChange = -xChange;
  }
    
  angle -= angleChange;
  if (angle < 100 || angle > 0) {
    angleChange = -angleChange;
  }
  
  if (xPos < 50 && xPos > -50){
    xPos -= 5;
  }
  else{
    xPos = 0;
  }
  
  pushMatrix();
  pushMatrix();
  translate(0, -5);
  rotate(radians(angle));
  shape(cannon.getChild(0));
  shape(cannon.getChild(1));
  translate(xPos,0);
  shape(cannon.getChild(2));
  popMatrix();
  translate(170, 445);
  rotate(radians(frameCount * 15));
  translate(-170,-440);
  shape(cannon.getChild(3));
  shape(cannon.getChild(4));
  shape(cannon.getChild(5));
  shape(cannon.getChild(6));
  popMatrix();
  
  pushMatrix();
  translate(xPos,0);
  translate(-100, 325);
  scale(.5);
  rotate(radians(-30));
  pushMatrix();
  translate(x, -5);
  shape(cannon.getChild(0));
  shape(cannon.getChild(1));
  shape(cannon.getChild(2));
  popMatrix();
  translate(x, -5);
  shape(cannon.getChild(3));
  shape(cannon.getChild(4));
  shape(cannon.getChild(5));
  shape(cannon.getChild(6));
  popMatrix();
}

  
  
  