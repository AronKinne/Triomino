// http://www-cs-students.stanford.edu/~amitp/game-programming/grids/

class Triangle {

  PVector pos;
  int x, y;
  boolean left;
  PShape shape;

  Triangle(int x, int y, boolean left, PVector pos) {
    this.x = x;
    this.y = y;
    this.left = left;
    this.pos = pos;

    shape = createShape();
    generateShape();
  }

  void generateShape() {
    shape.beginShape();
    shape.fill(255);
    shape.stroke(0);
    shape.strokeWeight(1);
    shape.vertex(-size * .5, r);
    shape.vertex(size * .5, r);
    shape.vertex(0, -2 * r);
    shape.endShape(CLOSE);
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    if (!left) rotate(radians(60));
    shape(shape, 0, 0);
    popMatrix();
  }
}
