float niseMax = 1.5;
float offset = 0.01;
void setup() {
  size(600, 600);
  strokeWeight(1);
  noFill();
}
void draw() {
  background(0);
  stroke(0,255,0);
  translate(width/2, height/2-40);
  for (int i=1; i<6; i++) {
    noise_shape(map(i, 0, 5, 0, offset));
  }
  offset +=0.02;
  //saveFrame("f/###.tif");
}
void noise_shape(float z_offset) {
  rotate(PI);
  beginShape();
  //right side
  for (float i=0; i<TWO_PI; i+=0.05) {
    float x_offset = map(cos(i), -1, 1, 0, niseMax);
    float y_offset = map(sin(i), -1, 1, 0, niseMax);
    float r = map(noise(x_offset, y_offset, z_offset), 0, 1, 10, 20);

    float x = -16*pow(sin(i), 2) * r;
    float y = (13*cos(i) - 5*cos(2*i) - 2*cos(3*i) - cos(4*i))*r;

    vertex(x, y);
  }
  endShape(CLOSE);
  beginShape();
  //  left side
  for (float i=0; i<TWO_PI; i+=0.05) {
    float x_offset = map(cos(i), -1, 1, 0, niseMax);
    float y_offset = map(sin(i), -1, 1, 0, niseMax);
    float r = map(noise(x_offset, y_offset, z_offset), 0, 1, 10, 20);

    float x = 16*pow(sin(i), 2) * r;
    float y = (13*cos(i) - 5*cos(2*i) - 2*cos(3*i) - cos(4*i))*r;

    vertex(x, y);
  }
  endShape(CLOSE);
  rotate(PI);
}
