String filename = "litters.csv";
String[] rawData;
int[] litterSize = new int[20];
float[] bodyWeight = new float[20];
float[] brainWeight = new float[20];
PShape figure;
int y =20;
int x =0;

void setup(){
  size(500,500);
  rawData = loadStrings(filename);
  //printArray(rawData);
  for(int i = 1; i < rawData.length; i++){
    String[] thisRow = split(rawData[i], ",");
    //printArray(thisRow);
    //println(int(thisRow[1])+1000);
    litterSize[i-1] = int(thisRow[1]);
    bodyWeight[i-1] = float(thisRow[2]);
    brainWeight[i-1] = float(thisRow[3]);
  }
  printArray(litterSize);
  printArray(bodyWeight);
  printArray(brainWeight);

}

void draw(){
  //pushMatrix();
  for(int i = 0; i <litterSize.length; i++){
  rect(x, y, litterSize[i], 20);
  y+= 24;
  //x+= 50;
  }
  //popMatrix();
}