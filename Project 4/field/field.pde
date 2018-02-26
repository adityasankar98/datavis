PShape fieldGoal, leftUpright, rightUpright, horizBar, post;

void setup(){
  
  size(500, 500);
  fieldGoal = createShape(GROUP);
  
  strokeWeight(5);
  color yellow = color(#BACB37);
  stroke(yellow);
  leftUpright = createShape(LINE, 300, 300, 300, 400);
  rightUpright = createShape(LINE, 400, 300, 400, 400);
  horizBar = createShape(LINE,300,400,400,400);
  post = createShape(LINE, 350, 400, 350, 420);
  
  fieldGoal.addChild(leftUpright);
  fieldGoal.addChild(rightUpright);
  fieldGoal.addChild(horizBar);
  fieldGoal.addChild(post);
  

}

void draw(){
  color blue = color(#ADD8E6);
  background(blue);
  
  pushMatrix();
  //translate(100,100);
  //scale(2);
  shape(fieldGoal);
  popMatrix(); 
  // football field 
  color green = color(#008000);
  stroke(green);
  fill(green);
  rect(0, 420, 500, 500);
  

}