class Grid
{
  Cell[][] cells; // Main grid of cells

  int NoCs, NoRs; // Number of columns and rows

  Grid(int cols, int rows)
  {
    NoCs = 0;
    NoRs = rows;
    float sum = 0;
    
    float R = (width/cols)/2;
    
    while(sum < width)
    {
      NoCs++;
      sum += 1.5*R;
      println("Sum: " + sum);
    }
    if(sum > width)
    {
      NoCs--;
    }
    
    println("NoCs: " + NoCs);
    
    
    println("R: " + R);
    
    cells = new Cell[NoCs][NoRs];
    
    for (int i = 0; i < NoCs; i++)
    {
      for(int j = 0; j < NoRs; j++)
      {
        cells[i][j] = new Cell(width/cols, i);
      }
    }
  }

  void display()
  {
    for (int i = 0; i < NoCs; i++)
    {
      for(int j = 0; j < NoRs; j++)
      {
        cells[i][j].display();
      }
    }
  }
}