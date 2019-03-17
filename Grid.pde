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
    for (int u = 0; u < floor(width / size); u++) {
      for (int v = 0; v <= floor(height / size) + 1; v++) {
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
  }

  void setVertex(int x, int y, int v) {
    int index = y * (int(width / size) + 1) + x;
    if (index < vertices.size()) {
      PVector old = vertices.get(index).copy();
      old.z = v;
      vertices.set(index, old);
    } else {
      println("ERROR: setVertex index too high");
    }
  }

  int getVertex(int x, int y) {
    int index = y * (int(width / size) + 1) + x;
    if (index < vertices.size()) {
      return (int)vertices.get(index).z;
    } else {
      println("ERROR: getVertex index too high");
      return -2;
    }
  }

  int getVertex(PVector p) {
    return getVertex((int)p.x, (int)p.y);
  }

  void drawDebug() {
    for (Triangle t : triangles) {
      t.draw();
    }

    for (PVector v : vertices) {
      stroke(255, 0, 0);
      fill(255, 0, 0);
      strokeWeight(3);
      //point(v.x, v.y);
      //point(v.x * size * .5, v.y * h);
      textAlign(CENTER, CENTER);
      textSize(20);
      text((int)v.z, v.x * size * .5, v.y * h);
    }
  }

  void draw() {    
    for (Tile t : tiles) {
      t.draw();
    }
  }

  PVector getCoords(float mx, float my) {
    PVector out = null;

    for (Triangle tri : triangles) {
      if (tri.isPointIn(mx, my)) {
        out = new PVector(tri.x, tri.y, tri.upside ? 1 : 0);
        break;
      }
    }

    return out;
  }

  Tile getTile(PVector pos) {
    if (pos != null) {      
      return getTile((int)pos.x, (int)pos.y, pos.z == 1 ? true : false);
    }

    return null;
  }

  Tile getTile(int x, int y, boolean up) {
    int index = y * (width / size * 2) + x * 2 + (up ? 1 : 0);

    if (index <= triangles.size()) {
      for (Tile tile : tiles) {
        if (tile.x == x && tile.y == y && tile.upside == up) return tile;
      }
    }

    return null;
  }

  boolean checkVertices(Tile tile, int x, int y) {
    int aIs = tile.values[0];
    int bIs = tile.values[1];
    int cIs = tile.values[2];

    int aShould = getVertex(new PVector(x + y % 2, y));
    int bShould = getVertex(new PVector(tile.upside ? x : x - 1 + y % 2, tile.upside ? y + 1 : y));
    int cShould = getVertex(new PVector(tile.upside ? x + 1 : x, y + 1));

    boolean aValid = aShould == -1 || aIs == aShould;
    boolean bValid = bShould == -1 || bIs == bShould;
    boolean cValid = cShould == -1 || cIs == cShould;

    int amtNei = 0;
    
    if (getTile(x, y, !tile.upside) != null) amtNei++;
    if (getTile(x + (tile.upside ? 1 : -1), y, !tile.upside) != null) amtNei++;
    if (tile.upside) {
      if (getTile(x + (y % 2 == 0 ? 0 : 1), y + 1, false) != null) amtNei++;
    } else {
      if (getTile(x - (y % 2 == 0 ? 1 : 0), y - 1, true) != null) amtNei++;
    }

    //return true;
    return aValid && bValid && cValid && amtNei >= 1;
  }

  void updateVertices(Tile tile, int x, int y) {
    PVector a = new PVector(x + y % 2, y);
    PVector b = new PVector(tile.upside ? x : x - 1 + y % 2, tile.upside ? y + 1 : y);
    PVector c = new PVector(tile.upside ? x + 1 : x, y + 1);

    setVertex((int)a.x, (int)a.y, tile.values[0]);
    setVertex((int)b.x, (int)b.y, tile.values[1]);
    setVertex((int)c.x, (int)c.y, tile.values[2]);
  }

  boolean addTile(Tile tile, float mx, float my) {
    if (tile != null) {
      for (Triangle tri : triangles) {
        if (tiles.size() == 0) {
          if (tri.isPointIn(mx, my)) {
            tiles.add(tile.copy(tri.x, tri.y, tile.upside != tri.upside));
            updateVertices(tile, tri.x, tri.y);
            return true;
          }
        } else {
          if (tri.isPointIn(mx, my) && tile.upside == tri.upside) {
            if (grid.checkVertices(tile, tri.x, tri.y)) {
              tiles.add(tile.copy(tri.x, tri.y, false));
              updateVertices(tile, tri.x, tri.y);
              return true;
            }
          }
        }
      }
    }
    return false;
  }
}
