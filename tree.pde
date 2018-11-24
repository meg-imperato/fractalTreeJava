// Java adaptation of Tree fractal, natural, animated by EnderPicturehttps://www.openprocessing.org/sketch/504377

/*var levels = 18;
var drawLevel;
var points;*/

int levels =18;
int drawLevel;
ArrayList<ArrayList<PVector[]>> points;


void setup() {
  fullScreen();
  background(255);
  frameRate(6);
  points= new ArrayList<ArrayList<PVector[]>>();
  for (int i=0; i<=levels; i++){
    points.add(new ArrayList<PVector[]>());
  }
  drawY(levels,0,new PVector(width/2,height/2));
  drawLevel=levels;
  /*
  createCanvas(windowWidth, windowHeight);
  background(255);
  
  points = [];
  
  frameRate(30);
  
  for (let i = 0; i <= levels; i++) {
    points.push([]);
  }
  
  drawY(levels,0,createVector(windowWidth/2,windowHeight));
  
  drawLevel = levels;
  */
}

void draw() {
  // go through the array and draw level\
  for (int c = 0; c < points.get(drawLevel).size(); c++) {
    PVector lastPos = points.get(drawLevel).get(c)[0];
    PVector currentPos = points.get(drawLevel).get(c)[1];
    strokeWeight(drawLevel);  
    stroke(map(drawLevel,0,levels,250,0));
    line(lastPos.x, lastPos.y, currentPos.x, currentPos.y);
  }
  // change level if not at end
  if (drawLevel > 0) 
    drawLevel--;
  /*
  // go through the array and draw level
  for (let c = 0; c < points[drawLevel].length; c++) {
    let lastPos = points[drawLevel][c].l;
    let currentPos = points[drawLevel][c].c;
    strokeWeight(drawLevel);  
    stroke(map(drawLevel,0,levels,250,0));
    line(lastPos.x, lastPos.y, currentPos.x, currentPos.y);
  }
  // change level if not at end
  if (drawLevel > 0) drawLevel--;
  */
}

void keyTyped() {
  
  if (key == ' ')
    setup();
 
}

void drawY(int level,float angle, PVector lastPos) {
  // base case
  if (level < 0) 
    return;
  
  // create vector, and add onto last location of branch
  PVector currentPos = new PVector(0,-level*5).rotate(angle).add(lastPos);
  
  // other base case, if branch is under ground
  if (currentPos.copy().sub(new PVector(mouseX,mouseY)).y > height) 
    return;
  
  // add the line start end location into the level's array
  PVector[] temp ={lastPos, currentPos};
  points.get(level).add(temp);
  
  // do branch if random lets it 
  if (parseInt(random(1+level*level/10)) != 0)
    drawY(level-1,angle-PI/random(4,8),currentPos);
  
  // do branch if random lets it 
  if (parseInt(random(1+level*level/10)) != 0)
    drawY(level-1,angle+PI/random(4,8),currentPos);
  /*
  // base case
  if (level < 0) return;
  
  // create vector, and add onto last location of branch
  let currentPos = createVector(0,-level*5).rotate(angle).add(lastPos);
  
  // other base case, if branch is under ground
  if (currentPos.copy().sub(createVector(mouseX,mouseY)).y > windowHeight) return;
  
  // add the line start end location into the level's array
  points[level].push({
    'l' : lastPos, 
    'c' : currentPos});
  
  // do branch if random lets it 
  if (parseInt(random(1+level*level/10)) != 0)
    drawY(level-1,angle-PI/random(4,8),currentPos);
  
  // do branch if random lets it 
  if (parseInt(random(1+level*level/10)) != 0)
    drawY(level-1,angle+PI/random(4,8),currentPos);
  */
}
