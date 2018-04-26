float xOther_Plants = 0;
float yOther_Plants = 0;

class other_plants {
  PImage img; 
  float x, y;
  
  other_plants(float x, float y){
    this.x = x;
    this.y = y;
    img = loadImage("coral1.png");
    
    //Credit to Freepik at flaticon.com for images
  }
  
  void animate() {

    img.resize(100,100);
   
    translate(xOther_Plants, yOther_Plants);
    
    image(img, x, y);
  }  
}
  
  