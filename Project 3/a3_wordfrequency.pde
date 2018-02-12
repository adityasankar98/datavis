String text;
String [] words;

void setup() {
  size(700, 600);
  background(255); 
  words = loadStrings("mytext.txt");
}

void draw() {
  strokeWeight(1);
  for (int i=0; i < words.length - 1; i++) {
    for
    int j = parseInt(words[i]);
    //int x = parseInt(words[1]); 
    //for (int j=0; j < words.length - 1; j++);
      //println(words[j]);
    //int j = parseInt(words[i]); 
    //float k = j / 35;
    //ellipse(350, 300, k, k);
    println(words[j]);
  }
  noLoop();
}