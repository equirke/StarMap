class Star
{
  int habFlag;
  String name;
  float distance;
  float xG, yG, zG;
  float absMag;
  
  Star(int habFlag, String name, float distance,
  float xG, float yG, float zG, float absMag)
  {
    this.habFlag = habFlag;
    this.name = name;
    this.distance = distance;
    this.xG = xG;
    this.yG = yG;
    this.zG = zG;
    this.absMag = absMag;
  }
}