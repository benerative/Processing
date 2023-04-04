class Circle {

  int size;
  int r = 100;
  color col;
  float x=430/2;
  float y=760/2;
  float x1;
  float y1;
  float pos=random(0, 15);
  float step=random(.05, .12);
  
  Circle(int insize, int radius){
    size = insize;
    r = radius;
    
  }
  
  public void setcolor(color incolor){
    col = incolor;
  }
  
  public color getcolor(){
    return col;
  }
  
  public int[] getval() {
    int[] fa = {int(x1) + int(size/4),int(y1) + int(size/4)};
    return fa;
  }
  
  public void update() {
    //colorMode(RGB);
    fill(col);
    stroke(col);
    x1 = x +  r*cos(pos);
    y1 = y +  r*sin(pos);

    ellipse(x1, y1, size, size);

    pos+=step;
  }   
}
