class Grid
{
  private Cell[][] cells;          // Main grid of cells

  private int NoCs = 0, NoRs = 0;  // Number of columns and rows
  private int sum;                 // Sum of something
  
  private int[] rulesForAliveOne = {0,0,0,1,1,0,0}; //Rules how alive cell should act
  private int[] rulesForDeadOne = {0,0,1,0,0,0,0};  // Rules how dead  cell should act
  
  private float R, r;              // Maximum and minimum radius of the Cells
  private float wid;               // Width of cell

  // CONSTRUCTOR
  Grid(float wid)
  {    
    R = wid/2;                     // Calculate the maximum radius of the hexagon Cell
    r = (3*R)/(2*sqrt(3));         // Calculate the minimum radius of the hexagon Cell
    
    calculateNoCs(R);              // Calculate the number of columns
    calculateNoRs(r);              // Calculate the number of rows

    cells = new Cell[NoCs][NoRs];  // Create array of Cells
    
    prepareGrid(2*R);              // Prepare cells in grid  
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
  void simulate()
  {
    for(int i = 0; i < NoCs; i++)
    {
      for(int j = 0; j < NoRs; j++)
      {
        if(cells[i][j].getState() == 1)
        {
          cells[i][j].setState(rulesForAliveOne[cells[i][j].getNeighbors()]);
        }else
        {
          cells[i][j].setState(rulesForDeadOne[cells[i][j].getNeighbors()]);
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
    
    countNeighbors(); // Updating the neighbors count
  }

  // Calculate the number of columns with given r (minimun radius of cell) from contructor
  // There is no need for return the NoRs because it is global variable
  private void calculateNoRs(float r)
  {
    float sum = 0;                      // Rows heights sum
    
    while (sum < height)
    {
      NoRs++;
      sum += r;
    }
  }

  // Calculate the number of columns with given R (maximum radius of cell) from constructor
  // There is no need for return the NoCs because it is global variable
  private void calculateNoCs(float R)
  {
    float sum = 0;                      // Columns widths sum

    while (sum <= width)
    {
      NoCs++;
      sum += 1.5*R;                     // 1.5*R is the width of one column
    }
  }

  // For filling the grid with cells at status equals 0;
  private void prepareGrid(float wid)
  {
    for (int i = 0; i < NoCs; i++)
    {
      for (int j = 0; j < NoRs; j++)
      {
        cells[i][j] = new Cell(wid, i, j); // Create new Cell;
      }
    }
  }
  
  // For clearing the grid from alive cells
  void resetGrid()
  {
    prepareGrid(2*R);
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
  
  // For putting all necessery functions in one function
  void run()
  {
    simulate();
    countNeighbors();
  }
}