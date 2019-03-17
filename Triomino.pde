import java.util.Collections;

final int size = 100;
final float r = sqrt(3) / 6 * size;
final float h = 3 * r;
boolean debug = false;

Grid grid;
ArrayList<Tile> tileset;
Tile current;

void setup() {
  size(1600, 900);

  grid = new Grid();
  
  tileset = new ArrayList<Tile>();
  for (int c = 0; c < 6; c++) {
    for(int b = c; b < 6; b++) {
      for(int a = b; a < 6; a++) {
        tileset.add(new Tile(a, b, c));
      }
    }  
  }
  Collections.shuffle(tileset);

  newTile();
}

void draw() {
  background(255);

  if (debug) {
    grid.drawDebug();
  }

  grid.draw();
  if (current != null) current.draw();
  
  textAlign(LEFT, TOP);
  textSize(20);
  fill(0);
  text(tileset.size(), 20, 20);
}

void newTile() {
  if (tileset.size() > 0) {
    current = tileset.get(0);
    tileset.remove(0);
    current.attachToMouse();
  } else {
    current = null; 
  }
}

void mousePressed() {
  if (mouseButton == LEFT && current != null) {
    if (grid.addTile(current, mouseX, mouseY)) {
      newTile();
    } else {
      grid.moveTile(mouseX, mouseY);
    }
  } else if (mouseButton == RIGHT) {
    tileset.add(current);
    newTile();
    //println(grid.getTile(grid.getCoords(mouseX, mouseY)), grid.getCoords(mouseX, mouseY));
  }
}

void mouseWheel(MouseEvent e) {
  if (e.getCount() > 0) {
    current.rotateRight();
  } else if (e.getCount() < 0) {
    current.rotateLeft();
  }
}

void keyPressed() {
  if (current != null) {
    if (keyCode == LEFT) current.rotateLeft(); 
    else if (keyCode == RIGHT) current.rotateRight();
  }
  if (key == ' ') {
    tileset.add(current);
    newTile();
  }
  if (key == 'd') debug = !debug;
}
