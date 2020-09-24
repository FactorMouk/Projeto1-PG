float gravity = 0.5;
float initialVelocityX = 10;
float initialVelocityY = 10;
float ballDiameter = 30;
Floor floor;
Ball ball;

void setup() {
  size(860, 640);
  frameRate(41.5);
  floor = new Floor(0, 320);
  ball = new Ball(floor.getX(), floor.getY(), initialVelocityX, initialVelocityY, ballDiameter);
}

void draw() {
    background(0); 
    floor.display();
    ball.display();
    ball.move();
    ball.colide(floor);
}

class Ball {
  float x, y;
  float xvInitial;
  float xvCurrent;
  float yvInitial;
  float yvCurrent;
  float diameter;

   
  Ball(float _x, float _y, float _xv, float _yv, float _diameter) {
    x = _x + (_diameter / 2);
    y = _y - (_diameter / 2);
    xvInitial = _xv;
    xvCurrent = xvInitial;
    yvInitial = -_yv;
    yvCurrent = yvInitial;
    diameter = _diameter;
  } 
 
  void move() {
     x = x + xvCurrent;
     y = y + yvCurrent;
     yvCurrent = yvCurrent + gravity;
  }
  
  void colide(Floor floor) {
    if(y == floor.getY() - (diameter / 2)){
      yvCurrent = yvInitial;
    }
    if(x == width - (diameter / 2) || x == 0 + (diameter / 2)) {
      xvCurrent = -xvCurrent;
    }
  }
   
  void display() {
    fill(0, 0, 255);
    ellipse(x, y, diameter, diameter);
  }
}

class Floor {
  float x;
  float y;
  
  Floor(float _x, float _y) {
    x = _x;
    y = _y;
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  void display() {
    fill(255, 0, 0);
    rect(x, y, 860, 320);
  }
}
