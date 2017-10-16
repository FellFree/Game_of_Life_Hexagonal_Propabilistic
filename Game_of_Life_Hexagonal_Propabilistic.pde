// Game of Life - Hexagonal Propabilistic version
// Marcin Czerwiński

//Written in Processing 3.3.6 (Java)

Grid grid; // Declaring main grid

void setup()
{
  size(640, 360);

  grid = new Grid(10, 10);
}

void draw()
{
  background(0);
  grid.display();
}