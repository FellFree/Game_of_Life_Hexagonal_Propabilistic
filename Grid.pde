class Grid
{
  Cell[][] cells; // Main grid of cells

  int NoCs = 0, NoRs = 0; // Number of columns and rows

  Grid(float wid)
  {
    NoRs = 10;
    
    float R = wid/2;
    
    calculateNoCs(R);
    println(NoCs);
   

    cells = new Cell[NoCs][NoRs];
    
    prepareGrid(2*R); // prepare cells in grid
    
  }
  
  // Calculate the number of columns with given R from constructor
  void calculateNoCs(float R)
  {
    float sum = 0; // Columns widths sum
    
     while(sum < width)
    {
      NoCs++;
      sum += 1.5*R; // 1.5R is the width of one column
    }
    
    // If sum of widths of columns is too great, subtract one column
    if(sum > (width + 2*R))
    {
      NoCs--; 
    }
    
    // There is no need for return the NoCs becouse it is global variable
  }
  
  // For filling the grid with cells at status equals 0;
  void prepareGrid(float wid)
  {
    for (int i = 0; i < NoCs; i++)
    {
      for(int j = 0; j < NoRs; j++)
      {
        cells[i][j] = new Cell(wid, i); // Create new Cell;
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