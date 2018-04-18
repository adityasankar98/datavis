PShape star;

class Card{
  PShape card, figure;
  String _id, _cardColor;
  float _xPos, _yPos;
  int trial, figureFill = 255;
  
  Card(String id, float xPos, float yPos){
    _id = id;
    _xPos = xPos;
    _yPos = yPos;

    card = createShape(RECT, xPos, yPos, 80, 100);
    card.setStroke(255);
    String shape = id.substring(0,id.length()-1);
    if (shape.equals("circle"))
    {
      figure = createShape(ELLIPSE,_xPos+40,_yPos+50,30,30);
      figure.setStroke(255);
    }
    else if (shape.equals("square"))
    {
      figure = createShape(RECT,_xPos+25,_yPos+35,30,30);
      figure.setStroke(255);
    }
    else if (shape.equals("triangle"))
    {
      figure = createShape(TRIANGLE,_xPos+40,_yPos+35,_xPos+20,_yPos+61,_xPos+60,_yPos+61);
      figure.setStroke(255);
    }
    else if (shape.equals("star"))
    {
      star(_xPos+40,_yPos+50,10,25,5);
      figure = star;
      figure.setStroke(255);
    }
    else if (shape.equals("rect"))
    {
      figure = createShape(RECT,_xPos+25,_yPos+20,30,60);
      figure.setStroke(255);
    }
    else if (shape.equals("ellipse"))
    {
      figure = createShape(ELLIPSE,_xPos+40,_yPos+50,60,30);
      figure.setStroke(255);
    }
    //card.setFill(intC);
  }
   
  boolean isOver()
  {
    if (mouseX >= _xPos && mouseX <= _xPos+80 &&
        mouseY >= _yPos && mouseY <= _yPos+100)
    {
      return true;
    }
    else 
    {
      return false;
    }
  }
  
  void display()
  {
    ellipseMode(CENTER);
    pushMatrix();
    shape(card);
    shape(figure);
    popMatrix();
  }
  
  void flip()
  {
    figureFill = 0;
  }
  void flipBack()
  {
    figureFill = 255;
  }
  
  int check(StringList deck)
  {
    int index = 0;
    for (int i = 0; i < deck.size(); i++)
    {
      if (deck.get(i).equals(_id))
      {
        index = i;
      }
    }
    return index;
  }
  
  void update(StringList deck, int i)
  {
    _id = deck.get(i);
    String id = deck.get(i);
    String shape = id.substring(0,id.length()-1);
    if (shape.equals("circle"))
    {
      figure = createShape(ELLIPSE,_xPos+40,_yPos+50,30,30);
      figure.setStroke(255);
      figure.setFill(figureFill);
    }
    else if (shape.equals("square"))
    {
      figure = createShape(RECT,_xPos+25,_yPos+35,30,30);
      figure.setStroke(255);
      figure.setFill(figureFill);
    }
    else if (shape.equals("triangle"))
    {
      figure = createShape(TRIANGLE,_xPos+40,_yPos+35,_xPos+20,_yPos+61,_xPos+60,_yPos+61);
      figure.setStroke(255);
      figure.setFill(figureFill);
    }
    else if (shape.equals("star"))
    {
      star(_xPos+40,_yPos+50,10,25,5);
      figure = star;
      figure.setStroke(255);
      figure.setFill(figureFill);
    }
    else if (shape.equals("rect"))
    {
      figure = createShape(RECT,_xPos+25,_yPos+20,30,60);
      figure.setStroke(255);
      figure.setFill(figureFill);
    }
    else if (shape.equals("ellipse"))
    {
      figure = createShape(ELLIPSE,_xPos+40,_yPos+50,60,30);
      figure.setStroke(255);
      figure.setFill(figureFill);
    }
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