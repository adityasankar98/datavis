class Fish {
  PImage img;
  int type;
  float x, y;
  
  //Credit to Freepik at flaticon.com for images
  
  Fish(String folder, int type) {
    String file = folder + "0" + type +".png";
    img = loadImage(file);
    y = random(0,800);
  }

  void display() {
    img.resize(50,50);
    
    //if {x> 
    
    image(img,x,y);
  }
}