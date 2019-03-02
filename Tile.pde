class Tile {
  
  PVector pos;   // on screen
  boolean upside;
  int[] values;
  float size;
  PShape shape;
  
  Tile(int v1, int v2, int v3) {
    pos = new PVector(500, 500);
    upside = true;
    
    values = new int[3];
    values[0] = v1;
    values[1] = v2;
    values[2] = v3;
    
    size = 200;
    
    shape = createShape();
    generateShape();
  }
  
  void generateShape() {
    float r = sqrt(3) / 6 * size;
    
    
    shape.beginShape();
    shape.fill(255);
    shape.stroke(0);
    shape.vertex(-size * .5, r);
    shape.vertex(size * .5, r);
    shape.vertex(0, -2 * r);
    shape.endShape(CLOSE);
  }
  
  void draw() {
    shape(shape, pos.x, pos.y);
    point(pos.x, pos.y);
  }
  
}
