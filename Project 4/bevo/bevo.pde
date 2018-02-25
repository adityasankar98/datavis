PShape bevo;
PShape head;
PShape neck;
//neck;
float ypos, rate, angle, angleChange;

void setup()
{
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

  //Canvas
  size(500,500);
  bevo.addChild(head);
  bevo.addChild(neck);
  rate = 0.2;
  angle = 0;
  angleChange = 0.065;
}

void draw()
{
  ypos += rate;
  if ((ypos+177) > height || ypos < 270)
  {
    rate = -rate;
  }
  angle -= angleChange;
  if (angle < -16.5 || angle > 0)
  {
    angleChange = -angleChange;
  }
  background(255,248,226);
  //shape(bevo);
  pushMatrix();
  //scale(.75,.75);
  translate(400,370);
  rotate(radians(angle));
  shape(bevo.getChild(1));
  pushMatrix();
  translate(-240,-80);
  shape(bevo.getChild(0));
  popMatrix();
  popMatrix();
}