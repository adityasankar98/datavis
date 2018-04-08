String id, cardColor;
float xPos, yPos;
color green;
Card firstCard, secondCard;
ArrayList<Card> cards;
String[] ids = {"circle1","circle2","square1","square2","triangle1","triangle2",
                "star1","star2","rect1","rect2","ellipse1","ellipse2"};
StringList deck = new StringList();

//Timer code begins
String[] fontlist = PFont.list();
int time, penalty, frame, delta = 0, attempt = 0, match1Index = 0, match2Index = 0, numTries;
boolean match, gameOver = false, wiped = false;

PFont courier;
String timeDisplay = "Time Elapsed: ", scoreDisplay = "Final Score: ", boardDisplay = "";
//Timer code ends


void setup(){
  green = color(#69897E);
  size(500,500);
  
  //fill deck with info
  for (int i = 0; i < ids.length; i++)
  {
    deck.append(ids[i]);
  }
  //Populate canvas with cards
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
  }
  
  //Timer code begins
  courier = createFont("courier",24);
  textFont(courier);
  //Timer code ends
}

void draw(){
  background(green);
  
  //Timer code begins
  frame++;
  if (frame == 60)
  {
    time = time + delta;
    frame = 0;
  }
  text(timeDisplay+nf(time,2),width-300,32);
  text(boardDisplay,(width/2)-125,430);
  //Timer code ends
  
  //update cards
  for (int i = 0; i < cards.size(); i++){
    cards.get(i).update(deck,i);
    cards.get(i).display();
  }  
  
  //check if game is over
  if (deck.size() < 1 || time >= 60)
  {
    delta = 0;
    gameOver = true;
    if (time >= 60)
    {
      penalty = -2*(12-deck.size());
    }
  }
  
  
  if (time == 0 && frame < 30)
  {
    boardDisplay = "Push 'S' to begin!";
  }
  else if ((gameOver == false) && frame > 30)
  {
    boardDisplay = "";
  }
  else if (gameOver)
  {
    PShape outline = createShape(RECT,width/2-120,370,250,50);
    outline.setStroke(0);
    outline.setFill(color(#69897E));
    shape(outline);
    fill(255,75,75);
    boardDisplay = scoreDisplay+nf(60-time-penalty,2);
    text(boardDisplay,(width/2)-125,430);
  }
}

void keyPressed()

//Timer code begins
{
  if (key == 's')
  {
    deck.shuffle();
    delta = 1;
  }
  if (key == ' ' && delta == 1)
  {
    fill(255,252,146);
    delta = 0;
    penalty += 5;
    //text("Score -5 pts",(width/2)-100,400);
  }
  else if (key == ' ' && delta == 0)
  {
    fill(255);
    delta = 1;
  }
  else if (key == 'r')
  {
    time = 0;
    for (int i = 0; deck.size() > 0; i++)
    {
      deck.remove(0);
    }
    //fill deck with info
    for (int i = 0; i < ids.length; i++)
    {
      deck.append(ids[i]);
    }
    //Populate canvas with cards
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
    }
    deck.shuffle();
    delta = 0;
  }
  //Timer code ends
  
}

void mousePressed()
{
  //flip back unmatched pairs
  if (match == false && numTries > 0 && attempt == 0)
  {
    firstCard.flipBack();
    secondCard.flipBack();
  }
  //Remove matching pairs
  for (Card card: cards)
  {
    if (card.isOver())
    {
      numTries++;
      attempt++;
      card.flip();
      int idIndex = card.check(deck);
      if (attempt == 1)
      {
        firstCard = card;
        match1Index = idIndex;
      }
      else
      {
        secondCard = card;
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
    if (shape1.equals(shape2) && !(card1.equals(card2)))
    {
      match = true;
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
    else
    {
      match = false;
    }
    attempt = 0;
  }
}