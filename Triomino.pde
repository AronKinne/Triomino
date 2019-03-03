final int size = 150;
final float r = sqrt(3) / 6 * size;
final float h = 3 * r;

Grid grid;
Tile current;

void setup() {
  size(1600, 900);

  grid = new Grid();
  current = new Tile(1, 2, 3);
  current.attachToMouse();
}

void draw() {
  background(255);

  grid.draw();
  if (current != null) current.draw();
}

void newTile() {
  current = new Tile(floor(random(6)), floor(random(6)), floor(random(6)));
  current.attachToMouse();
}

void mousePressed() {
  if (mouseButton == LEFT && current != null) {
    if (grid.addTile(current, mouseX, mouseY)) {
      newTile();
    }
  } else println(grid.getCoords(mouseX, mouseY));
}

void keyPressed() {
  if (current != null) {
    if (keyCode == LEFT) current.rotateLeft(); 
    else if (keyCode == RIGHT) current.rotateRight();
  }
  if(key == ' ') newTile();
}
