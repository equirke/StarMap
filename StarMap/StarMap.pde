ArrayList<Star> stars = new ArrayList<Star>();
float offset = 50.0;
void setup()
{
  size(800, 800);
  Table table = loadTable("HabHYG15ly.csv", "header, csv");

  for(TableRow row : table.rows())
  {
    Star s = new Star(row.getInt("Hab?"), row.getString("Display Name"),
    row.getFloat("Distance"), row.getFloat("Xg"), row.getFloat("Yg"),
    row.getFloat("Zg"), row.getFloat("AbsMag"));
    stars.add(s);  
  }
  
  printStars();
}

void draw()
{
}

void printStars()
{
  for(int i = 0; i < stars.size(); i++)
  {
    println(stars.get(i).toString());
  }
}