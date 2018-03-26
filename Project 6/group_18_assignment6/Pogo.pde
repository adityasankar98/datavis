class Pogo{
  PImage img;
  PShape person, eye1, eye2, smile;
  PShape myPogo, pogo, handlebar, spring, footpedal1, footpedal2;
  float _x, _y, _vy;
  boolean _movingRight;
  
  Pogo(float _x, float _y, float _vy, boolean _movingRight){
    xPogo = _x;
    yPogo = _y;
    vyPogo = _vy;
    person = createShape(ELLIPSE, xPogo+15, yPogo-40, 50,50);
    person.setFill(#FFFF00);
    eye1 = createShape(ELLIPSE, xPogo+5, yPogo-45, 10, 10);
    eye2 = createShape(ELLIPSE, xPogo+25, yPogo -45, 10, 10);
    smile = createShape(ARC, xPogo+15, yPogo-25, 20, 20, PI, 2*PI);
    //person.setTexture(img);
    myPogo = createShape(GROUP);    
    movingRight = _movingRight;
    pogo = createShape(RECT, xPogo, yPogo, 30, 100);
    pogo.setFill(#800080);
    handlebar = createShape(RECT, xPogo-15,yPogo-10, 60, 10);
    handlebar.setFill(#C0C0C0);
    spring = createShape(RECT, xPogo+10, yPogo+100, 10, height-100);
    footpedal1 = createShape(RECT, xPogo-10, yPogo+70, 10, 5);
    footpedal1.setFill(#000000);
    footpedal2 = createShape(RECT,xPogo+30, yPogo+70, 10, 5);
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
    float f = -((ksPogo * (yPogo - ryPogo)) + kdPogo*vyPogo);
    float a = f/mPogo;
    vyPogo = vyPogo + a;
    yPogo += vyPogo;    
    pushMatrix();
    translate(xPogo,yPogo);
    shape(myPogo);
    popMatrix();
  }
  
  void click(){
    vyPogo =100;
    if(movingRight){
      pushMatrix();
      xPogo+=50;
      translate(xPogo,yPogo);
      shape(pogo);
      popMatrix();
      if(xPogo>=400){
        movingRight = false;
      }
    }
    else{
      pushMatrix();
      xPogo-=50;
      translate(xPogo,yPogo);
      shape(pogo);
      popMatrix();
      if(xPogo<= 0){
        movingRight = true;
      }
    }

  }
}