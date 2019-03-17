class Triangle {

  PVector pos;
  int x, y;
  boolean upside;
  color strokeCol;
  PShape shape;
  
  Triangle(int x, int y, boolean upside) {
    this.x = x;
    this.y = y;
    this.upside = upside;
    
    if (upside) {
      pos = new PVector(x * size + size * .5 * (y % 2 + 1), y * h + 2 * r);
    } else {
      pos = new PVector(x * size + size * .5 * (y % 2), y * h + r);
    }
    
    setStrokeCol(0, 0, 0);
  }

  Triangle(PVector pos, boolean upside) {
    this.upside = upside;
    this.pos = pos;
    
    setStrokeCol(0, 0, 0);
  }
  
  void setStrokeCol(int r, int g, int b) {
    strokeCol = color(r, g, b);
    generateShape();
  }

  boolean isPointIn(float px, float py) {
    float x1 = pos.x - size * .5;
    float x2 = pos.x + size * .5;
    float x3 = pos.x;
    float y1, y2, y3;
    if (upside) {
      y1 = pos.y + r;
      y2 = pos.y + r;
      y3 = pos.y - 2 * r;
    } else {
      y1 = pos.y - r;
      y2 = pos.y - r;
      y3 = pos.y + 2 * r;
    }
    
    // get the area of the triangle
    float areaOrig = abs((x2 - x1) * (y3 - y1) - (x3 - x1) * (y2 - y1));

    // get the area of 3 triangles made between the point
    // and the corners of the triangle
    float area1 = abs((x1 - px) * (y2 - py) - (x2 - px) * (y1 - py));
    float area2 = abs((x2 - px) * (y3 - py) - (x3 - px) * (y2 - py));
    float area3 = abs((x3 - px) * (y1 - py) - (x1 - px) * (y3 - py));

    // if the sum of the three areas equals the original,
    // we're inside the triangle!
    return area1 + area2 + area3 == areaOrig;
  }

  void generateShape() {
    shape = createShape();
    shape.beginShape();
    shape.fill(255);
    shape.stroke(strokeCol);
    shape.strokeWeight(1);
    shape.vertex(-size * .5, r);
    shape.vertex(size * .5, r);
    shape.vertex(0, -2 * r);
    shape.endShape(CLOSE);
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    if (!upside) rotate(PI / 3);
    shape(shape, 0, 0);
    popMatrix();
  }
}
