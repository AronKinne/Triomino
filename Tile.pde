class Tile extends Triangle{

  int[] values;
  int angle;
  boolean attToMouse;

  Tile(int v1, int v2, int v3) {
    this(0, 0, v1, v2, v3, 0, false);
  }
  
  Tile(int x, int y, int v1, int v2, int v3, int angle, boolean upside) {
    super(x, y, upside);
    
    values = new int[3];
    values[0] = v1;
    values[1] = v2;
    values[2] = v3;
    
    this.angle = angle;
    attToMouse = false;
  }

  void draw() {
    if(attToMouse) pos = new PVector(mouseX, mouseY);
    
    pushMatrix();
    translate(pos.x, pos.y);
    if (!upside) rotate(PI / 3);
    shape(shape, 0, 0);

    stroke(0, 0, 0);
    strokeWeight(size / 15);
    for (int i = 0; i < 3; i++) {
      int a = i == 1 ? 150 : 30;
      float rot = i == 0 ? 0 : (i == 1 ? -radians(120) : radians(120));
      int v = values[i];

      translate(i == 0 ? 0 : r * cos(radians(a)), i == 0 ? -r : r * sin(radians(a)));
      rotate(rot);
      if (v >= 1) point(0, -r / 3 * 2);
      if (v == 3 || v == 2) point(0, -r / 3);
      if (v == 3 || v == 4) point(0, 0);
      if (v >= 4) point(size / 20, -r / 3);
      if (v >= 4) point(-size / 20, -r / 3);
      if (v == 5) point(size / 10, 0);
      if (v == 5) point(-size / 10, 0);
      rotate(-rot);
      translate(i == 0 ? 0 : -r * cos(radians(a)), i == 0 ? r : -r * sin(radians(a)));
    }

    popMatrix();
  }
  
  Tile copy(int x, int y, boolean rotate) {
    if(rotate) rotateRight();
    return new Tile(x, y, values[0], values[1], values[2], angle, upside);
  }
  
  void attachToMouse() {
    attToMouse = true;
  }
  
  void releaseFromMouse(PVector pos) {
    attToMouse = false;
    this.pos = pos.copy();
  }

  void rotateRight() {
    angle = (angle + 1) % 6;

    if (!upside) {
      int v = values[0];
      values[0] = values[1];
      values[1] = values[2];
      values[2] = v;
    }

    upside = !upside;
  }

  void rotateLeft() {
    angle = (angle + 5) % 6;

    if (upside) {
      int v = values[2];
      values[2] = values[1];
      values[1] = values[0];
      values[0] = v;
    }

    upside = !upside;
  }
}
