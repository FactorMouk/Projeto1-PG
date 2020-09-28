float bigCircleFactor = 100;
float smallCircleFactor = 25;
BigCircle bigCircle;
SmallCircle smallCircle;

void setup() {
  size(860, 480);
  bigCircle = new BigCircle(bigCircleFactor * 4);
  smallCircle = new SmallCircle(smallCircleFactor * 4, bigCircle.getDiameter());
}

void draw() {
  bigCircle.display();
  smallCircle.display();
  smallCircle.move();
}

class BigCircle {
  float diameter;
  
   BigCircle(float _diameter) {
     diameter = _diameter;
   }
   
   float getDiameter() {
     return diameter;
   }
   
   void display() {
     background(126,160,125);
     stroke(0,0,255);
     noFill();
     ellipse(width/2, height/2, diameter, diameter);
   }
  
}

class SmallCircle {
  float diameter;
  float bigCircleDiameter;
  float [] coordinates;
  float [] dotCoordinates;
  float angleCircle = 0;
  float angleDot = 0;
  
  SmallCircle(float _diameter, float _bigCircleDiameter) {
     diameter = _diameter;
     bigCircleDiameter = _bigCircleDiameter;
     coordinates = new float[2];
     coordinates[0] = width/2;
     coordinates[1] = ((height - bigCircleDiameter) / 2) + diameter/2;
     dotCoordinates = new float[2];
     dotCoordinates[0] = width/2;
     dotCoordinates[1] = ((height - bigCircleDiameter) / 2);
  }
  
  void move() {
    angleCircle += 0.025;
    angleDot += 0.100;
    coordinates[0] = width/2 - cos(angleCircle) * (bigCircleDiameter/2 - diameter/2);
    coordinates[1] = height/2 + sin(angleCircle) * (bigCircleDiameter/2 - diameter/2);
    dotCoordinates[0] = coordinates[0] - cos(angleDot + 0.08) * diameter/2;
    dotCoordinates[1] = coordinates[1] + sin(angleDot + 0.08) * diameter/2;
  }
  
  void display() {
    stroke(0,0,255);
    noFill();
    ellipse(coordinates[0], coordinates[1] , diameter, diameter);
    fill(255,0,0);
    ellipse(dotCoordinates[0], dotCoordinates[1], 10, 10);
  }
  
}
