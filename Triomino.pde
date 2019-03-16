final int size = 100;
final float r = sqrt(3) / 6 * size;
final float h = 3 * r;
boolean debug = false;

Grid grid;
Tile current;

void setup() {
  size(1600, 900);

  grid = new Grid();
  newTile();
}

void draw() {
  background(255);
  
  if(debug) {
    grid.drawDebug(); 
  }

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
  } else if(mouseButton == RIGHT) {
    newTile();
  }
}

void mouseWheel(MouseEvent e) {
  if(e.getCount() > 0) {
    current.rotateRight();
  } else if(e.getCount() < 0) {
    current.rotateLeft();
  }
}

void keyPressed() {
  if (current != null) {
    if (keyCode == LEFT) current.rotateLeft(); 
    else if (keyCode == RIGHT) current.rotateRight();
  }
  if(key == ' ') newTile();
  if(key == 'd') debug = !debug;
}
