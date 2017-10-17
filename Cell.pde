class Cell
{
  PVector position; // Position of center of hexagon
  PVector edges[]; //Position of edges

  float R; // Maximum radius of hexagon
  float r; // Minimum radius of hexagon
  float w; // width of cell;

  int col, row; // Number of column and rows
  int status; // Status of the Cell. Can be 0 or 1;

  Cell(float wid, int col, int row)
  {
    status = 0;

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
    fill(255);

    pushMatrix();
    translate(position.x, position.y);

    beginShape();

    for (PVector v : edges)
    {
      vertex(v.x, v.y);
    }

    endShape(CLOSE);

    fill(0);
    text(""+col, -10, 0);
    popMatrix();
  }
}