String[] fontlist = PFont.list();
int time, frame, delta =1;

PFont courier;
String timeDisplay = "Time Passed: ";

void setup()
{
  size(500,500);
  courier = createFont("courier",32);
  textFont(courier);
}
void draw()
{
  background(0);
  frame++;
  if (frame == 60)
  {
    time = time + delta;
    frame = 0;
  }
  text(timeDisplay+nf(time,2),width-300,32);
}
void keyPressed()
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
}