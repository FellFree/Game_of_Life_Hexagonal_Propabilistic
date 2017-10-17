class Cell
{
  PVector position; // Position of center of hexagon
  PVector edge; //Position of edges

  float R; // Maximum radius of hexagon
  float r; // Minimum radius of hexagon
  float w; // width of cell;
  
  int col, row; // Number of column and rows
  int status; // Status of the Cell. Can be 0 or 1;

  Cell(float wid, int col)
  {
    status = 0;
    
    w = wid;
    R = w/2;
    r = (3*R)/(2*sqrt(3));
    this.col = col;

    if (col%2 == 0)
    {
      position = new PVector(3*R*(col/2), r + r*row);
    }
    else
    {
      position = new PVector(-1.5*R + 3*R*(col/2 + col%2), r*row);
    }
    edge = new PVector(-R, 0);
  }

  void display()
  {
    fill(255);

    pushMatrix();
    translate(position.x, position.y);

    beginShape();
    for (int i = 0; i < 6; i++)
    {
      vertex(edge.x, edge.y);
      edge.rotate(PI/3);
    }
    endShape(CLOSE);
    fill(0);
    text(""+col, -10, 0);
    popMatrix();
  }
}