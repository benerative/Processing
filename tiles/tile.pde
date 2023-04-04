class Tile {

  int size = 10;
  color col = color(255, 255, 255);
  float xval;
  float yval;
  
  Tile(float xvalue, float yvalue){
    xval = xvalue;
    yval = yvalue;
  }
  
  public void setcolor(color incol){
    col = incol;
  }
  
  public color getcolor(){
    return col;
  }
  
  public int[] getval() {
    int[] fa = {int(xval),int(yval)};
    return fa;
  }
  
  public void update() {
    //colorMode(RGB);
    fill(col);
    stroke(col);
    rect(xval * size, yval * size, size, size);
  }   
}
