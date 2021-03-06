/*bubble Bubble;
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
int screen = 0;

void setup() {
  size(1000, 800);
  
  Fishing_Line = new fishing_line(width/2 - 400, height/2 - 415);
  Seaweed = new seaweed(-5, width);
  Hook = new hook(width/2 - 407, height/2 - 217);
  Submarine = new submarine(width/2 - 450, height/2 - 375); 
  
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
  if (screen == 0){
    initScreen();
  }
  else if (screen == 1){
    screen();
  } 
  else if (screen == 2){
    instructionScreen();
  }
  else if (screen == 3){
    pauseScreen();
  }
  //else if (screen == 4){
  //  gameOverScreen();
  //}
}

void initScreen() {
  background(124, 181, 255);
  textAlign(CENTER);
  textSize(70);
  text("Welcome to", width/2, height/2 - 200);
  text("SHARK SHARK", width/2, height/2 - 100);
  textSize(40);
  text("Press I for instructions", width/2, height/2 + 100);
  text("Click to start the game", width/2, height/2 + 200);
  //Have Shark Move Across Screen
  
  if ((key == 'i' | key == 'I') && keyPressed) {
    screen = 2;
  }
}

void instructionScreen() {
  background(124, 181, 255);
  textAlign(CENTER);
  textSize(65);
  text("Instructions for SHARK SHARK", width/2, height/2 - 300);
  textSize(20);
  text("You are a small fish trying to become bigger!", width/2, height/2 - 200);
  text("Eat fish that are smaller than you so that you can become bigger", width/2, height/2 - 150);
  text("Avoid fish that are bigger than you otherwise it's game over :-(", width/2, height/2 - 100);
  text("Use your mouse to control your character", width/2, height/2 - 50);
  text("Press P to pause the game at any point in time", width/2, height/2);
  text("Press (insert something here) to mute the sound", width/2, height/2 + 50);
  text("GOOD LUCK", width/2, height/2 + 150);
  text("Click to start the game", width/2, height/2 + 200);
  
}

void screen() {
  background(90, 165, 255);
  translate(0, 0);
  
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
  Hook.animate();
  
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
   
  Submarine.animate();
   
  if ((key == 'p' | key == 'P') && keyPressed) {
    screen = 3;
  }
}

void pauseScreen() {
  background(124, 181, 255);
  textAlign(CENTER);
  fill(255);
  textSize(70);
  text("Game Paused", width/2, height/2 - 100);
  textSize(40);
  text("Click to Resume", width/2, height/2);  
}

//void gameOverScreen() {
//
//  background(124, 181, 255);
//  textAlign(CENTER);
//  fill(255);
//  textSize(60);
//  text("Game Over", width/2, height/2);
//  textSize(30);
//  text("Click to Restart", width/2, 400);
//}

//void gameVictoryScreen(){
//  background(124, 181, 255);
//  textAlign(CENTER);
//  fill(255);
//  textSize(60);
//  text("YOU WON!", width/2, height/2);
//}

void mousePressed() {
  print(screen);
  
  if (screen == 0) {
    startGame();
  }
  if (screen == 4){
    print("Restart Game");
    restart();
  }
  if (screen == 3) {
    screen = 1;
  }
  if (screen == 2) {
    startGame();
  }
}
 
void startGame() {
  screen = 1;
}

void gameOver(){
  screen = 4;
}

void restart(){
  screen = 1;
}*/