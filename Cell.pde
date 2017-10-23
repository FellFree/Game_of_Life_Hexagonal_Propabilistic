class Cell
{
  private PVector position; // Position of center of hexagon
  private PVector edges[];  // Position of edges
  private PVector diff;     // Vector between something and center of the Cell

  private float R;          // Maximum radius of hexagon
  private float r;          // Minimum radius of hexagon
  private float w;          // width of cell;

  private int col, row;     // Number of column and rows
  private int state;        // Status of the Cell. Can be 0 or 1;
  private int neighbors;    // Number of neighbours of cell;
  
  private color[] fillCell = {color(0), color(255)}; // Putting all colors in the array

  Cell(float wid, int col, int row)
  {
    neighbors = 0;
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

  int getNeighbors()
  {
    return neighbors;
  }

  // Adds neighbors
  void addNeighbors(int n)
  {
    neighbors = n;
  }

  // Check if this cell is clicked. If jest then return true else false
  boolean checkClick(PVector mouse)
  {
    diff = position.copy().sub(mouse.copy());

    if (diff.mag() <= r)
    {
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

  // Sets Cells state
  void setState(int s)
  {
    if (s == 1 || s == 0)
    {
      state = s;
    }
  }

  // Returns current state of Cell
  int getState()
  {
    return state;
  }

  // Set the edges of the Cell. This function is executed only one, 
  // so there is no need to make global temp PVector 
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
    stroke(172);
    fill(fillCell[state]);

    pushMatrix();
    translate(position.x, position.y);

    beginShape();

    for (PVector v : edges)
    {
      vertex(v.x, v.y);
    }

    endShape(CLOSE);

    fill(0);
    //text(col+ ":" + row, -10, -5);
    //text(neighbors, -10, 5);
    popMatrix();
  }
}