float armVelocity = PI/6;
float foreArmVelocity = 2*armVelocity;
int armFactor = 2;
int foreArmFactor = 3;
int uc = 20;
int jointsDiameter = 15;
Arm arm;

void setup() {
  size(860, 640);
  arm = new Arm(
    width / 2, 
    height / 2, 
    width / 2, 
    (height / 2) + armFactor*uc, 
    width / 2, 
    (height / 2) + armFactor*uc + foreArmFactor*uc, 
    jointsDiameter
  );
}

void draw() {
  background(37, 115, 153);
  arm.display();
  arm.move();
}

class Arm {
  float shoulderPointInitialX, shoulderPointInitialY, shoulderPointCurrentX, shoulderPointCurrentY;
  float elbowPointInitialX, elbowPointInitialY, elbowPointCurrentX, elbowPointCurrentY;
  float handPointInitialX, handPointInitialY, handPointCurrentX, handPointCurrentY;
  int jointsDiameters;
  float armSize;
  float foreArmSize;
  float armAngle = radians(0);
  float foreArmAngle = radians(0);
  
  Arm(float _sPX, float _sPY, float _ePX, float _ePY, float _hPX, float _hPY, int _jointsDiameters) {
    jointsDiameters = _jointsDiameters;
    shoulderPointInitialX = _sPX;
    shoulderPointInitialY = _sPY;
    shoulderPointCurrentX = shoulderPointInitialX;
    shoulderPointCurrentY = shoulderPointInitialY;
    elbowPointInitialX = _ePX;
    elbowPointInitialY = _ePY;
    elbowPointCurrentX = elbowPointInitialX;
    elbowPointCurrentY = elbowPointInitialY + jointsDiameters/2;
    handPointInitialX = _hPX;
    handPointInitialY = _hPY;
    handPointCurrentX = handPointInitialX;
    handPointCurrentY = handPointInitialY + jointsDiameters/2;
    armSize = elbowPointCurrentY - shoulderPointCurrentY;
    foreArmSize = handPointCurrentY - elbowPointCurrentY;
  }
  
  void move() {
    armAngle += radians(armVelocity);
    foreArmAngle += radians(foreArmVelocity);
    if(degrees(foreArmAngle) >= degrees(PI/2)) {
          stop();
    }
    elbowPointCurrentX = shoulderPointCurrentX + sin(armAngle) * armSize;
    elbowPointCurrentY = shoulderPointCurrentY + cos(armAngle) * armSize;
    handPointCurrentX = elbowPointCurrentX + sin(foreArmAngle) * foreArmSize;
    handPointCurrentY = elbowPointCurrentY + cos(foreArmAngle) * foreArmSize;
  }
  
  void display() {
    fill(255,255,255);
    ellipse(shoulderPointInitialX, shoulderPointInitialY, jointsDiameters, jointsDiameters);
    strokeWeight(2);  // Default
    line(shoulderPointCurrentX, shoulderPointCurrentY, elbowPointCurrentX, elbowPointCurrentY);
    fill(255,255,255);
    ellipse(elbowPointCurrentX, elbowPointCurrentY, jointsDiameters, jointsDiameters);
    strokeWeight(2);  // Default
    line(elbowPointCurrentX, elbowPointCurrentY, handPointCurrentX, handPointCurrentY);
    fill(255,255,255);
    ellipse(handPointCurrentX, handPointCurrentY, jointsDiameters, jointsDiameters);
  }
  
}
