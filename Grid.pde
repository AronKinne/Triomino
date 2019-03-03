class Grid {
 
  ArrayList<Triangle> triangles;
  
  Grid() {
    triangles = new ArrayList<Triangle>();
    
    generateGrid();
  }
  
  void generateGrid() {
    for(int u = 0; u < floor(width / size); u++) {
      for(int v = 0; v < floor(height / size); v++) {
        Triangle left = new Triangle(u, v, false);
        Triangle right = new Triangle(u, v, true);
        triangles.add(left);
        triangles.add(right);
      }
    }
  }
  
  void draw() {
    
    for(Triangle t : triangles) {
      t.draw(); 
    }
    
  }
  
}
