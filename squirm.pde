int numPoints = 360;
int numLayers = 10; //5 to 10, not very interesting more than that.
/* float zoff = 0.0; */

PVector origin;
ArrayList<Bark> layers = new ArrayList<Bark>();

Bark single;

void setup(){
  size(600, 600);

  origin = new PVector(width/2, height/2);
  /* single = new Bark(numPoints); */

  for(int i = 0; i < numLayers; i++){
    layers.add(new Bark(numPoints));
  }
  /* noLoop(); */
}

void draw(){
  background(255);
  /* single.update(); */
  /* single.display(); */
  
  for(Bark b : layers){
    b.update();
    b.display();
    b.zoff += 0.01;
  }
}
 
void mousePressed(){
  /* redraw(); */
  noLoop();
}
