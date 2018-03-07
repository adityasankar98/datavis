Patrick p1;

void setup() {
  size(500, 500, P3D); 
  p1 = new Patrick(100, height - 150, 100);
}
void draw() {
  background(0);
  lights();
  p1.move();

}