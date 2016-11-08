ArrayList<Star> stars = new ArrayList<Star>();
float offset = 30.0;
void setup()
{
  Table table = loadTable("HabHYG15ly.csv", "header, csv");

  for(TableRow row : table.rows())
  {
    Star s = new Star(row.getInt("Hab?"), row.getString("Display Name"),
    row.getFloat("Distance"), row.getFloat("Xg"), row.getFloat("Yg"),
    row.getFloat("Zg"), row.getFloat("AbsMag"));
    println(row.getString("Display Name"));
    stars.add(s);  
  }
}

void draw()
{
}