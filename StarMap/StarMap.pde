ArrayList<Star> stars = new ArrayList<Star>();
float offset = 50.0;
void setup()
{
  size(500, 500);
  textAlign(CENTER, CENTER);
  loadData();
  printStars();
}

void draw()
{
  background(0);
  drawGrid();
  plotStars();
  
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

  }
}

void mouseReleased()
{
  for(int i = 0; i < stars.size(); i++)
  {
  }
}