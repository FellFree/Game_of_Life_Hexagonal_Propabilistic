class Cell
{
  PVector position; // Position of center of hexagon
  PVector edges[]; //Position of edges

  float R; // Maximum radius of hexagon
  float r; // Minimum radius of hexagon
  float w; // width of cell;

  int col, row; // Number of column and rows
  int state; // Status of the Cell. Can be 0 or 1;
  int neighbours; // Number of neighbours of cell;

  Cell(float wid, int col, int row)
  {
    state = 0;

    w = wid;
    R = w/2;
    r = (3*R)/(2*sqrt(3));

    this.col = col;
    this.row = row;

    if (col%2 == 0)
    {
      position = new PVector(3*R*(col/2), r + 2*r*row);
    } else
    {
      position = new PVector(-1.5*R + 3*R*(col/2 + col%2), 2*r*row);
    }

    edges = new PVector[6];
    makeEdges(R);
  }
  
  void countNeighbors()
  {
    
  }

  // Check if this cell is clicked. If jest then return true else false
  boolean checkClick(PVector mouse)
  {
    PVector diff = position.copy().sub(mouse.copy());
    float distance = diff.mag();

    if (distance <= r)
    {
      println("Coordinates of cell: " + col + ":" + row + " distance: " + distance);
      return true;
    }

    return false;
  }

  // Change state of cells to opposite
  void changeState()
  {
    if (state == 0) state = 1;
    else state = 0;
  }
  
  int getState()
  {
    return state;
  }

  void makeEdges(float R)
  {
    PVector temp = new PVector(-R, 0);
    for (int i = 0; i < 6; i++)
    {
      edges[i] = temp.copy();
      temp.rotate(PI/3);
    }
  }

  void display()
  {
    if (state == 0) fill(172);
    if (state == 1) fill(255);

    pushMatrix();
    translate(position.x, position.y);

    beginShape();

    for (PVector v : edges)
    {
      vertex(v.x, v.y);
    }

    endShape(CLOSE);
    
    fill(0);
    text(col+ ":" + row, -10, 3);
    popMatrix();
  }
}