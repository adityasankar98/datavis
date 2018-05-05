float xCoral = 0;
float yCoral = 0;

class coral {
  PImage img; 
  float x, y;
  
  coral(float x, float y){
    this.x = x;
    this.y = y;
    img = loadImage("coral.png");
    
    //Credit to Freepik at flaticon.com for images
  }
  
  void animate() {

    img.resize(100,100);
   
    translate(xCoral, yCoral);
    
    image(img, x, y);
  }  
}