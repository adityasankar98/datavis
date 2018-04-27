class Fish {
  int speed, type, ySwim, fishVert;
  PImage img;
  float x, y, yp;
  boolean swimUp, swimRight = true;
  String file;
  
  //Credit to Freepik at flaticon.com for images
  
  Fish(String folder, int type) {
    this.type = type;
    if (type > 8){
      swimRight = false;
    }
    if(type < 10){
      file = folder + "0" + type +".png";
    }
    else{
      file = folder + type + ".png";
    }
    img = loadImage(file);
    speed = int(random(1,7));
    ySwim = 0;
    swimUp = random(1) > 0.5;
    if (type == 18)
    {
      y = mouseY;
      fishVert = 15;
    }
    else
    {
      y = random(0,800);
      fishVert = int(random(5,25));
    }
  }

  void display() {
    if (type == 18)
    {
      img.resize(75,40);
      if(swimUp){
        yp+=1;
        y = (mouseY-(img.height/2)) + yp;
        ySwim++;
        if(ySwim > fishVert){
          ySwim = 0;
          swimUp = false;
        }
      }
      else{
        yp-=1;
        y = (mouseY-(img.height/2)) + yp;
        ySwim--;
        if(ySwim < -fishVert){
          ySwim = 0;
          swimUp = true;
        }
      }
      x = mouseX-(img.width/2);
    }
    else
    {
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
      if(swimRight){
        if (x>1000) {
          y = random(0,800);
          x = 0;
        } else {
          x += speed;
        }
      }
      else{
        if (x < 0){
          y = random(0,800);
          x = 1000;
        } else {
          x -= speed;
        }
        
      }
    }
    
    image(img,x,y);
  }
  
  boolean collision(){
    
    if((nemo.x+nemo.img.width/2)+nemo.img.width > x &&
       (nemo.x+nemo.img.width/2) < x + img.width &&
       (nemo.y+nemo.img.height/2)+nemo.img.height > y &&
       (nemo.y+nemo.img.height/2) < y + img.height){
         return true;
       }
     
     return false;
  }
  
}