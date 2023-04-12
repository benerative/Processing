class Rectangle {

  color col;
  float xsize1;
  float xsize2;
  float zsize;
  float x;
  float x2;
  float y;
  float y2;
  float z;
  float r;
  float g;
  float b;
  float theta = random(0, 1);
  float x2start;

  Rectangle(float r, float g, float b, float x, float y, float z, float xsize1, float xsize2, float zsize) {
    this.x = x;
    this.x2 = x+.5*xsize1-.5*xsize2;
    this.x2start = x+.5*xsize1+.5*xsize2;
    this.y = y;
    this.y2 = y-.5*xsize1+.5*xsize2;
    this.z = z;
    this.r = r;
    this.g = g;
    this.b = b;
    this.xsize1 = xsize1;
    this.xsize2 = xsize2;
    this.zsize =  zsize;
  }

  public void changeColor(float r, float g, float b) {
    pushMatrix();
    this.r = int(r);
    this.g = int(g);
    this.b = int(b);
    popMatrix();
  }

  public void update() {
    pushMatrix();
    colorMode(RGB);

    this.x2 += map(sin(theta), 1, -1, -2.2, 2.2);
    this.y2 += map(cos(theta), 1, -1, -2.2, 2.2);
    this.theta+=0.015;

    fill(color(this.r, this.g, this.b));
    stroke(color(this.r/2, this.g/2, this.b/2));
    strokeWeight(2);

    beginShape();
    //back end
    vertex(this.x, this.y, this.z);
    vertex(this.x+this.xsize1, this.y, this.z);
    vertex(this.x+this.xsize1, this.y-this.xsize1, this.z);
    vertex(this.x, this.y-this.xsize1, this.z);
    vertex(this.x, this.y, this.z);
    endShape();


    beginShape();
    //front end
    vertex(this.x2, this.y2, this.z+this.zsize);
    vertex(this.x2+this.xsize2, this.y2, this.z+this.zsize);
    vertex(this.x2+this.xsize2, this.y2-this.xsize2, this.z+this.zsize);
    vertex(this.x2, this.y2-this.xsize2, this.z+this.zsize);
    vertex(this.x2, this.y2, this.z+this.zsize);
    endShape();

    beginShape();
    //right side
    vertex(this.x2+this.xsize2, this.y2, this.z+this.zsize);
    vertex(this.x+this.xsize1, this.y, this.z);
    vertex(this.x+this.xsize1, this.y-this.xsize1, this.z);
    vertex(this.x2+this.xsize2, this.y2-this.xsize2, this.z+this.zsize);
    vertex(this.x2+this.xsize2, this.y2, this.z+this.zsize);
    endShape();

    beginShape();
    //bottom side
    vertex(this.x2+this.xsize2, this.y2, this.z+this.zsize);
    vertex(this.x+this.xsize1, this.y, this.z);
    vertex(this.x, this.y, this.z);
    vertex(this.x2, this.y2, this.z+this.zsize);
    vertex(this.x2+this.xsize2, this.y2, this.z+this.zsize);
    endShape();

    beginShape();
    //right side
    vertex(this.x, this.y, this.z);
    vertex(this.x+this.xsize1, this.y, this.z);
    vertex(this.x+this.xsize1, this.y-this.xsize1, this.z);
    vertex(this.x, this.y-this.xsize1, this.z);
    vertex(this.x, this.y, this.z);
    endShape();

    beginShape();
    //left side
    vertex(this.x2, this.y2, this.z+this.zsize);
    vertex(this.x, this.y, this.z);
    vertex(this.x, this.y-this.xsize1, this.z);
    vertex(this.x2, this.y2-this.xsize2, this.z+this.zsize);
    vertex(this.x2, this.y2, this.z+this.zsize);
    endShape();

    beginShape();
    //top side
    vertex(this.x2+this.xsize2, this.y2-this.xsize2, this.z+this.zsize);
    vertex(this.x+this.xsize1, this.y-this.xsize1, this.z);
    vertex(this.x, this.y-this.xsize1, this.z);
    vertex(this.x2, this.y2-this.xsize2, this.z+this.zsize);
    vertex(this.x2+this.xsize2, this.y2-this.xsize2, this.z+this.zsize);
    endShape();

    popMatrix();
  }
}
