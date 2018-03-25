boolean movingRight;
float x;
float y;
float vy =100;
float m = 1.0;
float ry = 300;
float ks = 0.2;
float kd = 0.2;

Pogo p1;

void setup(){
  background(255);
  size(500,500);
  
  p1 = new Pogo(50, 50, vy, true);
}

void draw(){
 background(210);
 p1.move();
 
}

void mouseClicked(){
  p1.click();
}