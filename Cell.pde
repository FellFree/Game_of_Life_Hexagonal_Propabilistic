class Cell
{

  PVector position; // Position of center of Cell
  PVector edge; // Position of edge of Cell

  int state; // State of cell

  float size; // Size of ellipse in which hexagonal will be written
  float R; // maximum radius of circle
  float r; // minimum radius of circle

  Cell(PVector pos, int NoCs, int NoRs)
  {
    R = get_R(int(pos.x), NoCs);
    r = get_r(int(pos.y), NoRs);
    println(pos + " R: " + R + " r: " + r);

    if(pos.y % 2 == 0)
    {
      position = new PVector(R + pos.x*3*R, r + r*pos.y);
      state = 1;
    }
    else
    {
      position = new PVector(2.5*R + pos.x*3*R, 0 + 2*pos.y*r);
    }
    edge = new PVector(-R, 0);
  }

  float get_R(int x_pos, int cols)
  {
    return (width/cols)/2;
  }

  float get_r(int y_pos, int rows)
  {
    return ((3*R)/(2*sqrt(3)));
  }

  void display()
  {
    if (state == 1) fill(255);
    if (state == 0) fill (172);

    pushMatrix(); // Save the matrix

    translate(position.x, position.y); // Translate to center of cell

    beginShape();

    for (int i = 0; i < 6; i++)
    {
      vertex(edge.x, edge.y);
      edge.rotate(PI/3);
    }

    endShape(CLOSE);

    popMatrix();
  }
}