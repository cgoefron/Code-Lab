// Setup starting positions and variable values
float startX = 50;
float startY = 400;
float startOffsetX = 11;
float startOffsetY = 7;
//float curOffsetX = 10;
//float curOffsetY = 6;

// Create global location for sun and moon
float moonX = startX; 
float moonY = startY;
float sunX = startX;
float sunY = startY;
float curOffsetMoonX = startOffsetX;
float curOffsetMoonY = startOffsetY;
float curOffsetSunX = startOffsetX;
float curOffsetSunY = startOffsetY;

float acceleration=.99;



void setup () {
  size(1000, 600);
  background(0);
  colorMode(HSB, 360, 100, 100);
  println("Debug Started");
}

void drawMoon() {
  fill(200, 0, 100, 100);
  ellipse(moonX+50, moonY-5, 300, 300);
  //println(moonX);
}

void drawSun() {
  fill(50, 50, 100);
  ellipse(sunX+50, sunY-5, 300, 300);
}

void draw() {
  background(moonX*.3, moonX*.1, 20);
  if (moonX<width+100) {
    drawMoon();
    moonX= moveMoonX(moonX, curOffsetMoonX);
    moonY= moveMoonY(moonY, curOffsetMoonY);
    curOffsetMoonX=calAccel(curOffsetMoonX);
    curOffsetMoonY=calAccel(curOffsetMoonY);
    //println("Offset of x =" + curOffsetMoonX + " and y =" + curOffsetMoonY);
  } else {
      background(sunX*.22, sunX*.1, 150);
    drawSun();
    sunX = moveSunX(sunX, curOffsetSunX);
    sunY= moveSunY(sunY, curOffsetSunY);
    curOffsetSunX=calAccel(curOffsetSunX);
    curOffsetSunY=calAccel(curOffsetSunY);
    //println("Offset of x =" + curOffsetSunX + " and y =" + curOffsetSunY);
  }
  if (sunX>width+100) {
    resetScene();
  }

  //grass ground
  fill(125, 70, 30);
  rect(0, height/2, width, height/2);
}
void resetScene() {
  moonX = startX; 
  moonY = startY;
  sunX = startX;
  sunY = startY;
  curOffsetMoonX = startOffsetX;
  curOffsetMoonY = startOffsetY;
  curOffsetSunX = startOffsetX;
  curOffsetSunY = startOffsetY;
}


float moveMoonX(float curX, float offsetX) {
  return curX+offsetX;
}

float moveMoonY(float curY, float offsetY) {
  float yPosition=0;
  if (moonX>width*.6) {
    yPosition = curY+offsetY;
  } else {
    yPosition = curY-offsetY;
  }
  return yPosition;
}

float moveSunX(float curX, float offsetX) {
  return curX+offsetX;
}

float moveSunY(float curY, float offsetY) {
  float yPosition=0;
  if (sunX>width*.6) {
    yPosition = curY+offsetY;
  } else {
    yPosition = curY-offsetY;
  }
  return yPosition;
}

float calAccel(float speed) {
  return speed*acceleration;
}