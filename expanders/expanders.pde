ArrayList<Circle> circs = new ArrayList<Circle>();

float r = random(0, 256);
float g = random(0, 256);
float b = random(0, 256);

int counter = 0;

void setup(){
  size(430, 760);
  
  for (int i = 0; i < 1; i++){
    circs.add(new Circle(width/2, height/2, r, g, b));
  }
  
}


void draw(){
  background(color(10, 10, 10));
  
  for (int i = 0; i < circs.size(); i++){
    circs.get(i).update();
  }
  
  if(counter > 100){
    circs.add(new Circle(width/2, height/2, r, g, b));
    counter = 0;
  }
  counter++;
}
