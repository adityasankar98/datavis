PShape fieldGoal, leftUpright, rightUpright, horizBar, post;

PShape myFootball, ball, line1, line2, line3, line4, line5, line6;
float angle = 0;
float xpos = 0;
float ypos = 300;

PShape bevo, head, neck, body, tail;
float neckangle, neckangle2, neckangleChange, neckangleChange2, tailangle, tailangleChange;
int count, delay, delayTimer;


void setup(){
  //FOOTBALL
  myFootball = createShape(GROUP);
  
  //football
  color brown = color(#8B4513);
  ball = createShape(ARC, 60,35,70,40,0, 2*PI);
  ball.setFill(brown);
  
  //stitching
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
    
  
  //Parent shape Bevo
  bevo = createShape(GROUP);
  
  //Head subshape
  head = createShape();
  head.beginShape();
  head.fill(209,122,45);
  head.noStroke();
  head.vertex(60,50);
  head.vertex(30,42);
  head.vertex(10,28);
  head.vertex(0,15);
  head.vertex(0,18);
  head.vertex(10,33);
  head.vertex(30,50);
  head.vertex(60,58);
  //bottom of left horn end
  head.vertex(57,68);
  head.vertex(58,75);
  head.vertex(60,80);
  //bottom of left upper head
  head.vertex(62,90);
  head.vertex(64,100);
  head.vertex(65,110);
  //bottom of left snout
  head.vertex(63,115);
  head.vertex(61,120);
  head.vertex(60,122);
  head.vertex(61,124);
  head.vertex(63,130);
  head.vertex(65,132);
  head.vertex(70,134);
  head.vertex(74,135);
  head.vertex(80,136);
  //bottom of nose
  head.vertex(86,135);
  head.vertex(90,134);
  head.vertex(95,132);
  head.vertex(97,130);
  head.vertex(99,124);
  head.vertex(100,122);
  head.vertex(99,120);
  head.vertex(97,115);
  //beginning right snout
  head.vertex(95,110);
  head.vertex(96,100);
  head.vertex(98,90);
  //beginning of right upper head
  head.vertex(100,80);
  head.vertex(102,75);
  head.vertex(103,68);
  //beginning right horn
  head.vertex(100,58);
  head.vertex(130,50);
  head.vertex(150,33);
  head.vertex(160,18);
  head.vertex(160,15);
  head.vertex(150,28);
  head.vertex(130,42);
  head.vertex(100,50);
  head.endShape(CLOSE);

  //Neck subshape
  neck = createShape();
  neck.beginShape();
  neck.fill(191,87,0);
  neck.noStroke();
  neck.vertex(0,0); //focal point for rotation
  neck.vertex(-10,-30);
  neck.vertex(-20,-40);
  neck.vertex(-40,-50);
  neck.vertex(-75,-45);
  neck.vertex(-155,-15);
  //end of top right corner of neck
  neck.vertex(-155,15);
  //cut-off or drop at head junction
  neck.vertex(-75,45);
  neck.vertex(-40,50);
  neck.vertex(-20,40);
  neck.vertex(-10,30);
  neck.endShape(CLOSE);
  
  //Body
  body = createShape();
  body.beginShape();
  body.fill(191,87,0);
  body.noStroke();
  body.vertex(60,54);
  body.vertex(70,40);
  body.vertex(75,38);
  body.vertex(77,37);
  body.vertex(79,37);
  body.vertex(83,38);
  body.vertex(90,40);
  body.vertex(110,48);
  body.vertex(130,50);
  body.vertex(150,48);
  body.vertex(160,50);
  body.vertex(165,55);
  body.vertex(167,60);
  body.vertex(170,90);
  body.vertex(173,93);
  body.vertex(177,96);
  body.vertex(178,110);
  body.vertex(177,120);
  body.vertex(172,125);
  body.vertex(166,125);
  body.vertex(168,120);
  body.vertex(167,110);
  body.vertex(155,100);
  body.vertex(145,95);
  body.vertex(105,97);
  body.vertex(95,95);
  body.vertex(98,110);
  body.vertex(95,125);
  body.vertex(89,125);
  body.vertex(88,110);
  body.vertex(78,95);
  body.vertex(79,110);
  body.vertex(75,125);
  body.vertex(69,125);
  body.vertex(68,110);
  body.vertex(62,95);
  body.vertex(60,85);
  body.endShape(CLOSE);
  
  //Tail
  tail = createShape();
  tail.beginShape();
  tail.fill(209,122,45);
  tail.noStroke();
  tail.vertex(8,5);
  tail.vertex(13,15);
  tail.vertex(13,25);
  tail.vertex(10,35);
  tail.vertex(12,45);
  tail.vertex(16,46);
  tail.vertex(19,50);
  tail.vertex(20,55);
  tail.vertex(19,65);
  tail.vertex(21,72);
  tail.vertex(14,65);
  tail.vertex(8,55);
  tail.vertex(8,44);
  tail.vertex(6,35);
  tail.vertex(8,15);
  tail.vertex(0,0);
  tail.endShape(CLOSE);

  //Canvas
  //size(500,500);
  bevo.addChild(head);
  bevo.addChild(neck);
  bevo.addChild(body);
  bevo.addChild(tail);

  neckangle = 0;
  neckangle2 = 0;
  tailangle = 0;
  neckangleChange = 0.065;
  neckangleChange2 = 1;
  tailangleChange = 0.5;
  count = 0;
  delay = 0;
  delayTimer = 0;  
  
  
  
  
  
  //FIELD & FIELD GOAL
  size(500, 500);
  fieldGoal = createShape(GROUP);
  
  strokeWeight(5);
  color yellow = color(#BACB37);
  stroke(yellow);
  leftUpright = createShape(LINE, 300, 150, 300, 350);
  rightUpright = createShape(LINE, 400, 150, 400, 350);
  horizBar = createShape(LINE,300,350,400,350);
  post = createShape(LINE, 350, 350, 350, 420);
  
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
  
  count += 1;
  delay += delayTimer;
  neckangle -= neckangleChange;
  neckangle2 -= neckangleChange2;
  if (neckangle < -25 || neckangle > 0)
  {
    neckangleChange = -neckangleChange;
  }
  if (neckangle2 < -25 || neckangle2 > 0)
  {
    neckangleChange2 = -neckangleChange2;
  }
  tailangle -= tailangleChange;
  if (tailangle < -10 || tailangle > 0)
  {
    tailangleChange = -tailangleChange;
  }
  if (count % 386 < 1 && delay == 0)
  {
    neckangleChange = 0;
    delayTimer = 1;
  }
  if (delay == 150)
  {
    neckangleChange = 0.065;
    delay = 0;
    delayTimer = 0;
  }
  //background(255,248,226);
  
  //Hungry Baby Bevo
  pushMatrix();
  scale(.4,.4);
  translate(300,750);
  pushMatrix();
  translate(145,250);
  scale(2,2);
  shape(bevo.getChild(2)); //body
  popMatrix();
  
  pushMatrix();
  translate(350,370);
  rotate(radians(neckangle2));
  shape(bevo.getChild(1)); //neck
  pushMatrix();
  translate(-240,-80);
  shape(bevo.getChild(0)); //head
  popMatrix();
  popMatrix();
  
  pushMatrix();
  translate(465,350);
  rotate(radians(-10));
  rotate(radians(tailangle));
  shape(bevo.getChild(3)); //tail
  popMatrix();
  popMatrix();
  
  //Bevo Front
  pushMatrix();
  scale(.6,.6);
  translate(300,335);
  pushMatrix();
  translate(145,250);
  scale(2,2);
  shape(bevo.getChild(2)); //body
  popMatrix();
  
  pushMatrix();
  translate(350,370);
  rotate(radians(neckangle));
  shape(bevo.getChild(1)); //neck
  pushMatrix();
  translate(-240,-80);
  shape(bevo.getChild(0)); //head
  popMatrix();
  popMatrix();
  
  pushMatrix();
  translate(465,350);
  rotate(radians(-10));
  rotate(radians(tailangle));
  shape(bevo.getChild(3)); //tail
  popMatrix();
  popMatrix();
  
  
  pushMatrix();
  translate(xpos, ypos);
  rotate(radians(angle));  
  //scale(2);
  //translate(100,100);
  translate(-60,-35);
  shape(myFootball);
  //myFootball.translate(20,-10);
  popMatrix();
  angle += 15;
  xpos += 1;

  if(xpos>=width/2){
    ypos += 1;
  }
  else{
    ypos = ypos -1;  
  }  
  

}