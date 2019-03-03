// http://www-cs-students.stanford.edu/~amitp/game-programming/grids/

class Triangle {

  PVector pos;
  int x, y;
  boolean upside;
  PShape shape;

  Triangle(int x, int y, boolean upside) {
    this.x = x;
    this.y = y;
    this.upside = upside;
    
    if(upside) {
      pos = new PVector((x + 1) * size, (y + 0) * h + 2 * r);
    } else {
      pos = new PVector(x * size + size * .5, y * h + r); 
    }
    
    println(pos);

    shape = createShape();
    generateShape();
  }

  Triangle(PVector pos, boolean upside) {
    this.upside = upside;
    this.pos = pos;
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
    if (!upside) rotate(PI / 3);
    shape(shape, 0, 0);
    stroke(255, 0, 0);
    point(0, 0);
    popMatrix();
  }
}
