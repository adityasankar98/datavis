float rotation =0;
//float count =0;
class Patrick {
  float xPatrick;
  float yPatrick;
  float zPatrick;
  PShape Patrick;
  
  Patrick(float xPatrick, float yPatrick, float zPatrick){
    this.xPatrick = xPatrick;
    this.yPatrick = yPatrick;
    this.zPatrick = zPatrick;
    Patrick = loadShape("Patrick.obj");  
  }
  
  void move(){
    
    pushMatrix();
    //translate(width/2, height/2, 0);
    translate(xPatrick, yPatrick, zPatrick);
    rotateZ(PI);
    rotateY(rotation);
    rotation += 30*PI/60;
    rotation = -rotation;
    scale(20);
    shape(Patrick, 0, 0, Patrick.width, Patrick.height);
    popMatrix();
    if (xPatrick<width){
      xPatrick += 1;
      //yPatrick += 15;
      //yPatrick = -yPatrick;
    }
    else{
      xPatrick = 0;
    }
  }
}