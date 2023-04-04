Circle[] circles = new Circle[6];
ArrayList<Lineobj> lines = new ArrayList<Lineobj>();
int r = int(random(0, 256));
int g = int(random(0, 256));
int b = int(random(0, 256));
color activecol = color(r, g, b);
color middle = color(255-r, 255-g, 255-b);
color backgroundcol = color(255-r, 255-g, 255-b);
int selectedcirc1;
int selectedcirc2;
int count = 0;


void setup ()
{
  size(430, 760, P2D);
  frameRate(30);
  orientation(LANDSCAPE);
  
  selectedcirc1 = int(random(1,  3));
  selectedcirc2 = int(random(3,  6));
  
  for(int i = 0; i < circles.length; i++){
    circles[i] = new Circle(5,i*50);
    
    if(i==selectedcirc1 || i==selectedcirc2){
      circles[i].setcolor(activecol);
    } else if(i == 0) {
      circles[i].setcolor(middle);
    } else {
      circles[i].setcolor(#D8D7DB);
    }
  }
}

void reset(){
  lines.removeAll(lines);
  selectedcirc1 = int(random(1,  3));
  selectedcirc2 = int(random(3,  6));
  r = int(random(0, 256));
  g = int(random(0, 256));
  b = int(random(0, 256));
  activecol = color(r, g, b);
  middle = color(255-r, 255-g, 255-b);
  backgroundcol = color(255-r, 255-g, 255-b);
  
  for(int i = 0; i < circles.length; i++){
    circles[i] = new Circle(5,i*50);
    
    if(i==selectedcirc1 || i==selectedcirc2){
      circles[i].setcolor(activecol);
    } else if(i == 0) {
      circles[i].setcolor(middle);
    } else {
      circles[i].setcolor(#D8D7DB);
    }
  }
  
}

void draw ()
{ 
  background(backgroundcol); 
  
  int[] circ1vals1 = circles[selectedcirc1].getval();
  int[] circ1vals2 = circles[selectedcirc2].getval();
  
  color curcol = circles[selectedcirc1].getcolor();
  
  lines.add(new Lineobj(circ1vals1[0], circ1vals1[1], circ1vals2[0], circ1vals2[1], curcol));
  
  for(int i = 0; i < lines.size(); i++){
    lines.get(i).update();
  }
  
  for(int i = 0; i < circles.length; i++){
    circles[i].update();
  }
  
  count++;
  
  if(count > 400){
    reset();
    count = 0;
  }
}
