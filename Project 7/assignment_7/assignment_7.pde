String id, cardColor;
float xPos, yPos;
color green;
Card [] cards;

//Timer code begins
String[] fontlist = PFont.list();
int time, frame, delta =1;

PFont courier;
String timeDisplay = "Time Elapsed: ";
//Timer code ends

//Card c1;

void setup(){
  green = color(#228B22);
  size(500,500);
  
  //c1 = new Card("A1", "0000FF", 50, 50);
  int x = 50;
  int y = 50;
  int cardsInRow = 0;
  int maxCardsInRow = 4;
  cards = new Card[12];
  for(int i =0; i< 12; i++){
    if(cardsInRow >= maxCardsInRow){
      x=50;
      y+=120;
      cardsInRow = 0;
    }
    cards[i] = new Card("A1", "0000FF", x, y);
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