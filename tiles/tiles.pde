Tile[][] tiles = new Tile[43][76];
color startingcolor = color(random(0, 256), random(0, 256), random(0, 256));
ArrayList<Tile> changed = new ArrayList<Tile>();
int startingx;
int startingy;

void setup() {
  size(431, 761, P2D);
  orientation(LANDSCAPE);
  
  print("started");
  
  for(int i = 0; i < 43; i++){
    for(int j = 0; j < 76; j++){
      tiles[i][j] = new Tile(i, j);
    }
  }
  
  startingx = int(random(0, 43));
  startingy = int(random(0, 76));
  tiles[startingx][startingy].setcolor(startingcolor);
  changed.add(tiles[startingx][startingy]);
  print(changed);
  
} 


void draw () {
  
  colorMode(RGB);
  background(0, 0, 0);
  /*
  for(int i = 0; i < 43; i++){
    for(int j = 0; j < 76; j++){
      if(tiles[i][j].getcolor() == startingcolor && !changed.contains(tiles[i][j])){
        changed.add(tiles[i][j]);
      }
    }
  }*/
  
  for(int a = 0; a < changed.size(); a++){
    int[] vals = changed.get(a).getval();
    if(vals[0]+1<43){
      tiles[vals[0]+1][vals[1]].setcolor(changed.get(a).getcolor());
      changed.add(tiles[vals[0]+1][vals[1]]);
      if(vals[1]+1<76){
        tiles[vals[0]+1][vals[1]+1].setcolor(changed.get(a).getcolor());
        changed.add(tiles[vals[0]+1][vals[1]+1]);
      }
      if(vals[1]-1>(-1)){
        tiles[vals[0]+1][vals[1]-1].setcolor(changed.get(a).getcolor());
        changed.add(tiles[vals[0]+1][vals[1]-1]);
      }
    }
    if(vals[0]-1>(-1)){
      tiles[vals[0]-1][vals[1]].setcolor(changed.get(a).getcolor());
      changed.add(tiles[vals[0]-1][vals[1]]);
      if(vals[1]+1<76){
        tiles[vals[0]-1][vals[1]+1].setcolor(changed.get(a).getcolor());
        changed.add(tiles[vals[0]-1][vals[1]+1]);
      }
      if(vals[1]-1>(-1)){
        tiles[vals[0]-1][vals[1]-1].setcolor(changed.get(a).getcolor());
        changed.add(tiles[vals[0]-1][vals[1]-1]);
      }
    }
    if(vals[1]+1<76){
      tiles[vals[0]][vals[1]+1].setcolor(changed.get(a).getcolor());
      changed.add(tiles[vals[0]][vals[1]+1]);
    }
    if(vals[1]-1>(-1)){
      tiles[vals[0]][vals[1]-1].setcolor(changed.get(a).getcolor());
      changed.add(tiles[vals[0]][vals[1]-1]);
    }
    
    changed.remove(a);

  }
  
  for(int ii = 0; ii < 43; ii++){
    for(int jj = 0; jj < 76; jj++){
      tiles[ii][jj].update();
      
    }
  }
}
