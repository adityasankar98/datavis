Fish nemo;

void setup(){
  size(1000, 800);
  nemo = new Fish("fish_00",1);
}

void draw(){
  background(255);
  nemo.display();
  
}