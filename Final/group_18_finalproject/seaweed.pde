class seaweed {
  
  float xScreenWidth, xTriangleWidth;
  float vxSeaweedSpring;
  
  float xSeaweedSpring = .8; 
  float m = 1.0;
  float rxSeaweedSpring = 5;
  float ks = 0.1;
  float kd = 0.1;
  
  seaweed(float xTriangleWidth, float xScreenWidth){
    this.xTriangleWidth = xTriangleWidth;
    this.xScreenWidth = xScreenWidth;
  }
  
  void display() {
    fill(255, 198, 54);
    
    rect(0, 675, 1000, 100);
    
    fill(43, 162, 5);
    
    float f = -((ks * (xSeaweedSpring - rxSeaweedSpring)) + kd*vxSeaweedSpring);
    float a = f/m;
    vxSeaweedSpring = vxSeaweedSpring + a;
    xSeaweedSpring += vxSeaweedSpring;
    
    for (float xTriangleWidth = -5; xTriangleWidth < 200; xTriangleWidth = xTriangleWidth+10) {
      triangle(xTriangleWidth, 680, xTriangleWidth + xSeaweedSpring, 500, xTriangleWidth + 10, 680);
    }
    
    for (float xTriangleWidth = -5; xTriangleWidth < 200; xTriangleWidth = xTriangleWidth+10) {
      triangle(xTriangleWidth + 800, 680, xTriangleWidth + xSeaweedSpring + 800, 500, xTriangleWidth + 810, 680);
    }
      
  }
  
  void animate() {
    
    if (millis()/1000 % 2 == 0){
      xSeaweedSpring += .8;
    }
    else {
      xSeaweedSpring -= .8;
    }
  }
}