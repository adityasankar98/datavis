String[] fontlist = PFont.list();
String[] words;
String str = " ";
color c1;
color c2;
color c3;
int y = 0;

PFont font;

void setup()
{
  background(255);
  size(700,600);
  words = loadStrings("uniquewords.txt");
  font = createFont("americantypewriter-bold",15);
  textFont(font);
  textLeading(15);
  text(str,10,10,685,580);
  c1 = color(150,80,80,150);
  c2 = color(150,150,150,175);
  c3 = color(150,0,0,200);
}
String randomWord()
{
  int i = int(random(words.length));
  String word = words[i];
  return word;
}
void draw()
{
  String word = randomWord();
  if (word.length() <= 6)
    fill(c2);
   else if (word.length() > 6 && word.length() <= 8)
     fill(c1);
   else
     fill(c3);
  text(word,textWidth(str),y,500,500);
  str += word+" ";
  if (textWidth(str) > width-55)
  {
    str = " ";
    y += 20;
  }
}