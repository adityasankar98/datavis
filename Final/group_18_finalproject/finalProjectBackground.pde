bubble Bubble;
fishing_line Fishing_Line;
seaweed Seaweed; 
rocks Rocks;
coral Coral1; 
coral Coral2; 
coral Coral3; 
coral Coral4; 
coral Coral5; 
other_plants Other_Plants1;
other_plants Other_Plants2;
other_plants Other_Plants3;
other_plants Other_Plants4;
other_plants Other_Plants5;
hook Hook;
submarine Submarine;

//Timer code begins
String[] fontlist = PFont.list();
int time, penalty, frame, delta = 0, attempt = 0, match1Index = 0, match2Index = 0, numTries;
boolean match, gameOver = false, wiped = false;

PFont courier;
String timeDisplay = "Time Elapsed: ", scoreDisplay = "Final Score: ", boardDisplay = "";
//Timer code ends


void setup() {
  size(1000, 800);
  
  //Timer code begins
  frame++;
  if (frame == 60)
  {
    time = time + delta;
    frame = 0;
  }
  text(timeDisplay+nf(time,2),width-300,32);
  text(boardDisplay,(width/2)-125,430);
  //Timer code ends
  
  Fishing_Line = new fishing_line(width/2 - 400, height/2 - 415);
  Seaweed = new seaweed(-5, width);
  Hook = new hook(width/2 - 407, height/2 - 215);
  Submarine = new submarine(width/2 - 450, height/2 - 375); 
  
  //Timer code begins
  courier = createFont("courier",24);
  textFont(courier);
  //Timer code ends
  
  //Coral
  Coral1 = new coral(width/2, height/2 + 200);
  Coral2 = new coral(width/2 - 200, height/2 + 250);
  Coral3 = new coral(width/2 - 400, height/2 + 200);
  Coral4 = new coral(width/2 + 400, height/2 + 200);
  Coral5 = new coral(width/2 + 175, height/2 + 200);
  
  //Other Plants
  Other_Plants1 = new other_plants(width/2 - 100, height/2 + 200);
  Other_Plants2 = new other_plants(width/2 - 300, height/2 + 250);
  Other_Plants3 = new other_plants(width/2 - 430, height/2 + 225);
  Other_Plants4 = new other_plants(width/2 + 150, height/2 + 250);
  Other_Plants5 = new other_plants(width/2 + 275, height/2 + 200);

}

void draw() {
  background(90, 165, 255);
  translate(0, 0);
  
  if (time == 0 && frame < 30)
  {
    boardDisplay = "Push 'S' to begin!";
  }
  
  //Middle Bubbles
  Bubble = new bubble(width/2, height/2, 15, 15);
  Bubble.animate();
  Bubble = new bubble(width/2 + 100, height/2 + 100, 15, 15);
  Bubble.animate();
  Bubble = new bubble(width/2 + 150, height/2 - 100, 15, 15);
  Bubble.animate();
  Bubble = new bubble(width/2 + 100, height/2 - 150, 15, 15);
  Bubble.animate();  
  
  //Left Bubbles
  Bubble = new bubble(width/2 - 400, height/2 + 50, 15, 15);
  Bubble.animate();
  Bubble = new bubble(width/2 - 450, height/2 + 200, 15, 15);
  Bubble.animate();
  Bubble = new bubble(width/2 - 200, height/2 + 250, 15, 15);
  Bubble.animate();
  Bubble = new bubble(width/2 - 300, height/2 + 350, 15, 15);
  Bubble.animate(); 
  
  //Right Bubbles
  Bubble = new bubble(width/2 + 250, height/2 + 250, 15, 15);
  Bubble.animate();
  Bubble = new bubble(width/2 + 350, height/2 + 125, 15, 15);
  Bubble.animate();
  Bubble = new bubble(width/2 + 450, height/2 + 100, 15, 15);
  Bubble.animate();
  Bubble = new bubble(width/2 + 400, height/2 + 400, 15, 15);
  Bubble.animate();  
  
  Fishing_Line.animate(); 
  Seaweed.display();
  Seaweed.animate();
  
  //Middle Rocks
  Rocks = new rocks(width/2, height/2 + 280, 25, 15);
  Rocks.animate();
  Rocks = new rocks(width/2 + 100, height/2 + 300, 25, 15);
  Rocks.animate();
  Rocks = new rocks(width/2 - 75, height/2 + 300, 25, 15);
  Rocks.animate();
  Rocks = new rocks(width/2 - 200, height/2 + 275, 25, 15);
  Rocks.animate();  
  
  //Left Rocks
  Rocks = new rocks(width/2, height/2 + 280, 25, 15);
  Rocks.animate();
  Rocks = new rocks(width/2 - 300, height/2 + 300, 25, 15);
  Rocks.animate();
  Rocks = new rocks(width/2 - 375, height/2 + 300, 25, 15);
  Rocks.animate();
  Rocks = new rocks(width/2 - 425, height/2 + 310, 25, 15);
  Rocks.animate(); 
  
  //Right Rocks
  Rocks = new rocks(width/2 + 200, height/2 + 280, 25, 15);
  Rocks.animate();
  Rocks = new rocks(width/2 + 300, height/2 + 300, 25, 15);
  Rocks.animate();
  Rocks = new rocks(width/2 + 375, height/2 + 300, 25, 15);
  Rocks.animate();
  Rocks = new rocks(width/2 + 425, height/2 + 310, 25, 15);
  Rocks.animate(); 
  
  //Coral
  Coral1.animate();
  Coral2.animate();
  Coral3.animate();
  Coral4.animate();
  Coral5.animate();
  
  //Other Plants
  Other_Plants1.animate();
  Other_Plants2.animate();
  Other_Plants3.animate();
  Other_Plants4.animate();
  Other_Plants5.animate();
  
  Hook.animate(); 
  Submarine.animate();
  
}