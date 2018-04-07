String id, cardColor;
float xPos, yPos;
color green;
ArrayList<Card> cards;
String[] ids = {"circle1","circle2","square1","square2","triangle1","triangle2",
                "star1","star2","rect1","rect2","ellipse1","ellipse2"};
StringList deck = new StringList();

//Timer code begins
String[] fontlist = PFont.list();
int time, frame, delta =1, attempt = 0, match1Index = 0, match2Index = 0;

PFont courier;
String timeDisplay = "Time Elapsed: ";
//Timer code ends

//Card c1;

void setup(){
  green = color(#228B22);
  size(500,500);
  
  //fill deck with info
  for (int i = 0; i < ids.length; i++)
  {
    deck.append(ids[i]);
  }
  
  //c1 = new Card("A1", "0000FF", 50, 50);
  int x = 50;
  int y = 50;
  int cardsInRow = 0;
  int maxCardsInRow = 4;
  cards = new ArrayList<Card>();
  for(int i =0; i< 12; i++){
    if(cardsInRow >= maxCardsInRow){
      x=50;
      y+=120;
      cardsInRow = 0;
    }
    String id = ids[i];
    cards.add(new Card(id, x, y));
    x+=110;
    cardsInRow += 1;
    //y+=50;
  }
  
  //Timer code begins
  courier = createFont("courier",24);
  textFont(courier);
  //Timer code ends
}

void draw(){

  background(green);
  /*
  for (Card card: cards){
  
  }
  */
  background(green);
  //c1.display();
  //Timer code begins
  frame++;
  if (frame == 60)
  {
    time = time + delta;
    frame = 0;
  }
  text(timeDisplay+nf(time,2),width-300,32);
  //Timer code ends
  //c1.display();  
  for (Card card: cards){
    //println(card._id);
    card.display();
  }  
}

void keyPressed()

//Timer code begins
{
  if (key == ' ' && delta == 1)
  {
    delta = 0;
  }
  else if (key == ' ' && delta == 0)
  {
    delta = 1;
  }
  else if (key == 'r')
  {
    time = 0;
  }
  //Timer code ends
  
}

void mousePressed()
{
  //Remove matching pairs
  for (Card card: cards)
  {
    if (card.isOver())
    {
      attempt++;
      card.flip();
      int idIndex = card.check(deck);
      if (attempt == 1)
      {
        match1Index = idIndex;
      }
      else
      {
        match2Index = idIndex;
      }
    }
  }
  
  if (attempt == 2)
  {
    String card1 = cards.get(match1Index)._id;
    String card2 = cards.get(match2Index)._id;
    String shape1 = card1.substring(0,card1.length()-1);
    String shape2 = card2.substring(0,card2.length()-1);
    if (shape1.equals(shape2))
    {
      cards.remove(match1Index);
      deck.remove(match1Index);
      if (match2Index > match1Index)
      {
        cards.remove(match2Index-1);
        deck.remove(match2Index-1);
      }
      else
      {
        cards.remove(match2Index);
        deck.remove(match2Index);
      }
    }
    attempt = 0;
  }
}