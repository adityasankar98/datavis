String[] fontlist = PFont.list();
String[] words;
String str = "";
int spacing = 0;

PFont courier;

void setup()
{
  size(700,600);
  words = loadStrings("uniquewords.txt");
  //frequencies = loadStrings("wordfrequency.txt");
  courier = createFont("courier",12);
  textFont(courier);
    for (String word: words)
  {
    str += word+" ";
    //spacing += word.width();
  }
  text(str,10,10,600,600);
}
void draw()
{
}