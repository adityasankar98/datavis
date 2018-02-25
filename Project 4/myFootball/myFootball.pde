PShape myFootball, ball, line1, line2, line3, line4, line5, line6;

void setup(){

  
  myFootball = createShape(GROUP);
  
  ellipseMode(CORNER);
  color brown = color(#8B4513);
  //stroke(brown);  
  ball = createShape(ARC, 60,35,70,40,0, 2*PI);
  ball.setFill(brown);
  color white = color(#FFFFFF);
  stroke(white);
  line1 = createShape(LINE, 40, 35, 80, 35);
  line2 = createShape(LINE, 43, 32, 43, 38);
  line3 = createShape(LINE, 52, 32, 52, 38);
  line4 = createShape(LINE, 61, 32, 61, 38);
  line5 = createShape(LINE, 70, 32, 70, 38);
  line6 = createShape(LINE, 79, 32, 79, 38);
  
  myFootball.addChild(ball);
  myFootball.addChild(line1);
  myFootball.addChild(line2);
  myFootball.addChild(line3);
  myFootball.addChild(line4);
  myFootball.addChild(line5);
  myFootball.addChild(line6);
  
  //size(500, 500);
}

void draw(){
  size(500, 500);  
  background(204);
  translate(50, 15);
  shape(myFootball);
}