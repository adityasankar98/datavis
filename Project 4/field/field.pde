
void setup(){
  size(500, 500);
  color blue = color(#add8e6);
  background(blue);
}

void draw(){
  
  strokeWeight(5);
  color yellow = color(#BACB37);
  stroke(yellow);
  line(300, 300, 300, 400);
  line(400, 300, 400, 400);
  line(300,400,400,400);
  line(350, 400, 350, 420);
  color brown = color(#8B4513);
  stroke(brown);
  fill(brown);
  arc(60,35,70,40,0, 2*PI);
  color white = color(#FFFFFF);
  stroke(white);
  line(40, 35, 80, 35);
  line(43, 32, 43, 38);
  line(52, 32, 52, 38);
  line(61, 32, 61, 38);
  line(70, 32, 70, 38);
  line(79, 32, 79, 38);
  
  // football field 
  color green = color(#008000);
  stroke(green);
  fill(green);
  rect(0, 420, 500, 500);
  

}