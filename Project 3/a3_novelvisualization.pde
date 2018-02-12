String[] fontlist = PFont.list();
String[] words;
String[] frequencies;
int spacing;

PFont courier;

void setup()
{
  size(700,600);
  words = loadStrings("uniquewords.txt");
  //frequencies = loadStrings("wordfrequency.txt");
  courier = createFont("courier",32);
  textFont(courier);
    for (String word: words)
  {
    text(word,0,32);
  }
}
void draw()
{
}