String id;
String cardColor;

Card c1;

void setup(){
  color green = color(#228B22);  
  background(green);
  size(500,500);
  
  c1 = new Card("A1", "0000FF");
}

void draw(){
  c1.display();

}