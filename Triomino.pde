final int size = 150;
final float r = sqrt(3) / 6 * size;
final float h = 3 * r;

Grid grid;
Tile t1, t2;

void setup() {
  size(1600, 900);
  
  grid = new Grid();
  t1 = new Tile(1, 3, 5, true);
  t2 = new Tile(0, 2, 4, false);
}

void draw() {
  background(255);
  
  grid.draw();
  //t1.draw();
  //t2.draw();
}

void mousePressed() {
  //if(mouseButton == RIGHT) t.rotateRight();
  //else if(mouseButton == LEFT) t.rotateupside();
}
