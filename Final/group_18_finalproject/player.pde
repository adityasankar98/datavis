class Player {
  PImage img;
  String file;
  float x, y;
  int size,fishEaten;
  
  //Credit to Freepik at flaticon.com for images
  
  Player() {
    file = "fish_00.png";
    img = loadImage(file);
    size = 25;
  }
  
  void display() {
    img.resize(size,size);
    x = mouseX-img.width/2;
    y = mouseY-img.height/2;
    image(img,x,y);
  }
  
  void resize() {
    if (fishEaten % 5 == 0){
      size = size * 2;
      img.resize(size,size);
    }
  }
}