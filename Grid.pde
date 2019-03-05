class Grid {

  ArrayList<Triangle> triangles;
  ArrayList<Tile> tiles;
  ArrayList<PVector> vertices;

  Grid() {
    triangles = new ArrayList<Triangle>();
    tiles = new ArrayList<Tile>();
    vertices = new ArrayList<PVector>();

    generateGrid();
    generateVertices();
  }

  void generateGrid() {
    for (int u = 0; u <= floor(width / size); u++) {
      for (int v = 0; v <= floor(height / size); v++) {
        Triangle left = new Triangle(u, v, true);
        left.setStrokeCol(200, 200, 200);
        Triangle right = new Triangle(u, v, false);
        left.setStrokeCol(200, 200, 200);
        triangles.add(left);
        triangles.add(right);
      }
    }
  }

  void generateVertices() {
    int x = -1, y;
    
    for (y = 0; y <= floor(height / h) + 1; y++) {
      for (x = (y % 2 == 0 ? 1 : 0); x <= floor(width / size) * 2 + 1; x += 2) {
        //vertices.add(new PVector(x * size * .5, y * h));
        vertices.add(new PVector(x, y, -1));
      }
    }
    
    println(x, y);
  }

  void draw() {
    for (Triangle t : triangles) {
      t.draw();
    }
    for (Tile t : tiles) {
      t.draw();
    }

    for (PVector v : vertices) {
      stroke(255, 0, 0);
      strokeWeight(3);
      //point(v.x, v.y);
      point(v.x * size * .5, v.y * h);
    }
  }

  PVector getCoords(float mx, float my) {
    PVector out = null;

    for (Triangle tri : triangles) {
      if (tri.isPointIn(mx, my)) {
        out = new PVector(tri.x, tri.y);
        break;
      }
    }

    return out;
  }

  boolean addTile(Tile tile, float mx, float my) {
    if (tile != null) {
      for (Triangle tri : triangles) {
        if (tri.isPointIn(mx, my) && (tiles.size() == 0 || tile.upside == tri.upside)) {
          tiles.add(tile.copy(tri.x, tri.y, tiles.size() == 0 && tile.upside != tri.upside));
          return true;
        }
      }
    }
    return false;
  }
}
