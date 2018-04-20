String filename = "litters.csv";
String[] dataIn;
int[] litterSize = new int[20];
float[] bodyWeight = new float[20];
float[] brainWeight = new float[20];
Table table;
PShape figure;
int y =20;
int x =0;

void setup(){
  background(250);
  size(550, 500);

  dataIn = loadStrings(filename);
  for(int i = 1; i < dataIn.length; i++){
    String[] currentRow = split(dataIn[i], ",");
    litterSize[i-1] = int(currentRow[1]);
    bodyWeight[i-1] = float(currentRow[2]);
    brainWeight[i-1] = float(currentRow[3]);
  }
  
  line(35, 50, 30, 475);
  line(30, 475, 525, 475);
  fill(250, 5, 111);
  textSize(15);
  text("Litter Number", 200, 490);
  textSize(15);
  rotate(PI/2);
  text("Brain Weight/Body Weight/Litter Size", 150, -15);
  
  pushMatrix();
  for(int i = 0; i < 19; i++){
    fill(5, 43, 250);
    rect(x+250, -y-50, litterSize[i]+50, 10);
    
    fill(37, 131, 7);
    rect(x+350, -y-50, bodyWeight[i]+50, 10);
    
    fill(255, 3, 19);
    rect(x+450, -y-50, brainWeight[i]*5, 10);
    
    y+= 24;
  }
  popMatrix();
}

void draw(){
  strokeWeight(1);
  rotate(PI/2);
  if (mousePressed == true) {
    textSize(10);
    fill(5, 43, 250);
    text("Litter Size", 235, -520);
    fill(37, 131, 7);
    text("Body Weight", 325, -520);
    fill(255, 3, 19);
    text("Brain Weight", 415, -520);
  }
 
  else {
    textSize(10);
    fill(255);
    text("Litter Size", 235, -520);
    fill(255);
    text("Body Weight", 325, -520);
    fill(255);
    text("Brain Weight", 415, -520);
  }
}