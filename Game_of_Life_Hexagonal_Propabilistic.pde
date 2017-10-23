PVector mouse;

boolean simulation;

int counter;
Grid grid;

void setup()
{
  size(840, 360);
  grid = new Grid(20);

  mouse = new PVector();
  counter = 0;
}

void draw()
{
  background(0);
  grid.display();

  if (simulation)
  {
    if (counter == 5)
    {
      grid.run();
      counter = 0;
    }
    counter++;
  }
}

void mouseReleased()
{
  if (mouseButton == LEFT)
  {
    mouse = new PVector(mouseX, mouseY);
    grid.click(mouse);
  } else if (mouseButton == RIGHT)
  {
    if (simulation) simulation = false;
    else simulation = true;
  } else if (mouseButton == CENTER)
  {
    grid.resetGrid();
  }
}