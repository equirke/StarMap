class Star
{
  int habFlag;
  String name;
  float distance;
  float xG, yG, zG;
  float absMag;
  float xP, yP;
  
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
  
  String toString()
  {
    return (String)(name + " " + habFlag + " " + distance
    + " " + xG + " " + yG + " " + zG + " " +  absMag);
  }
  
  float getX()
  {
    return xG;
  }
  float getY()
  {
    return yG;
  }
  float getZ()
  {
    return zG;
  }
  
  void setScreenPos(float pX, float pY)
  {
    this.xP = xP;
    this.yP = yP;
  }
}