import processing.sound.*;

SoundFile file;

String audioName = "Beatles.mp3";
String path;
boolean musicPlaying = true;

//Fish code
Player nemo;
shark opp;
ArrayList<Fish> fishes;
ArrayList<shark> sharks;
int numEnemies, score, count, play, finalScore, numSharks;
float stringX;
//Background code
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
shark Shark;
int screen = 0;

PFont courier;

void setup(){
  
  path = sketchPath(audioName);
  file = new SoundFile(this, path);
  file.play();
  
  size(1000, 800);
  
  //Fish code
  fishes = new ArrayList<Fish>();
  sharks = new ArrayList<shark>();
  nemo = new Player();
  numEnemies = 3;
  numSharks = 1;
  sharkArray();
  enemyArray();
  
  //Background code
  Fishing_Line = new fishing_line(width/2 - 400, height/2 - 415);
  Seaweed = new seaweed(-5, width);
  Hook = new hook(width/2 - 407, height/2 - 217);
  Submarine = new submarine(width/2 - 450, height/2 - 375); 
  Shark = new shark(width/2, height/2);
  
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
  
  courier = createFont("courier",24);
  textFont(courier);
}

void draw(){
  if(keyPressed){
    if(key == 'a' && musicPlaying){
        file.amp(0); 
        musicPlaying = false;
    }
    if(key == 'b' && !musicPlaying){
      //path = sketchPath(audioName);
      //file = new SoundFile(this, path);   
      file.amp(0.7);
      musicPlaying = true;
    }
  } 
  if (screen == 0){
    firstScreen();
  }
  else if (screen == 1){
    screen();
  } 
  else if (screen == 2){
    instructionScreen();
  }
  else if (screen == 3){
    stopScreen();
  }
  else if (screen == 4){
    gameOverScreen();
  }
  else if (screen == 5){
    gameVictoryScreen();
  }
}

void sharkArray(){
  for (int i = 0; i < numSharks; i++){
    sharks.add(new shark(0, int(random(200,600))));
  }
}

void sharkDisplay(){
  for (int i =0; i<numSharks; i++){
    shark opp = sharks.get(i);
    opp.animate();
    if (opp.collision()){
      if ((nemo.s == opp.s) || (nemo.s > opp.s)){
        screen = 5;
      } else {
        screen = 4;
        finalScore = score;
      }
    }
  }
}

void enemyArray(){
  for (int i=0; i <numEnemies; i++) {
    int type = int(random(1,10));
    int lr = int(random(1,10));
    fishes.add(new Fish("fish_", type, lr));
  }
}

void enemyDisplay(){
  for (int i=0; i < numEnemies; i++) {
    Fish enemy = fishes.get(i);
    enemy.display();
    if (enemy.collision()) {
      if ((nemo.s == enemy.s) || (nemo.s > enemy.s)){
        fishes.remove(i);
        score ++;
        nemo.resize();
        numEnemies -= 1;
      } else {
        screen = 4;
        finalScore = score;
      }
    }
  }
  
  if (random(200) < 1){
    int type = int(random(1,10));
    int lr = int(random(1,10));
    fishes.add(new Fish("fish_", type, lr));
    numEnemies += 1;
  }
}

void firstScreen() {
  background(124, 181, 255);
  textAlign(CENTER);
  textSize(70);
  fill(0);
  Shark.animate();
  text("Welcome to", width/2, height/2 - 200);
  text("SHARK SHARK", width/2, height/2 - 100);
  textSize(40);
  text("Press I for instructions", width/2, height/2 + 100);
  text("Click to start the game", width/2, height/2 + 200);
  
  if (keyPressed) {
    if (key == 'i' | key == 'I'){
      screen = 2;
    }
  }
}

void instructionScreen() {
  background(124, 181, 255);
  textAlign(CENTER);
  textSize(59);
  fill(0);
  text("Instructions for SHARK SHARK", width/2, height/2 - 300);
  Shark.animate();
  textSize(20);
  fill(255);
  text("You are a small fish trying to become bigger!", width/2, height/2 - 200);
  text("Eat fish that are smaller than you so that you can become bigger", width/2, height/2 - 150);
  text("Avoid fish that are bigger than you otherwise it's game over :-(", width/2, height/2 - 100);
  text("Beat the SHARK and you WIN!", width/2, height/2 - 50);
  text("Use your mouse to control your character", width/2, height/2);
  text("Press P to pause the game at any point in time", width/2, height/2 + 50);
  text("Press A to mute the sound", width/2, height/2 + 100);
  text("Press B to unmute the sound", width/2, height/2 + 150);
  text("GOOD LUCK", width/2, height/2 + 200);
  text("Click to start the game", width/2, height/2 + 250);
  
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
  
  enemyDisplay();
  nemo.display();
  sharkDisplay();
  
  
  stringX = lerp(stringX,200,.1);
  textSize(20);
  fill(255);
  text("YOUR SCORE: "+score, width-stringX, height/10);
   
  if ((key == 'p' | key == 'P') && keyPressed) {
    screen = 3;
    play = 0;
  }
  
}

void stopScreen() {
  background(124, 181, 255);
  textAlign(CENTER);
  fill(255);
  textSize(70);
  Shark.animate();
  fill(0);
  text("Game Stopped", width/2, height/2 - 100);
  textSize(40);
  text("Click to Resume", width/2, height/2);  
  textSize(20);
  text("CURRENT SCORE: "+score, width-stringX, height/10);
}

void gameOverScreen() {
  background(124, 181, 255);
  textAlign(CENTER);
  fill(0);
  textSize(60);
  text("Game Over", width/2, height/2);
  textSize(35);
  text("High Score: "+highScore(finalScore)+" | Your Score: "+finalScore,width/2,height/2+75);
  textSize(30);
  text("Click to restart", width/2, height/2 + 150);
}

void gameVictoryScreen(){
  background(124, 181, 255);
  textAlign(CENTER);
  fill(0);
  textSize(40);
  text("YOU BEAT THE SHARK AND WON!", width/2, height/2);
  text("Click to play again!", width/2, height/2 + 100);
}

void mousePressed() {
  print(screen);
  
  if (screen == 0) {
    startGame();
  }
  if (screen == 3) {
    screen = 1;
  }
  if (screen == 2) {
    startGame();
  }
  if (screen == 4){
    restart();
  }
  if (screen == 5){
    restart();
  }
}
 
void startGame() {
  score = 0;
  screen = 1;
}

void gameOver(){
  score = 0;
  screen = 4;
}

void restart(){
  score = 0;
  screen = 0;
}

int highScore(int score)
{
  Table highScores = loadTable("highScores.csv","header");
  int numScores = highScores.getRowCount();
  int[] scores = new int[numScores];
  for (int i = 1; i < numScores; i++)
  {
    scores[i-1] = highScores.getInt(i,1);
  }
  int highestScore = min(scores);
  if (highestScore == 0)
  {
    highScores.getRow(0).setInt("High Scores",score);
    saveTable(highScores,"highScores.csv");
    return score;
  }
  else if (score < highestScore)
  {
    TableRow newRow = highScores.addRow();
    newRow.setInt("High Scores",score);
    saveTable(highScores,"highScores.csv");
    return score;
  }
  else
  {
    return highestScore;
  }
}