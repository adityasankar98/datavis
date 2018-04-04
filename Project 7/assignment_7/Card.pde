class Card{
  PShape card;
  String _id, _cardColor;
  float _xPos, _yPos;
  
  Card(String _id, String _cardColor, float _xPos, float _yPos){
    id = _id;
    xPos = _xPos;
    yPos = _yPos;
    int intC = unhex(_cardColor);
    card = createShape(RECT, xPos, yPos, 80, 100);
    card.setFill(intC);
  }
  
  void display(){
  pushMatrix();
  shape(card);
  popMatrix();
  }
}