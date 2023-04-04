class Lineobj {

  float x1;
  float y1;
  float x2;
  float y2;
  color col;
  
  
  Lineobj(int x1in, int y1in, int x2in, int y2in, color incol){
    x1 = x1in;
    y1 = y1in;
    x2 = x2in;
    y2 = y2in;
    col = incol;
  }
  
  public void update() {
    stroke(col);
    line(x1, y1, x2, y2);
  }   
}
