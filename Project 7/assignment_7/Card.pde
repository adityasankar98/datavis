class Card{
  PShape card;
  String _id;
  String _cardColor;
  
  Card(String _id, String _cardColor){
    id = _id;
    int intC = unhex(_cardColor);
    card = createShape(RECT, 50, 50, 80, 100);
    card.setFill(intC);
  }
  
  void display(){
  pushMatrix();
  shape(card);
  popMatrix();
  }
}