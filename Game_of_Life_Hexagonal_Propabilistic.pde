Grid grid;

void setup()
{
  size(640, 360);
  grid = new Grid(40);
}

void draw()
{
  background(0);
  grid.display();
}