class Node
{
  float x, y, targetX, targetY, r, b, colorR, colorB, temp;
  float range, median, increments;
  Node(float targetX, float targetY, float temp, float maxTemp, float minTemp)
  {
    this.targetX = targetX;
    this.targetY = targetY;
    this.temp = temp;
    x = width/2;
    y = height/2;
    colorR = 125;
    colorB = 125;
    range = maxTemp-minTemp;
    median = range/2;
    increments = (255-125)/median;
    if (temp >= (maxTemp-median))
    {
      this.r = 125+(temp-(minTemp+median))*increments;
      this.b = 125-(temp-(minTemp+median))*increments;
    }
    else
    {
      this.b = 125+((minTemp+median)-temp)*increments;
      this.r = 125-((minTemp+median)-temp)*increments;
    }
  }
  void display(float counter)
  {
    if (counter >= 100)
    {
      colorR = lerp(colorR,r,.1);
      colorB = lerp(colorB,b,.1);
    }
    noStroke();
    fill(colorR,0,colorB);
    x = lerp(x,targetX,.05);
    y = lerp(y,targetY,.05);
    ellipse(x,y,10,10);
  }
  void update(float targetX, float targetY, float temp, float maxTemp, float minTemp)
  {
    this.temp = temp;
    this.targetX = targetX;
    this.targetY = targetY;
    range = maxTemp-minTemp;
    median = range/2;
    increments = (255-125)/median;
    if (temp >= (maxTemp-median))
    {
      this.r = 125+(temp-(minTemp+median))*increments;
      this.b = 125-(temp-(minTemp+median))*increments;
    }
    else
    {
      this.b = 125+((minTemp+median)-temp)*increments;
      this.r = 125-((minTemp+median)-temp)*increments;
    }
  }
}