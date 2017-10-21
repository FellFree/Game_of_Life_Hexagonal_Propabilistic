class Grid
{
  Cell[][] cells;          // Main grid of cells

  int NoCs = 0, NoRs = 0;  // Number of columns and rows
  int sum;                 // Sum of something
  
  int[] rulesForAliveOne = {0,0,1,1,1,0}; //Rules how alive cell should act
  int[] rulesForDeadOne = {0,0,0,0,1,0};  // Rules how dead  cell should act
  
  float R, r;              // Maximum and minimum radius of the Cells
  float wid;               // Width of cell

  Grid(float wid)
  {    
    // Calculate the maximum and minimum radius of the hexagon Cell
    R = wid/2;
    r = (3*R)/(2*sqrt(3));

    // Calculate the number of columns and rows
    calculateNoCs(R);
    calculateNoRs(r);  

    // Create array of Cells
    cells = new Cell[NoCs][NoRs];

    // Prepare cells in grid  
    prepareGrid(2*R);
  }

  // Count ceighbors for each cell;

  void countNeighbors()
  {
    for (int i = 0; i < NoCs; i++)
    {
      for ( int j = 0; j < NoRs; j++)
      {
        countNeighbors(i, j);
      }
    }
  }
  
  // Make the Cells alive (or not)
  void simulation()
  {
    for(int i = 0; i < NoCs; i++)
    {
      for(int j = 0; j < NoRs; j++)
      {
        if(cells[i][j].getState() == 1)
        {
          cells[i][j].setState(rulesForAliveOne[cells[i][j].getState()]);
        }
        else
        {
          cells[i][j].setState(rulesForDeadOne[cells[i][j].getState()]);
        }
      }
    }
  }
  
  // Literaly counting the alive cells in the neighborhood
  void countNeighbors(int col, int row)
  {
    sum = 0;

    if (col%2 == 0)
    {
      if (col-1 >= 0)                   sum += cells[col-1][row  ].getState();
      if (col-1 >= 0 && row+1 < NoRs)   sum += cells[col-1][row+1].getState();
      if (row-1 >= 0)                   sum += cells[col  ][row-1].getState();
      if (row+1 < NoRs)                 sum += cells[col  ][row+1].getState();
      if (col+1 < NoCs)                 sum += cells[col+1][row  ].getState();
      if (col+1 < NoCs && row+1 < NoRs) sum += cells[col+1][row+1].getState();

      cells[col][row].addNeighbors(sum);
    }
    if (col%2 != 0)
    {
      if (col-1 >= 0 && row-1 >= 0)   sum += cells[col-1][row-1].getState();
      if (col-1 >= 0)                 sum += cells[col-1][row  ].getState();
      if (row-1 >= 0)                 sum += cells[col  ][row-1].getState();
      if (row+1 < NoRs)               sum += cells[col  ][row+1].getState();
      if (col+1 < NoCs)               sum += cells[col+1][row  ].getState();
      if (col+1 < NoCs && row-1 >= 0) sum += cells[col+1][row-1].getState();

      cells[col][row].addNeighbors(sum);
    }
  }

  // Check which cell is clicked and changest it's state to opposite
  void click(PVector mouse)
  {
    for (int i = 0; i < NoCs; i++)
    {
      for (int j = 0; j < NoRs; j++)
      {
        if (cells[i][j].checkClick(mouse))
        {
          cells[i][j].changeState();
        }
      }
    }
  }

  // Calculate the number of columns with given r (minimun radius of cell) from contructor
  void calculateNoRs(float r)
  {
    float sum = 0;

    while (sum < height)
    {
      NoRs++;
      sum += r;
    }

    // There is no need for return the NoRs becouse it is global variable
  }

  // Calculate the number of columns with given R (maximum radius of cell) from constructor
  void calculateNoCs(float R)
  {
    float sum = 0; // Columns widths sum

    while (sum <= width)
    {
      NoCs++;
      sum += 1.5*R; // 1.5R is the width of one column
    }

    //// If sum of widths of columns is too great, subtract one column. It's no necessery
    if (sum > (width + 2*R))
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
      for (int j = 0; j < NoRs; j++)
      {
        cells[i][j] = new Cell(wid, i, j); // Create new Cell;
      }
    }
  }

  // Display all Cells
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