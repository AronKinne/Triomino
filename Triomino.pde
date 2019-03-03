final int size = 150;
final float r = sqrt(3) / 6 * size;

Tile t;

void setup() {
  size(1600, 900);
  
  t = new Tile(3, 0, 3);
}

void draw() {
  background(255);
  
  t.draw();
}

void mousePressed() {
  if(mouseButton == RIGHT) t.rotateRight();
  else if(mouseButton == LEFT) t.rotateLeft();
}
