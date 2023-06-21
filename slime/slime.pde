//each layer calculates a new origin on each draw 
int numPoints = 360;
int numLayers = 1; //one layer, gets draw multiple times
/* float zoff = 0.0; */

PVector origin;
ArrayList<Bark> layers = new ArrayList<Bark>();

void setup(){
  size(600, 600);

  origin = new PVector(width/2, height/2); //first origin is the center

  for(int i = 0; i < numLayers; i++){
    layers.add(new Bark(numPoints, origin));
  }
}

void draw(){

  /* background(255); */
  if(frameCount < 20){ //draw 20 frames
    for(Bark b : layers){
      b.update(); //find new points, this also calcs a new center
      b.display();
      b.zoff += 0.05; //move through the noise
    }
  }
}

void mousePressed(){
  /* redraw(); */
  noLoop();
}
