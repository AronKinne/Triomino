Tile t;

void setup() {
  size(1600, 900);
  
  t = new Tile(1, 2, 3);
}

void draw() {
  background(255);
  
  t.draw();
}
