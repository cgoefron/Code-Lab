int barWidth = 30;
int lastBar = -3;
float y = 0;
int x = 0;

void setup() {
  size (1000, 600);
  background(0);
  pixelDensity(2);
}

void resetFill() {
  fill(0, 0, 0, 0);
}

void blackLines () {
  stroke(0, 0, 0);
  line(0, y, width, y);
  resetFill();
}

void blackEllipse (int x, float y) {
  fill(0, 0, 0, 100);  
  stroke(mouseY);
  strokeWeight(1);
  ellipse(x, y, y, y); 
  resetFill();
}

void draw() {
  x = x + 1;


  blackEllipse(x, y);
//for (int x = 1; x > width; x-=width) { //x =  width-x
  noStroke();
  fill (0, x, 0, 50);
  if (x > 1000) {
x = 0;
y = random(600); }
  println("x = " + x + " y = " + y );
    println("width = " + width);

//}

  int whichBar = mouseX / barWidth;
  if (whichBar != lastBar) {
    int barX = whichBar * barWidth;
    fill(barX, 100, mouseY, 100);
    rect(barX, 0, barWidth, height);
    lastBar = whichBar;

    blackLines ();  
    fill(0, 0, 0, 25);
    y++;
    if (y > height) {
      y = 0;
    }
  }
}