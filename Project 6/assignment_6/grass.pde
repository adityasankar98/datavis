class grass {
  
  float xScreenWidth, xTriangleWidth;
  float vxGrassSpring;
  
  float xGrassSpring = 20; 
  float m = 1.0;
  float rxGrassSpring = 5;
  float ks = 0.1;
  float kd = 0.1;
  
  grass(float xTriangleWidth, float xScreenWidth){
    this.xTriangleWidth = xTriangleWidth;
    this.xScreenWidth = xScreenWidth;
  }
  
  void display() {
    fill(43, 162, 5);
    rect(0, 475, 500, 50);
    
    float f = -((ks * (xGrassSpring - rxGrassSpring)) + kd*vxGrassSpring);
    float a = f/m;
    vxGrassSpring = vxGrassSpring + a;
    xGrassSpring += vxGrassSpring;
    
    for (float xTriangleWidth = -5; xTriangleWidth < xScreenWidth; xTriangleWidth = xTriangleWidth+10) {
      triangle(xTriangleWidth, 475, xTriangleWidth + xGrassSpring, 455, xTriangleWidth + 10, 475);
      }
 
    if (mousePressed == true){
     xGrassSpring = 20;
    }
  }
}