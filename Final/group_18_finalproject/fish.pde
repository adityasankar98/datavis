class Fish {
  int speed, type, ySwim, fishVert;
  PImage img;
  float x, y;
  boolean swimUp;
  
  //Credit to Freepik at flaticon.com for images
  
  Fish(String folder, int type) {
    String file = folder + "0" + type +".png";
    img = loadImage(file);
    y = random(0,800);
    speed = int(random(1,7));
    fishVert = int(random(5,25));
    ySwim = 0;
    swimUp = random(1) > 0.5;
  }

  void display() {
    img.resize(50,50);
    if(swimUp){
      y+=1;
      ySwim++;
      if(ySwim > fishVert){
        ySwim = 0;
        swimUp = false;
      }
    }
    else{
      y-=1;
      ySwim--;
      if(ySwim < -fishVert){
        ySwim = 0;
        swimUp = true;
      }
    }
    if (x>1000) {
      x = 0;
    } else {
      x += speed;
    }
    
    image(img,x,y);
  }
}