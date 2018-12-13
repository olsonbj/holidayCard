Snow[] flakes = new Snow[10000];
Light[] lights = new Light[60];
PImage photo;
int time;
int resetTime = 1000;

void setup() {
  size(800, 800);
  background(0);
  photo = loadImage("Desktop/hat.png");
  photo.resize(125, 125);
  for (int i=0; i<flakes.length; i++) {
    flakes[i] = new Snow(random(1, 20));
  }
  int tempX = 25;
  int tempY = 25;
  int tempColor = 1;
  for (int i = 0; i<60; i++)
  {
    lights[i]=(new Light(tempX, tempY, 40, tempColor));
    if (tempColor == 3) {
      tempColor = 1;
    } else {
      tempColor++;
    }
    if (i < 15) {
      tempX+=50;
    } else if (i < 30) {
      tempY+=50;
    } else if (i < 45) {
      tempX-=50;
    } else {
      tempY-=50;
    }
  }
  time = millis();
}

void draw() {
  background (0);
  textSize(52);
  text("Season's GRRReetings!", 125, 250); 
  fill(255, 255, 255);
  rect (0, 700, 800, 100);
  rect (0, 700, 800, 100);
  fill(235, 160, 70);
  ellipse(400, 600, 300, 100);
  ellipse(275, 550, 100, 100);
  rect(300, 600, 20, 100);
  rect(500, 600, 20, 100);
  rect(450, 600, 20, 100);
  rect(350, 600, 20, 100);
  rect(540, 600, 6, 85);
  fill(0);
  rect(480, 558, 8, 100);
  rect(450, 530, 8, 100);
  rect(420, 528, 8, 100);
  rect(390, 528, 8, 100);
  rect(370, 528, 8, 100);
  rect(350, 528, 8, 100);
  rect(330, 528, 8, 100);
  fill(0, 255, 0);
  ellipse(258, 550, 12, 12);
  ellipse(293, 550, 12, 12);
  
  for (int i=0; i<flakes.length; i++) { 
    flakes[i].display();
  }
  image(photo, 225, 410);
  int tempTime = millis() - time;
  if (tempTime > resetTime) {
    for (int i = 0; i < lights.length; i++) {
      lights[i].flash();
    }
    time = millis();
  }
  for (int i = 0; i < lights.length; i++) {
    lights[i].show();
  }
}

class Light {
  int x;
  int y;
  int size;
  int col;
  color c;

  Light(int x, int y, int size, int col) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.col = col;
    if (col == 1) {
      c = color(220, 0, 0);
    } else if (col == 2) {
      c = color(0, 220, 0);
    } else {
      c = color(0, 0, 220);
    }
  }

  void flash() {
    if (col == 1) {
      c = color(220, 0, 0);
      col++;
    } else if (col == 2) {
      c = color(0, 220, 0);
      col++;
    } else {
      c = color(0, 0, 220);
      col=1;
    }
  }

  void show() {
    fill(c);
    ellipse(x, y, size, size);
  }
}

class Snow {
  float x;
  float y;
  float fall;
  float diameter;

  Snow(float uhhh) {
    x = random(0, width+1000);
    y = random(-10000, 800);
    diameter = 8;
  }

  void display() {
    noStroke();
    fill(230);
    ellipse(x, y, 8, 8);
    y = y + 0.5;
  }
}
