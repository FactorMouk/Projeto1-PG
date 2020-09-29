float [] bigCircleCenter;
float [] smallCirclePlanCenter;
float smallCircleRotateAngle = 0;
float smallCirclePlanRotateAngle = 0;
float [] dotCoordinates;
float dotRotateAngle = 0;

void settings() {
  System.setProperty("jogl.disable.openglcore", "true"); //Coloquei assim pq por algum motivo botar no setup n tava funfando no meu pc (erro de OpenGL). Se rolar erro na correção, favor passar apenas o size pro setup e apagar esta linha. Grato.
  size(400, 400, P3D);
}

void setup() {
  lights();
  ortho();
  bigCircleCenter = new float[2];
  bigCircleCenter[0] = 50;
  bigCircleCenter[1] = -50;
  smallCirclePlanCenter = new float[2];
  smallCirclePlanCenter[0] = 100;
  smallCirclePlanCenter[1] = -50;
  dotCoordinates = new float[2];
}

void draw() {
  background(255, 255, 255);
  translate(width/2, height/2, 0);
  rotateX(radians(30));
  rotateY(radians(45));
  pushMatrix();
  stroke(255, 0, 0); //red = x
  line(0, 0, 0, 10000, 0, 0);
  stroke(0, 255, 0); //green = y
  line(0, 0, 0, 0, -10000, 0);
  stroke(0, 0, 255); //blue = z
  line(0, 0, 0, 0, 0, 10000);
  popMatrix();
  pushMatrix();
  rotateX(radians(300));
  stroke(0);
  noFill();
  square(0, -100, 100);
  ellipse(bigCircleCenter[0], bigCircleCenter[1], 100, 100);
  pushMatrix();
  smallCircleRotateAngle += 0.040;
  smallCirclePlanRotateAngle += 0.040;
  dotRotateAngle += 0.16;
  translate(smallCirclePlanCenter[0], smallCirclePlanCenter[1], 0);
  smallCirclePlanCenter[0] = bigCircleCenter[0] + sin(smallCirclePlanRotateAngle)*50;
  smallCirclePlanCenter[1] = bigCircleCenter[1] - cos(smallCirclePlanRotateAngle)*50;
  fill(255, 255, 255);
  dotCoordinates[0] = sin(dotRotateAngle)*12.5;
  dotCoordinates[1] = -12.5 -cos(dotRotateAngle)*12.5;
  rotateX(radians(90));
  rotateY(smallCircleRotateAngle);
  ellipse(0, -12.5, 25, 25);
  fill(255, 0, 0);
  ellipse(dotCoordinates[0], dotCoordinates[1], 5, 5);
  popMatrix();
  popMatrix();
}
