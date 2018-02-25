String [] words;
float wordNumber;
float frequency;
float radius; 

void setup() {
  size(700, 600);
  background(255); ;
}

void draw() {
  words = loadStrings("wordfrequency.txt");
  for (int i=0; i < words.length - 1; i++){
    float frequency = Float.parseFloat(words[i].split(": ")[1]);
    //println(frequency);
    float wordNumber = Float.parseFloat(words[i].split(": ")[0]);
    //println(wordNumber);
    float radius = (frequency / wordNumber) / 7;
    println(radius);
    strokeWeight(1);
    ellipse(350, 300, radius, radius); 
  }
  noLoop();
}