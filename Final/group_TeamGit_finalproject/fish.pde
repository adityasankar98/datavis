class Fish {
  int speed, type, ySwim, fishVert, dir;
  PShape img;
  float x, y, yp, s;
  boolean swimUp, swimRight = true;
  String file;
  
  //Credit to Freepik at flaticon.com for images
  
  Fish(String folder, int type, int dir) {
    this.type = type;
    if (type == 8){
        s = 0.0625;
      } else if (type == 3){
        s = 0.078125;
      } else if (type == 6){
        s = 0.09375;
      } else if (type == 1) {
        s = 0.109375;
      } else if (type == 2) {
        s = 0.109375;
      } else if (type == 4) {
        s = 0.125;
      } else if (type == 5) {
        s = 0.140625;
      } else if (type == 7) {
        s = 0.15625;
      } else if (type == 9) {
        s = 0.171875;
      } else {
        s = 0.18825;
      }

    if (dir > 5){
      swimRight = false;
    }
    if(type < 10){
      file = folder + "0" + type +".svg";
    }
    else{
      file = folder + type + ".svg";
    }
    img = loadShape(file);
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
        pushMatrix();
        if (x>1000) {
          y = random(0,800);
          x = 0;
        } else {
          x += speed;
        }
        translate(x,y);
        scale(s);
        shape(img,0,0);
        popMatrix();
      }else{
        pushMatrix();
        if (x < 0){
          y = random(0,800);
          x = 1000;
        } else {
          x -= speed;
        }
        translate(x,y);
        scale(-s, s);
        shape(img,0,0);
        popMatrix();
        
      }
    }    
  }
  
  boolean collision(){
    
    pushMatrix();
    
    if (swimRight){
      translate(x,y);
      scale(s);
    } else {
      translate(x,y);
      scale(-s,s);
    }
    float mx = screenX(img.width/2,img.height/2);
    float my = screenY(img.width/2,img.height/2);
    
    float distance = dist(mx, my, mouseX, mouseY);
    
    if (distance < 25){
      popMatrix();
      return true;
    }
    
     popMatrix();
     return false;
  }
}