class Pogo{
  PImage img;
  PShape person, eye1, eye2, smile;
  PShape myPogo, pogo, handlebar, spring, footpedal1, footpedal2;
  float _x, _y, _vy;
  boolean _movingRight;
  
  Pogo(float _x, float _y, float _vy, boolean _movingRight){
    x = _x;
    y = _y;
    vy = _vy;
    //img = loadImage("smiley.jpg");
    person = createShape(ELLIPSE, x+15, y-40, 50,50);
    eye1 = createShape(ELLIPSE, x+5, y -45, 10, 10);
    eye2 = createShape(ELLIPSE, x+25, y -45, 10, 10);
    smile = createShape(ARC, x+15, y-25, 20, 20, PI, 2*PI);
    //person.setTexture(img);
    myPogo = createShape(GROUP);    
    movingRight = _movingRight;
    pogo = createShape(RECT, x, y, 30, 100);
    pogo.setFill(#800080);
    handlebar = createShape(RECT, x-15,y-10, 60, 10);
    handlebar.setFill(#C0C0C0);
    spring = createShape(RECT, x+10, y+100, 10, height-100);
    footpedal1 = createShape(RECT, x-10, y+70, 10, 5);
    footpedal1.setFill(#000000);
    footpedal2 = createShape(RECT,x+30, y+70, 10, 5);
    footpedal2.setFill(#000000);
    myPogo.addChild(pogo);
    myPogo.addChild(handlebar);
    myPogo.addChild(spring);
    myPogo.addChild(footpedal1);
    myPogo.addChild(footpedal2);
    myPogo.addChild(person);
    myPogo.addChild(eye1);
    myPogo.addChild(eye2);
    myPogo.addChild(smile);
  }
  
  void move(){
    float f = -((ks * (y - ry)) + kd*vy);
    float a = f/m;
    vy = vy + a;
    y += vy;    
    pushMatrix();
    translate(x,y);
    shape(myPogo);
    popMatrix();
    /*
    if(mouseX==x){
      x+=10;
    }
  */
  }
  
  void click(){
    vy =100;
    if(movingRight){
      pushMatrix();
      x+=50;
      translate(x,y);
      shape(pogo);
      popMatrix();
      if(x>=400){
        movingRight = false;
      }
    }
    else{
      pushMatrix();
      x-=50;
      translate(x,y);
      shape(pogo);
      popMatrix();
      if(x<= 0){
        movingRight = true;
      }
    }

  }
}