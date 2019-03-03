class Grid {

  ArrayList<Triangle> triangles;
  ArrayList<Tile> tiles;

  Grid() {
    triangles = new ArrayList<Triangle>();
    tiles = new ArrayList<Tile>();

    generateGrid();
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

  void draw() {
    for (Tile t : tiles) {
      t.draw();
    }
  }
  
  PVector getCoords(float mx, float my) {
    PVector out = null;
    
    for(Triangle tri : triangles) {
      if(tri.isPointIn(mx, my)) {
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
