Snake snake;
Fruit fruit;
public int scale = 10;
public int rows;
public int columns;

public String direction;

int TEXT_SIZE;
int TEXT_X;
int TEXT_Y;

void setup() {
  size(300, 300);
  frameRate(5);    
  rows = height/scale;
  columns = width/scale;

  TEXT_SIZE = 2 * scale;
  TEXT_X = 4 * scale;
  TEXT_Y = 2 * scale;

  fruit = new Fruit();
  fruit.pickLocation();

  snake = new Snake();
  Point zero = new Point();
  zero.x = 0;
  zero.y = 0;
  snake.tail.add(zero);

  //System.out.println("rows: " + rows + " columns: " + columns);
}

void draw() {
  background(20, 20, 0);
  textSize(TEXT_SIZE);
  fill(255);
  text("Score: " + snake.total, TEXT_X, TEXT_Y);

  //if (keyPressed) {
  //  if (key == 'w')
  //    direction = "UP";
  //  if (key == 's')
  //    direction = "DOWN";
  //  if (key == 'd')
  //    direction ="RIGHT";
  //  if (key == 'a')
  //    direction = "LEFT";
  //}

  fruit.Place();

  snake.changeDirection(direction);
  snake.update();
  snake.Draw();

  if (snake.Eat(fruit)) {
    fruit.pickLocation();
  }

  if (snake.checkCollision()) {
    System.out.println("DEAD");
    reset();
  }
}

void keyTyped() {
  if (key == 'w')
    direction = "UP";
  if (key == 's')
    direction = "DOWN";
  if (key == 'd')
    direction ="RIGHT";
  if (key == 'a')
    direction = "LEFT";
}


void reset() {
  snake.total = 0;
  snake.tail = new ArrayList<Point>();
  snake.tail.add(new Point());
  snake.x = (int)Math.floor(rows/2) * scale;
  snake.y = (int)Math.floor(columns/2)*scale;

  System.out.println("Reset");
}
