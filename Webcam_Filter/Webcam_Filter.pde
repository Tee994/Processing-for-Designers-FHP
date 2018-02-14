import processing.video.*;

Capture video;
int xpos = 0;
int ypos = 0;

void setup() {
  size (1280, 720);
  video = new Capture (this, 1280, 720);
  video.start();
}
void captureEvent (Capture video) {
  video.read();
}

void draw() {
  float deg = 180.0;
  float rad = radians (deg);

  background (#b43659);

  tint (253, 0, 244);
  image (video, 0, 0, 1280/2, 720/2);
  tint(0, 255, 240);
  image (video, 1280/2, 0, 1280/2, 720/2);

  pushMatrix();
  scale(-1.0, 1.0);
  image (video, -1280/2, 0, -1280/2, 720/2);
  popMatrix();

  rotate(rad); 
  tint(1, 103, 99);
  image (video, -1280/2, -720/2, -1280/2, -720/2);
  tint(#750071);
  image (video, -0, -720/2, -1280/2, -720/2);

  pushMatrix();
  scale(-1.0, 1.0);
  image (video, 0, -720/2, 1280/2, -720/2);
  popMatrix();


  float maxCol = 0;

  for (int i=0; i < width; i++) {
    for (int j=0; j < height; j++) {

      color c = video.get (i, j);

      if (brightness (c) > maxCol) {
        maxCol = brightness (c);
        xpos = i;
        ypos = j;
      }
    }

    image (video, 0, 0);
    fill(255, 0, 0);
    rect (xpos-2, ypos-2, 50, 50);
  }
}