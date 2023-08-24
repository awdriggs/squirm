//sketch variables
let numPoints = 360;
let numLayers = 10;
let circSize = 300;

let origin; //will be vector
let layers = []; //empty array
let single;

function setup() {
  console.log("working bro");
  createCanvas(windowWidth - 1, windowHeight - 86); //for bottom menu bar
  origin = createVector(width/2, height/2);

  // single = new Bark(numPoints, circSize);
  // noLoop();
   
  for(let i = 0; i < numLayers; i++){
    layers.push(new Bark(numPoints, circSize));
  }
}

function draw() {
  background(255);
  // single.update();
  // single.display();
  for(let l of layers){
    l.update();
    l.display();
    l.zoff += 0.01;
  }
   
   
}

// OBJECTS
//bark constructor
let Bark = function(s,d) {
  this.size = s;
  this.diameter = d;
  this.points;
  // let perlinSeed = random(1
  this.zoff = random(1);
}

Bark.prototype.update = function() {
  // console.log(this.size);
  this.points = [];

  let theta = TWO_PI / this.size;
  for(let i = 0; i < this.size; i++){
    let angle = theta * i;
    let xoff = map(cos(angle), -1, 1, 0, 1);
    let yoff = map(sin(angle), -1, 1, 0, 1);
    let r = map(noise(xoff, yoff, this.zoff), 0, 1, this.diameter/4, this.diameter);
    let x = r * cos(angle);
    let y = r * sin(angle);
    let v = createVector(x, y);

    v.add(origin); //global
    this.points.push(v);
  }
  // debugger; 
}

Bark.prototype.display = function() {
  noFill();
  beginShape();
  // console.log(this.points);
  for(let p of this.points){
    // debugger;
    vertex(p.x, p.y); //adds a vertex for each point
  }
  endShape(CLOSE);
  // fill(random(0, 255), random(0, 255), random(0, 255));
  // for(let p of this.points){
  //   console.log(p.x, p.y);
  //   ellipse(p.x, p.y, 20, 20);
  // }
}


