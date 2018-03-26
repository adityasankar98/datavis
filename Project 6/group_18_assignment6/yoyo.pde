PShape yoyo, main, spot1, spot2, spot3, spot4, spot5, spot6, star;
class yoyo
{
  yoyo()
  {    
    yoyo = createShape(GROUP);
    fill(247,255,127);
    noStroke();
    main = createShape(ELLIPSE, 0, 0, 100, 100);
    fill(182,119,198);
    spot1 = createShape(ELLIPSE, -34.64, 20, 10, 10);
    spot2 = createShape(ELLIPSE, 34.64, 20, 10, 10);
    spot3 = createShape(ELLIPSE, 0, -40, 10, 10);
    fill(255,87,87);
    spot4 = createShape(ELLIPSE, -34.64, -20, 10, 10);
    spot5 = createShape(ELLIPSE, 34.64, -20, 10, 10);
    spot6 = createShape(ELLIPSE, 0, 40, 10, 10);
    fill(11,158,243);
    star(0,0,10,25,5);
    
    yoyo.addChild(main);
    yoyo.addChild(spot1);
    yoyo.addChild(spot2);
    yoyo.addChild(spot3);
    yoyo.addChild(spot4);
    yoyo.addChild(spot5);
    yoyo.addChild(spot6);
    yoyo.addChild(star);
  }
  void display()
  {
    shape(yoyo);
  }
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  star = createShape();
  star.beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    star.vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    star.vertex(sx, sy);
  }
  star.endShape(CLOSE);
}