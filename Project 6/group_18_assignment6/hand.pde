PShape hand, forehand, finger;
class hand
{
  hand()
  {
    hand = createShape(GROUP);
    
    fill(178,127,39);
    forehand = createShape();
    forehand.beginShape();
    forehand.vertex(0,0);
    forehand.vertex(30,-10);
    forehand.vertex(60,-20);
    forehand.vertex(120,-25);
    forehand.vertex(170,-21);
    forehand.vertex(240,0);
    forehand.vertex(270,20);
    forehand.vertex(310,80);
    forehand.vertex(310,200);
    forehand.vertex(240,100);
    forehand.vertex(220,95);
    forehand.vertex(200,100);
    forehand.vertex(170,110);
    forehand.vertex(155,110);
    forehand.vertex(100,100);
    forehand.vertex(105,90);
    forehand.vertex(130,85);
    forehand.vertex(150,82);
    forehand.vertex(180,65);
    forehand.vertex(185,50);
    forehand.vertex(180,30);
    forehand.vertex(120,15);
    forehand.vertex(60,10);
    forehand.vertex(20,10);
    forehand.endShape(CLOSE);
    
    fill(152,109,35);
    finger = createShape();
    finger.beginShape();
    finger.vertex(10,30);
    finger.vertex(80,0);
    finger.vertex(170,0);
    finger.vertex(50,30);
    finger.endShape(CLOSE);
    
    hand.addChild(finger);
    hand.addChild(forehand);
  }
  void display()
  {
    shape(hand);
  }
}