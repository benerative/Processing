Planet[] planets = new Planet[9];
int camdir = -1;
float prevx = 0;

float r = random(0, 256);
float g = random(0, 256);
float b = random(0, 256);

float yoffset =  0;
int allow = 1;
float rotation = 0;

void setup () {

  size(430, 760, P3D);
  frameRate(60);
  orientation(LANDSCAPE);

  planets[0] = new Planet(r, g, b, 60, 0, 20);
  for (int i = 1; i < planets.length; i++) {
    planets[i] = new Planet(r-i*10, g-i*10, b-i*10, 50-(i*5), (i*110)+(10-i), 20-i*2);
  }
}


void draw ()
{
  background(255-r, 255-g, 255-b);
  ambientLight(255, 255, 255);
  directionalLight(255, 255, 255, 1, -1, 0);

  for (int i = 0; i < planets.length; i++) {
    planets[i].update();
  }

  float orbitRadius= 2200;
  float ypos= -sin(radians(rotation))*orbitRadius;
  float xpos= cos(radians(rotation))*orbitRadius;
  float zpos=0;// sin(radians(rotation))*orbitRadius;
  
  if((Integer.signum(int(xpos)) != Integer.signum(int(prevx))) && (allow==1)){
    camdir*=-1;
    allow=0;
  } else {
    allow=1;
  }

  camera(xpos, ypos+yoffset, zpos, 0, yoffset, 0, 0, camdir, 0);

  yoffset-=3;
  prevx=xpos;

  rotation+=.4;
}
