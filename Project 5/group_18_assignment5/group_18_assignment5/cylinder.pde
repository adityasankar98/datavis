class cylinder 
{
  float radius = 50;
  float ang = 0, ang2;
  int pts = 120;
  float depth = 400;
  float ang2Change = PI/120;
  PShape cylinder, body, cap1, cap2;
  
  cylinder(float ang2)
  {
    this.ang2 = ang2;
  
  fill(240,245,114);
  noStroke();
  smooth();  // comment out with P3D renderer
  
  cylinder = createShape(GROUP);
  
   //body
   body = createShape();
   body.beginShape(QUAD_STRIP); 
   for (int i=0; i<=pts; i++){
     float  px = cos(radians(ang))*radius;
     float  py = sin(radians(ang))*radius;
     body.vertex(px, py, 0); 
     body.vertex(px, py, -depth); 
     ang+=360/pts;
   }
   body.endShape(); 
   
   //cap1
   cap1 = createShape();
   cap1.beginShape(POLYGON); 
   for (int i=0; i<=pts; i++){
     float  px = cos(radians(ang))*radius;
     float  py = sin(radians(ang))*radius;
     cap1.vertex(px, py, 0); 
     ang+=360/pts;
   }
   cap1.endShape(); 
   
   //cap2
   cap2 = createShape();
   cap2.beginShape(POLYGON); 
   for (int i=0; i<=pts; i++){
     float  px = cos(radians(ang))*radius;
     float  py = sin(radians(ang))*radius;
     cap2.vertex(px, py, -depth); 
     ang+=360/pts;
   }
   cap2.endShape(); 
   
   cylinder.addChild(cap1);
   cylinder.addChild(body);
   cylinder.addChild(cap2);
  }

  void display()
  {
   rotateX(PI/2);
   rotateY(ang2);
   shape(cylinder);
   //rotateX(ang2*2);
   //rotateZ(ang2);
   
   ang2+=ang2Change; //for rotation
   if (ang2 < -PI/4 || ang2 > PI/4)
    {
      ang2Change = -ang2Change;
    }
  }
}