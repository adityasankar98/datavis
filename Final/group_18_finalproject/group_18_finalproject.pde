Fish fish1, fish2, fish3;

void setup(){
  size(1000, 800);
  int type1 = int(random(0,7));
  int type2 = int(random(0,17));
  int type3 = int(random(0,17));
  fish1 = new Fish("fish_", type1);
  fish2 = new Fish("fish_", type2);
  fish3 = new Fish("fish_", type3);
}

void draw(){
  background(255);
  fish1.display(); 
  fish2.display();
  fish3.display();
  
}