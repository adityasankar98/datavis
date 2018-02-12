String text;
String [] words;

void setup() {
  size(700, 600);
  background(255); 
  words = loadStrings("wordfrequency.txt");
}

void draw() {
  strokeWeight(1);
  for (int i=0; i < words.length - 1; i++) {
    int j = parseInt(words[i]); 
    int k = j / 30;
    ellipse(350, 300, k, k);
  }
  noLoop();
}