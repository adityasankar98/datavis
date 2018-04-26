float xSubmarine = 0;

class submarine {
  PImage img; 
  float x, y;
  
  submarine(float x, float y) {
    this.x = x;
    this.y = y;
    img = loadImage("submarine.png");
    
    //Credit to Freepik at flaticon.com for images
  }
  
  void animate() {

    img.resize(50,50);
    
    pushMatrix();
  
    translate(xSubmarine, 0);
    
    image(img, x, y);
    
    popMatrix();
    
    if (xSubmarine < 500 && xSubmarine > -350){
      xSubmarine += 5;
    }
    else{
      xSubmarine = -150;
    }
  }
}