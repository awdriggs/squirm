class Bark {
  //params
  int size;
  ArrayList<PVector> points;// = new ArrayList<PVector>();
  int perlinSeed; //so noise is unique for each shell
  float diameter;
  float zoff = random(1);
  //constructor
  Bark(int s){
    size = s;
    /* perlinSeed = (int) random(0, Integer.MAX_VALUE); //produce the greatest possible diversity of seeds */
    /* diameter = random(0, width/2); */
    diameter = 300; 
     
    update(); //draw that first layer
  }

  //functions
  void update(){
    noiseSeed(perlinSeed); //need to update for each new layer. a class param
    points = new ArrayList<PVector>(); //clear old points.
    float theta = TWO_PI / numPoints; //amount of each turn

    for(int i = 0; i < size; i++){

      float angle = theta * i; //move around the circle

      PVector v = new PVector();

      float xoff = map(cos(angle), -1, 1, 0, 1);
      float yoff = map(sin(angle), -1, 1, 0, 1);

      float r = map(noise(xoff, yoff, zoff), 0, 1, diameter/4, diameter);

      float x = r * cos(angle);
      float y = r * sin(angle);

      v.x = x;
      v.y = y;
      v.add(origin);
      points.add(v);
      /* println(v); */
    }
    
  }

  void display(){
    noFill();
    beginShape();

    for(PVector p : points){
      vertex(p.x, p.y); //adds a vertex for each point
    }

    endShape(CLOSE);
  }
}
