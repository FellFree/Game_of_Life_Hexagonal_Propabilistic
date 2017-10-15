class Cell
{
  PVector position; // Position of center of Cell
  PVector edge; // Position of edge of Cell
  
  float size; // Size of ellipse in which hexagonal will be written
  float R; // R of ellipse;
  
  Cell(PVector pos, int s)
  {
    size = s;
    R = s/2;
    
    position = pos.copy();
    edge = new PVector(-R, 0);
  }
  
  void display()
  {
    fill(255);
    
    pushMatrix(); // Save the matrix
    
    translate(position.x, position.y); // Translate to center of cell
    
    beginShape();
    
    for(int i = 0; i < 6; i++)
    {
      vertex(edge.x, edge.y);
      edge.rotate(PI/3);
    }
    
    endShape(CLOSE);
    
    popMatrix();
  }
}