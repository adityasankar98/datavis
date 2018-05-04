class Player {
  PShape img;
  String file;
  float x, y, s;
  int size,fishEaten;
  
  //Credit to Freepik at flaticon.com for images
  
  Player() {
    file = "fish_00.svg";
    img = loadShape(file);
    s=0.0625;
  }
  
  void display() {
    pushMatrix();
    x = mouseX-img.width/2;
    y = mouseY-img.height/2;
    translate(mouseX,mouseY);
    scale(s);
    
    shape(img,-img.width/2,-img.height/2);
    popMatrix();
  }
  
  void resize() {
    if (fishEaten % 5 == 0){
      s = s * 1.5;
    }
  }
}