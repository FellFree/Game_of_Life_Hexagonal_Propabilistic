boolean flag;

Grid grid;

void setup()
{
  size(840, 360);
  grid = new Grid(30);
}

void draw()
{
  background(0);
  grid.display();

  if (flag)
  {
    //grid.simulation();
  }
}

void mouseReleased()
{
  if (mouseButton == LEFT)
  {
    PVector mouse = new PVector(mouseX, mouseY);
    grid.click(mouse);
    grid.countNeighbors();
  }

  if (mouseButton == RIGHT)
  {
    if (flag) flag = false;
    else flag = true;
    grid.simulation();
    grid.countNeighbors();
  }
}