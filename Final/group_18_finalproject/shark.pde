import processing.sound.*;



//String soundbite = "splash.mp3";
//String pathfile;
//SoundFile sharkbite;
//boolean musicPlaying = true;
//pathfile 
//sharkbite 

float xShark = 0;
//float yShark = 0;
boolean toggle = true;
int sharkMovement = 0;
class shark {
  PImage img; 
  float x, y, s;
  
  shark(float x, float y) {
    this.x = x;
    this.y = y;
    s = 0.21875;
    img = loadImage("shark.png");
    
    //Credit to Freepik at flaticon.com for images
  }
  
  void animate() {
    sharkMovement += 1;
    img.resize(150,150);
    
    pushMatrix();
  
    //translate(xShark, yShark);
    translate(xShark,0);
    
    image(img, x, y);
    
    popMatrix();
    
    if (xShark < 1000 && xShark > -3000){
      xShark += 4;
      //yShark -= 2;
    }
    else{
      y = random(0,800);
      xShark = -600;
    }
    /*if(toggle){
      y+=5;
      //toggle = false;
    }else{
      y-=5;
      //toggle =true;
    }
    if(sharkMovement%15 ==0){
      toggle = !(toggle);
      //sharkbite.play();
    }*/
  }
  
  boolean collision(){
    
    //pushMatrix();
    
    /*if (swimRight){
      translate(x,y);
      scale(s);
    } else {
      translate(x,y);
      scale(-s,s);
    }*/
    pushMatrix();
  
    //translate(xShark, yShark);
    translate(xShark,y);
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