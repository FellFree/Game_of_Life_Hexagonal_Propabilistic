class Grid
{
  Cell[][] cells; // Main grid of cells

  int NoCs = 0, NoRs = 0; // Number of columns and rows

  Grid(float wid)
  {
    NoRs = 10;
    
    float R = wid/2;
    float r = (3*R)/(2*sqrt(3));
    
    calculateNoCs(R);
    calculateNoRs(r);
   

    cells = new Cell[NoCs][NoRs];
    
    prepareGrid(2*R); // prepare cells in grid
    
  }
  
  // Calculate the number of columns with given r (minimun radius of cell) from contructor
  void calculateNoRs(float r)
  {
    float sum = 0;
    
    while(sum < height)
    {
     NoRs++;
     sum += r;
    }
    
    println("NoRs: " + NoRs);
  }
  
  // Calculate the number of columns with given R (maximum radius of cell) from constructor
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
    
    println("NoCs: " + NoCs);
    
    // There is no need for return the NoCs becouse it is global variable
  }
  
  // For filling the grid with cells at status equals 0;
  void prepareGrid(float wid)
  {
    for (int i = 0; i < NoCs; i++)
    {
      for(int j = 0; j < NoRs; j++)
      {
        cells[i][j] = new Cell(wid, i, j); // Create new Cell;
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