boolean movingRight;
float x;
float y;
float vy =100;
float m = 1.0;
float ry = 300;
float ks = 0.2;
float kd = 0.2;

Pogo p1;
grass Grass;

void setup(){
 size(500, 500);
 
 Grass = new grass(-5, width);
 p1 = new Pogo(50, 50, vy, true); 
 
}

void draw(){
 background(93, 156, 242);
 p1.move();
 Grass.display(); 


}

void mouseClicked(){
  p1.click();
}