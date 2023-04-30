class Circle {

  float r;
  float g;
  float b;
  
  float x;
  float y;

  float rad = 0;
  float noiseScale = random(.01, .03); //.01;
  float noiseAmount = 20;
  int N = 360;

  Circle(float x, float y, float r, float g, float b) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.g = g;
    this.b = b;
  }

  public void update() {

    stroke(color(this.r, this.g, this.b));
    noFill();

    pushMatrix();
    colorMode(RGB);

    beginShape();
    for (int i=0; i<N; i++) {
      x = width/2 + rad*cos(TWO_PI*i/N);
      y = height/2 + rad*sin(TWO_PI*i/N);
      //x += map(noise(noiseScale*x, noiseScale*y, 0), 0, 1, -noiseAmount, noiseAmount);
      //y += map(noise(noiseScale*x, noiseScale*y, 1), 0, 1, -noiseAmount, noiseAmount);
      x += map(noise(noiseScale*x, noiseScale*y, 0), 0, 1, -noiseAmount, noiseAmount);
      y += map(noise(noiseScale*x, noiseScale*y, 1), 0, 1, -noiseAmount, noiseAmount);
      vertex(x, y);
    }
    endShape();
    rad++;
    
    popMatrix();
  }
}
