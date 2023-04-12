import peasy.*;

ArrayList<Rectangle> rects = new ArrayList<Rectangle>();
ArrayList<ArrayList<Rectangle>> dimensions = new ArrayList<ArrayList<Rectangle>>();


float r = random(0, 256);
float g = random(0, 256);
float b = random(0, 256);

int counter = 0;

float t = 0;
PeasyCam cam;

void setup () {

  size(430, 760, P3D);
  frameRate(60);
  orientation(LANDSCAPE);


  // cam = new PeasyCam(this, 400, 400, 0, 1500);

  for (int j = 0; j < 20; j++) {
    for (int i = 0; i < 15; i++) {
      rects.add(new Rectangle(r-3*i+j*6, g-3*i+j*6, b-3*i+j*6, i*90, j*90, 0, 80, 10, 200));
    }
  }
}


void draw ()
{
  background(255-r, 255-g, 255-b);
  ambientLight(255, 255, 255);
  directionalLight(255-r, 255-g, 255-b, 0, 0, -1);

  for (int i = 0; i  < rects.size(); i++) {
    rects.get(i).update();
  }

  if (counter > 300) {
    r = random(0, 256);
    g = random(0, 256);
    b = random(0, 256);
    for (int j = 0; j < 20; j++) {
      for (int i = 0; i < 15; i++) {
        println(i+j*15);
        rects.get(i+j*15).changeColor(r-3*i+j*6, g-3*i+j*6, b-3*i+j*6);
      }
    }
    counter = 0;
  }
  counter++;

  camera(.5*(90*15), .5*(90*18), 1500, .5*(90*15), .5*(90*18), 0, 0, -1, -1);
}
