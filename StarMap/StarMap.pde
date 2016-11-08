ArrayList<Star> stars = new ArrayList<Star>();
float offset = 50.0;
void setup()
{
  size(500, 500);
  loadData();
  printStars();
}

void draw()
{
  background(0);
  drawGrid();
  point(50,50);
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
  float len  = (width - (offset * 2));
  float stepsize = len / 11;
  float step = 0;
  for(int i = 0; i <  12; i ++)
  {
    line(offset + step, offset, offset + step, height - offset);
    step += stepsize;
  }
  
  step = 0;
  for(int i = 0; i < 12; i ++)
  {
    line(offset, offset + step, width - offset, offset + step);
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