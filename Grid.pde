class Grid
{
  Cell[][] cells; // Array of cells;

  int NoCs, NoRs; // Number of columns and rows

  Grid(int colsNumber, int rowsNumber)
  {
    NoCs = colsNumber;
    NoRs = rowsNumber;
    
    cells = new Cell[NoCs][NoRs];
    
    for (int i = 0; i < NoCs; i++)
    {
      for (int j = 0; j < NoRs; j++)
      {
        cells[i][j] = new Cell(new PVector(i, j), NoCs, NoRs);
      }
    }
  }

  void display()
  {
    for (int i = 0; i < NoCs; i++)
    {
      for (int j = 0; j < NoRs; j++)
      {
        cells[i][j].display();
      }
    }
  }
}