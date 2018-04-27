class Player {
  PImage img;
  String file;
  float x, y;
  
  //Credit to Freepik at flaticon.com for images
  
  Player() {
    file = "fish_00.png";
    img = loadImage(file);
  }
  
  void display() {
    img.resize(50,50);
    x = mouseX-img.width/2;
    y = mouseY-img.height/2;
    image(img,x,y);
  }
  
}