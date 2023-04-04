class Sphere {

  int size;
  color col;
  float x;
  float y;
  float z;
  float r;
  float g;
  float b;
  float theta;
  float addedt=0;
  
  Sphere(float r, float g,float b, int size, float x, float y, float z, float theta){
    this.size = size;
    this.x = x;
    this.y = y;
    this.z = z;
    this.r = r;
    this.g = g;
    this.b = b;
    this.theta = theta;
        
  }
  
  public void shiftx(){
    pushMatrix();
    this.x -= 225;
    this.y -= 225;
    this.z -= 225;
    popMatrix();
  }
  
  public void reset(float r,float g, float b){
    this.r = r;
    this.g = g;
    this.b = b;
  }
  
  public void update() {
    pushMatrix();
    colorMode(RGB);
    this.r += map(sin(theta), 1, -1, 4, -4);
    this.g += map(sin(theta), 1, -1, 4, -4);
    this.b += map(sin(theta), 1, -1, -4, 4);
    fill(color(int(this.r),int(this.g),int(this.b)));
    sphereDetail(20);
    noStroke();
    translate(map(sin(theta), 1, -1, -5, 5)+this.x,map(sin(theta), 1, -1, -25, 25)+this.y,map(cos(theta), 1, -1, -25, 25)+this.z);
    sphere(this.size);
    popMatrix();
    this.theta+=0.15;
  }   
}
