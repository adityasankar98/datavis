Fish nemo;
ArrayList<Fish> fishes;
int numEnemies, dir;

void setup(){
  size(1000, 800);
  fishes = new ArrayList<Fish>();
  numEnemies = 2;
  enemyArray();
}

void draw(){
    background(255);
    enemyDisplay();
  
}

void enemyArray(){
  for (int i=0; i <numEnemies; i++) {
    int type = int(random(1,18));
    fishes.add(new Fish("fish_", type));
  }
}

void enemyDisplay(){
  for (int i=0; i < numEnemies; i++) {
    Fish enemy = fishes.get(i);
    enemy.display();
  }
  
  if (random(300) < 1){
    int type = int(random(1,7));
    fishes.add(new Fish("fish_", type));
    numEnemies += 1;
  }
}