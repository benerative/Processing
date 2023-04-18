import peasy.*;

ArrayList<Rectangle> rects = new ArrayList<Rectangle>();

float r = random(0, 256);
float g = random(0, 256);
float b = random(0, 256);

float xpos = random(0, 90*15);
float zpos = 870;
float ypos = random(0, 90*20);
float xdest = random(0, 90*15);
float ydest = random(0, 90*20);

float rotation  = 0;
int counter = 0;

float t = 0;
//PeasyCam cam;

void setup () {

  size(430, 760, P3D);
  frameRate(60);
  orientation(LANDSCAPE);

  //cam = new PeasyCam(this, 400, 400, 0, 1500);

  for (int j = 0; j < 30; j++) {
    for (int i = 0; i < 17; i++) {
      rects.add(new Rectangle(r, g, b, i*95, j*95, 0, 80, 60, 200));
    }
  }
}

void draw ()
{
  background(255-r, 255-g, 255-b);
  ambientLight(255, 255, 255);
  
  if (counter == 60) {
    xdest = random(0, 90*15);
    ydest = random(0, 90*28);
    r = random(0, 256);
    g = random(0, 256);
    b = random(0, 256);
    for (int j = 0; j < rects.size(); j++) {
      rects.get(j).changeColor(r, g, b);
    }
    counter = 0;
  }

  pushMatrix();
  fill(color(255-r, 255-g, 255-b));
  stroke(color((255-r)/2, (255-g)/2, (255-b)/2));
  xpos = lerp(xpos, xdest, .03);
  ypos = lerp(ypos, ydest, .02);
  translate(xpos, ypos, zpos);
  box(50, 50, 10);
  popMatrix();

  for (int i = 0; i < rects.size(); i++) {
    rects.get(i).update(xpos,ypos,xpos);
  }

  camera(.5*(95*17), .5*(95*28), 2600, .5*(95*17), .5*(95*28), 0, 0, -1, -1);
  counter++;
}
