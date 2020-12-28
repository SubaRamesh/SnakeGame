public class Snake {
  public int x, y = 0;
  public float xSpeed = scale*1;
  public float ySpeed = 0;
  public int total = 0;
  public ArrayList<Point> tail = new ArrayList<Point>();


  public void Draw() {
    fill(0, 255, 0);

    for (int i = 0; i < tail.size(); i++) {
      rect(tail.get(i).x, tail.get(i).y, scale, scale);
    }

    //rect(x, y, scale, scale);
  }

  public void update() {

    for (int i = tail.size() -1; i > 0; i--) {
      tail.set(i, tail.get(i-1));
    }

    x += xSpeed;
    y += ySpeed;

    Point change = new Point();
    change .x = x;
    change.y =y;
    tail.set(0, change);
  }

  public void changeDirection(String direction) {
    if (direction == null)
      return;
    if (direction == "UP") {
      xSpeed = 0;
      ySpeed = -scale;
      //System.out.println("UP");
      return;
    }
    if (direction == "DOWN") {
      xSpeed = 0;
      ySpeed = scale;
      //System.out.println("DOWN");
      return;
    }
    if (direction == "LEFT") {
      ySpeed = 0;
      xSpeed = -scale;
      //System.out.println("LEFT");
      return;
    }
    if (direction == "RIGHT") {
      ySpeed = 0;
      xSpeed = scale;
      //System.out.println("RIGHT");
      return;
    }
  }

  public boolean Eat(Fruit fruit) {
    if (fruit.x == x && fruit.y == y) {
      total++;
      Grow();
      System.out.println("NOM NOM score: " + total + " length: " + tail.size());
      return true;
    }
    return false;
  }

  public void Grow() {
    Point tailEnd = new Point();
    tail.add(total, tailEnd);
    //System.out.println(tailEnd);
  }

  public boolean checkCollision() {
    for (int i = 1; i < tail.size(); i++)
      if (tail.get(i).x == x && tail.get(i).y == y)
        return true;
    if (x >= width || x <= 0 || y >= height || y <= 0)
      return true;
    return false;
  }
}



public class Point {
  public int x;
  public int y;

  public String toString() {
    return "x: " + x+ " y: " + y;
  }
}
