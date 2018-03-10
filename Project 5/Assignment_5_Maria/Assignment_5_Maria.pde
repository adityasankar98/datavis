bubble Bubble;
submarine Submarine;
fishing_line Fishing_Line;
hook Hook;

void setup() {
  size(500, 500, P3D);
  
  Fishing_Line = new fishing_line(width/2 - 200, height/2 - 300); 
  
  Submarine = new submarine(width/2 - 150, height/2 - 150);  
  
  Hook = new hook(width/2 - 200, height/2 - 100); 
}

void draw() {
  background(10, 101, 245);
  lights();
  translate(0, 0);
  
  Bubble = new bubble(width/2, height/2, 7);
  Bubble.animate();
  
  Bubble = new bubble(width/2 + 100, height/2 + 100, 7);
  Bubble.animate();

  Bubble = new bubble(width/2 + 150, height/2 - 100, 7);
  Bubble.animate();
  
  Bubble = new bubble(width/2 + 100, height/2 - 150, 7);
  Bubble.animate();
  
  Fishing_Line.animate(); 
  Hook.animate(); 
  Submarine.animate(); 
}