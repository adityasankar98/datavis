float rotation = 0;
boolean rotateRight = true;
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
    //rotateY(rotation);
    if(rotation>=PI/2){
      //rotation =- rotation;
      rotateRight = false;
      println("reset rotation");
    }
    if(rotation<=-PI/2){
      rotateRight = true;
      println("reset rotation");
    }
    if(rotateRight){
      rotation+=PI/32;
      println("rotateRight");
      /*
      if(rotation>= PI/2||rotation<=-PI/2){
        rotation-=PI/6;
        rotateRight = false;
      }
      */
      rotateY(rotation);
    }
    else{
      rotation-=PI/32;
      println("rotateLeft");
      /*
      if(rotation>= 3*PI/2||rotation<=PI/2){
        rotation+=PI/6;
        rotateRight = true;
      }
      */
      rotateY(rotation);
    }
    /*
    if(rotation>= 3*PI/2||rotation<=PI/2){
      rotation+=PI/6;
    }
    else{
      rotation-=PI/6;
    }
    */
    //rotation += PI/2;
    //rotation = -rotation;
    scale(25);
    shape(Patrick, 0, 0, Patrick.width, Patrick.height);
    popMatrix();
    if (xPatrick<(width/2 + 60)){
      xPatrick += 1;
      //yPatrick += 15;
      //yPatrick = -yPatrick;
    }
  }
}