Table table;
PImage usa;
float mapY = -1000;
int counter = 0, numRows, lastColumn = 1, year = 1856;;
float[] votesRepub;
float[] stateX = {355,116,138,303,78,200,449,434,377,376,
                  176,130,325,350,292,272,365,316,465,424,
                  460,358,294,323,302,160,263,94,454,440,
                  195,436,419,243,375,256,80,420,457,400,
                  243,350,256,151,444,419,85,390,325,202};
float[] stateY = {290,344,273,270,205,215,179,205,308,278,
                  345,150,210,211,198,226,230,314,146,207,
                  170,180,163,293,231,138,205,198,158,195,
                  257,167,248,140,207,260,145,195,174,268,
                  168,256,303,196,151,222,120,220,175,190};
String[] fontlist = PFont.list();
PFont courier;
Node[] states;

void setup()
{
  usa = loadImage("USAmap.png");
  courier = createFont("courier",20);
  textFont(courier);
  size(500,500);
  
  table = loadTable("votes.repub.csv","header");
  numRows = table.getRowCount();
  votesRepub = new float[numRows];
  
  for (int i = 0; i < numRows; i++)
  {
    float votes = table.getFloat(i,lastColumn);
    if (Float.isNaN(votes))
    {
      votesRepub[i] = 50;
    }
    else
    {
      votesRepub[i] = votes;
    }
  }
  if (lastColumn < table.getColumnCount()-1)
  {
    lastColumn++;
    year += 4;
  }
  else
  {
    lastColumn = 1;
    year = 1856;
  }
  
  states = new Node[stateX.length];
  for (int i = 0; i < stateX.length; i++)
  {
    states[i] = new Node(stateX[i],stateY[i],votesRepub[i],100,0);
  }
}

void draw()
{
  counter++;
  background(200);
  mapY = lerp(mapY,200,.05);
  pushMatrix();
  scale(.5,.5);
  image(usa,5,mapY);
  popMatrix();
  
  fill(60);
  text("Year: "+year,300,600-mapY);
  
  for (Node state:states)
  {
    state.display(counter);
  }
  if (counter % 30 == 0)
  {
    table = loadTable("votes.repub.csv","header");
    numRows = table.getRowCount();
    votesRepub = new float[numRows];
    
    for (int i = 0; i < numRows; i++)
    {
      float votes = table.getFloat(i,lastColumn);
      if (Float.isNaN(votes))
      {
        votesRepub[i] = 50;
      }
      else
      {
        votesRepub[i] = votes;
      }
      println(votesRepub[i]);
    }
    if (lastColumn < table.getColumnCount()-1)
    {
      lastColumn++;
      year += 4;
    }
    else
    {
      lastColumn = 1;
      year = 1856;
    }
    for (int i = 0; i < stateX.length; i++)
    {
      states[i].update(stateX[i],stateY[i],votesRepub[i],100,0);
    }
  }
}