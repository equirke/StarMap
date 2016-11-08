/*
  Name: Eoghan Quirke
  Student No: C15507837
  Date: 08/11/16
*/

ArrayList<Star> stars = new ArrayList<Star>();
float offset = 50.0;
boolean clicked;
Star star1;
Star star2;
String answer = "";

void setup()
{
  /*Setting size to 800 x 800 will not fit on screen for me
  Only seemed to work in present mode So for speed's sake I did most
  of it in 500 x 500, however every thing works the same in 800 x 800*/
  //size(500,500);
  size(800, 800);
  textAlign(CENTER, CENTER);
  loadData();
  printStars();
}

void draw()
{
  background(0);
  drawGrid();
  plotStars();
  drawLine();
  writeAnswer();
}

void printStars()
{
  for(int i = 0; i < stars.size(); i++)
  {
    println(stars.get(i).toString());
  }
}

void drawGrid()
{
  stroke(171, 20, 149);
  fill(171, 20, 149);
  float len  = (width - (offset * 2));
  float stepsize = len / 10;
  float step = 0;
  int label = -5;
  for(int i = 0; i <  11; i ++)
  {
    line(offset + step, offset, offset + step, height - offset);
    text(label, (offset + step), (offset - 10));
    label++;
    step += stepsize;
  }

  step = 0;
  label = -5;
  for(int i = 0; i < 11; i ++)
  {
    line(offset, offset + step, width - offset, offset + step);
    text(label, (offset - 10), (offset + step));
    label++;
    step += stepsize;
  }
}

void loadData()
{
  Table table = loadTable("HabHYG15ly.csv", "header, csv");

  for(TableRow row : table.rows())
  {
    Star s = new Star(row.getInt("Hab?"), row.getString("Display Name"),
    row.getFloat("Distance"), row.getFloat("Xg"), row.getFloat("Yg"),
    row.getFloat("Zg"), row.getFloat("AbsMag"));
    stars.add(s);  
  }
}

void plotStars()
{
  float x, y;
  for(int i = 0; i < stars.size(); i++)
  {
    x = stars.get(i).getX();
    y = stars.get(i).getY();
    x = map(x, -5.0, 5.0, offset, (width - offset));
    y = map(y, -5.0, 5.0, offset, (height - offset));
    stroke(255, 0, 0);
    fill(0);
    ellipse(x , y, 10, 10);
    stroke(255, 255, 0);
    line(x - 5, y, x + 5, y);
    line(x, y - 5, x , y + 5);
    textAlign(LEFT, CENTER);
    fill(255);
    text(stars.get(i).getName(), x + 5, y);
    textAlign(CENTER, CENTER);
    fill(0);
    stars.get(i).setScreenPos(x,y);

  }
}

void mousePressed()
{
  float x, y;
  float dist;
  if(clicked)
  {
    for(int i = 0; i < stars.size(); i++)
    {
      x = stars.get(i).getScreenX();
      y = stars.get(i).getScreenY();
      
      if((mouseX > x - 10 && mouseX < x + 10) &&
      (mouseY > y - 10 && mouseY < y + 10))
      {
        star2 = stars.get(i);
        clicked = false;
        dist = dist(star1.getX(), star1.getY(), star1.getZ(),
        star2.getX(), star2.getY() , star2.getZ());
        answer = "Distance from " + star1.getName()
        + " to " + star2.getName() 
        + " is " + dist + " parsecs";
        break;
      }

    }
  }
  else
  {
    for(int i = 0; i < stars.size(); i++)
    {
      star1 = null;
      star2 = null;
      x = stars.get(i).getScreenX();
      y = stars.get(i).getScreenY();
      
      if((mouseX > x - 10 && mouseX < x + 10) &&
      (mouseY > y - 10 && mouseY < y + 10))
      {
        star1 = stars.get(i);
        clicked = true;
        break;
      }
      
    }
  }
}


void drawLine()
{
  if(star1 != null && star2 != null)
  {
    line(star1.getScreenX(), star1.getScreenY(),
    star2.getScreenX(), star2.getScreenY());
  }
  else if(star1 != null)
  {
    line(star1.getScreenX(), star1.getScreenY(),
    mouseX, mouseY);
  }
}

void writeAnswer()
{
  fill(255);
  text(answer, width/2, height - 30);
}