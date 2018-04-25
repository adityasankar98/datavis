Fish nemo;

void setup(){
  size(1000, 800);
  int type = int(random(0,7));
  nemo = new Fish("fish_", type);
}

void draw(){
  background(255);
  nemo.display();
  
}