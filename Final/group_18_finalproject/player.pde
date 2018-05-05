class Player {
  PShape img;
  String file;
  float x, y, s;
  int fishEaten;
  
  //Credit to Freepik at flaticon.com for images
  
  Player() {
    file = "fish_00.svg";
    img = loadShape(file);
    s=0.0625;
  }
  
  void display() {
    pushMatrix();
    translate(mouseX,mouseY);
    scale(s);
    x = mouseX-img.width/2;
    y = mouseY-img.height/2;
    shape(img,-img.width/2,-img.height/2);
    popMatrix();
  }
  
  void resize() {
    if (score % 5 == 0){
      s = s * 1.5;
    }
  }
}