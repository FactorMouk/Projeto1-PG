float startXPoint = -20;
float startYPoint = 0;
XYPlan xyPlan;
Spiral spiral;

void setup() {
  size(860, 640);
  float[] axis = new float[2];
  axis[0] = width/2;
  axis[1] = height/2;
  float[] center = {0 , 0};
  xyPlan = new XYPlan(axis);
  spiral = new Spiral(
    xyPlan.convertToPlan(center[0], center[1]), 
    xyPlan.convertToPlan(startXPoint, startYPoint)
  );
}

void draw() {
  xyPlan.display();
  spiral.display();
  spiral.moveParticle();
}

class XYPlan {
  float[] axis;
  
   XYPlan(float[] _axis) {
     axis = _axis;
   }
   
   float[] convertToPlan(float xPoint, float yPoint) {
     float[] coordinates = {xPoint, yPoint};
     coordinates[0] += axis[0];
     coordinates[1] += axis[1];
     return coordinates;
   }
   
   void display() {
     stroke(0, 255, 0);
     strokeWeight(2);
     line(0, axis[1], width, axis[1]);
     stroke(0, 0, 255);
     strokeWeight(2);
     line(axis[0], 0, axis[0], height);
   }
  
}

class Spiral {
  float[] center;
  float[] initialParticlePosition;
  float[] particlePosition = new float[2];
  float angle =  degrees(0);
  float r = 20;
  boolean sinalSin;
  
   Spiral(float[] _center, float[] _initialParticlePosition) {
     center = _center;
     initialParticlePosition = _initialParticlePosition;
     particlePosition[0] = _initialParticlePosition[0];
     particlePosition[1] = _initialParticlePosition[1];
     defineSinalSin();
   }
   
   boolean defineSinalSin() {
     boolean currentSinalSin = sinalSin;
     if(sin(angle) >= 0) {
       sinalSin = true;
     }else {
       sinalSin = false;
     }
     if(currentSinalSin != sinalSin) {
       return true;
     }
     return false;
   }
   
   void moveParticle() {
     angle += 0.012;
     particlePosition[0] = center[0] - cos(angle) * r;
     particlePosition[1] = center[1] + sin(angle) * r;
     if(defineSinalSin()) {
       r = 2*r;
       center[0] = initialParticlePosition[0];
       center[1] = initialParticlePosition[1];
       initialParticlePosition[0] = particlePosition[0];
       initialParticlePosition[1] = particlePosition[1];
     }
   }
   
   void display() {
     fill(0, 0, 255);
     ellipse(particlePosition[0], particlePosition[1], 10, 10);
   }
  
}
