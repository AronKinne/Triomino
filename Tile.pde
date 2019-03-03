class Tile extends Triangle{

  int[] values;
  int angle;

  Tile(int v1, int v2, int v3, boolean upside) {
    super(0, 0, upside);
    
    angle = 0;

    values = new int[3];
    values[0] = v1;
    values[1] = v2;
    values[2] = v3;
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    if (!upside) rotate(PI / 3);
    shape(shape, 0, 0);

    stroke(255, 0, 0);
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

  void rotateupside() {
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
