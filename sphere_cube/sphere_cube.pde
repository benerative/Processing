import peasy.*;

ArrayList<ArrayList<ArrayList<Sphere>>> dimensions = new ArrayList<ArrayList<ArrayList<Sphere>>>();

String  camdir  = "down";

float r = random(0, 256);
float g = random(0, 256);
float b = random(0, 256);

int cubesize = 9;

//PeasyCam cam;
float rotation=0;

void setup (){

  size(430, 760, P3D);
  frameRate(60);
  orientation(LANDSCAPE);
  
  for(int a = 0; a < cubesize; a++){
    dimensions.add(new ArrayList<ArrayList<Sphere>>());
    for(int i = 0; i < cubesize; i++){
      dimensions.get(a).add(new ArrayList<Sphere>());
      for(int j = 0; j < cubesize; j++){
        dimensions.get(a).get(i).add(new Sphere(r, g, b, 25, ((j*50)), (a*50), i*50, j*.5));
        dimensions.get(a).get(i).get(j).shiftx();
      }
    }
  }
  
  //cam = new PeasyCam(this, 0, 0, 0, 1500);

}

void reset(){
  r = random(0, 256);
  g = random(0, 256);
  b = random(0, 256);
  
  for(int a = 0; a < cubesize; a++){
    for(int i = 0; i < cubesize; i++){
      for(int j = 0; j < cubesize; j++){
        dimensions.get(a).get(i).get(j).reset(r, g, b);
      }
    }
  }
}

void draw ()
{ 
  background(255-r,255-g, 255-b);
  ambientLight(255, 255, 255);
  directionalLight(255, 255, 255, 1, -1, 0);
  
  for(int a = 0; a < cubesize; a++){
    for(int i = 0; i < cubesize; i++){
      for(int j = 0; j < cubesize; j++){
        dimensions.get(a).get(i).get(j).update();
      }
    }
  }
  
  float orbitRadius= 1150;
  float ypos= sin(radians(rotation))*orbitRadius;
  float xpos= cos(radians(rotation))*orbitRadius;
  float zpos= sin(radians(rotation))*orbitRadius;
  
  camera(xpos, ypos, zpos, 0, 0, 0, 0, -1, 0);
  
  if(int(rotation)%90 == 0){
    reset();
  }
  
  rotation++;
    
}
