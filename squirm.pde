ArrayList<PVector> points = new ArrayList<PVector>();
int numPoints = 100;
PVector origin;
float zoff = 0.0;

void setup(){
  size(600, 600);

  origin = new PVector(width/2, height/2);

  float theta = TWO_PI / numPoints; //amount of each turn
  for(int i = 0; i < numPoints; i++){
    //points.add(new PVector(random(width), random(height)));
    float angle = theta * i;

    PVector v = new PVector();

    float xoff = map(cos(angle), -1, 1, 0, 1);
    float yoff = map(sin(angle), -1, 1, 0, 1);

    float r = map(noise(xoff, yoff, zoff), 0, 1, 100, 300);

    float x = r * cos(angle);
    float y = r * sin(angle);
    
    v.x = x;
    v.y = y;
    v.add(origin);
    points.add(v);
  }
}

void draw(){
  background(255);

  noFill();
  beginShape();

  for(PVector p : points){
    vertex(p.x, p.y); //adds a vertex for each point
  }

  endShape(CLOSE);
}
