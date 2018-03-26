boolean movingRight;
float xPogo;
float yPogo;
float vyPogo =100;
float mPogo = 1.0;
float ryPogo = 300;
float ksPogo = 0.2;
float kdPogo = 0.2;
float y;
float vy;
float m = 1.0;
float ry = 300;
float ks = 0.1;
float kd = 0.2;
float yoyoAngle, yoyoAngleChange, handAngle, handAngleChange, stringStart, stringChange;
int counter;

yoyo yoyo1;
hand hand1;
Pogo p1;
grass Grass;

void setup(){
 size(500, 500);
 yoyo1 = new yoyo();
 hand1 = new hand();
 yoyoAngle = 0;
 handAngle = 0;
 stringStart = 30;
 yoyoAngleChange = 15;
 handAngleChange = .5;
 stringChange = 1; 
 Grass = new grass(-5, width);
 p1 = new Pogo(50, 50, vyPogo, true); 
 
}

void draw(){
  background(93, 156, 242);
  counter += 1;
  if (counter > 20 && yoyoAngleChange > 0)
  {
    yoyoAngleChange -= .5;
    handAngleChange = 0;
    //println(handAngle);
    stringChange = 0;
    //println(stringStart);
  }
  
  float f = -((ks * (y - ry)) + kd*vy);
  float a = f/m;
  vy = vy + a;
  y += vy;
  yoyoAngle -= yoyoAngleChange;
  handAngle -= handAngleChange;
  stringStart += stringChange;
  
  if (counter > 200 && yoyoAngleChange > -5)
  {
    ks = 0;
    kd = 0;
    vy = -5;
    yoyoAngleChange -= .4;
    handAngleChange = -.25;
    stringChange = -.5;
  }
  if (y < 100)
  {
    counter = 0;
    ks = 0.1;
    kd = 0.2;
    vy += a;
    yoyoAngleChange = 15;
    handAngleChange = .5;
    stringChange = 1;
  }
  
  stroke(0);
  strokeWeight(2);
  line(280,stringStart,280,y);
  pushMatrix();
  translate(250,y);
  rotate(radians(yoyoAngle));
  yoyo1.display();
  popMatrix();
  
  pushMatrix();
  translate(200,10);
  translate(400,0);
  rotate(radians(handAngle));
  translate(-400,0);
  hand1.display();
  popMatrix(); 
  p1.move();
  Grass.display(); 

}

void mouseClicked(){
  p1.click();
}