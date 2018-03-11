float angle = 0;
float xpos = 650, ypos = 0, yHop = 1;
int count = 0;
PImage texture, spongeFace, spongeRoad;
PShape sponge, face, road;
cylinder armL, armR, legL, legR;
Patrick p1;

void setup()
{
  size(500, 300, P3D);
  p1 = new Patrick(100, height - 200, 60);
  texture = loadImage("spongeSkin.jpg");
  spongeRoad = loadImage("spongeRoad.jpg");
  armL = new cylinder(radians(-44));
  armR = new cylinder(radians(44));
  legL = new cylinder(radians(44));
  legR = new cylinder(radians(-44));
  sponge = createShape(BOX, 30,80,80);
  sponge.setTexture(texture);
  road = createShape(BOX, 3000,20,900);
  road.setTexture(spongeRoad);
  
   spongeFace = loadImage("spongeFace.png");
   face = createShape(RECT, 0,0,80,80);
   face.setTexture(spongeFace);
}
void draw()
{
  count += 1;
  camera(width/2,25,400,250,150,0,0,1,0);
  xpos -= 2;
  background(50);
  pushMatrix();
  translate(300,230,-200);
  rotateY(PI);
  shape(road);
  popMatrix();
  //directionalLight(255,255,255,1,1,0);
  pushMatrix();
  translate(xpos, 150, 0); 
  if (xpos < width/2)
  {
     angle += 2*PI/120;
     rotateY(angle);
     if (angle >= 1.5)
     {
       angle = 1.5;
       xpos = 192;
       armL.ang2 = 0;
       armR.ang2 = 0;
       legL.ang2 = 0;
       legR.ang2 = 0;
       
       //println(count);
     }
  }
  pushMatrix();
  if (count >= 300)
  {
    ypos += yHop;
    translate(0,ypos,0);
    if (ypos >= 10)
    {
      yHop = -5;
    }
    if (ypos < -40)
    {
      yHop = 4;
    }
  }
  noStroke();
  texture(texture);
  pushMatrix();
  translate(0,-30,0);
  stroke(179,185,22);
  shape(sponge);
  translate(-20,0,0);
  pushMatrix();
  rotateY(PI/2);
  translate(-40,-40,4);
  shape(face);
  popMatrix();
  popMatrix();
  pushMatrix();
  translate(0,25,0);
  stroke(121,77,0);
  fill(138,97,15);
  box(30,30,80);
  popMatrix();
  //
  pushMatrix();
  pushMatrix();
  translate(0,0,45);
  scale(.1,.1,.1);
  armL.display();
  popMatrix();
  popMatrix();
  pushMatrix();
  translate(0,0,-45);
  scale(.1,.1,.1);
  armR.display();
  popMatrix();
  //
  pushMatrix();
  translate(0,35,-35);
  scale(.1,.1,.1);
  legR.display();
  popMatrix();
  pushMatrix();
  translate(0,35,35);
  scale(.1,.1,.1);
  legL.display();
  popMatrix();
  popMatrix();
  popMatrix();
  
  p1.move();
}