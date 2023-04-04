class Planet {
  
  ArrayList<float[]> lines = new ArrayList<float[]>();

  int size;
  float xpos=0;
  float ypos=0;
  float zpos=0;
  float y;
  float r;
  float g;
  float b;
  float strokeweight;
  float orbitradius;
  float angle=0;
  float rcoldir=1;
  float gcoldir=1;
  float bcoldir=1;
  
  Planet(float r, float g,float b, int size, int orbitradius, float strokeweight){
    this.size = size;
    this.r = r;
    this.g = g;
    this.b = b;
    this.orbitradius = orbitradius;
    this.strokeweight = strokeweight;
        
  }
  
  public void update() {
    pushMatrix();
    colorMode(RGB);
   
    this.xpos=sin(angle)*orbitradius;
    this.ypos=sin(angle)*orbitradius+y;
    this.zpos=cos(angle)*orbitradius;
    float[] temp = {this.xpos,this.y,this.zpos,this.r, this.g, this.b};
    lines.add(temp);
    fill(color(int(this.r),int(this.g),int(this.b)));
    sphereDetail(30);
    noStroke();
    translate(this.xpos,this.y,this.zpos);
    sphere(this.size);
    popMatrix();
    
    if(lines.size() > 2){
      pushMatrix();
      noFill();
      
      strokeWeight(this.strokeweight);
      beginShape();
      for(int i=0; i<lines.size(); i++){
        stroke(color(lines.get(i)[3],lines.get(i)[4],lines.get(i)[5]));
        vertex(lines.get(i)[0],lines.get(i)[1],lines.get(i)[2]);
      }
      endShape();
      popMatrix();
    }
    if(this.r < 0){
      rcoldir=1;
    } else if(this.r>255){
      rcoldir=-1;
    }
    if(this.g < 0){
      gcoldir=1;
    } else if(this.g>255){
      gcoldir=-1;
    }
    if(this.b < 0){
      bcoldir=1;
    } else if(this.b>255){
      bcoldir=-1;
    }
    
    if(lines.size()>1500){
     lines.remove(0); 
    }
    this.r += 1*rcoldir;
    this.g += 1*gcoldir;
    this.b += 1*bcoldir;
    
    y-=3;
    angle+=.025;
    
  }   
}
