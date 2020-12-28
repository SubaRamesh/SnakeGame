public class Fruit {
  public float x, y;

  public void pickLocation() {
    x = (float)(Math.floor(Math.random() * rows - 1) + 1) *scale;
    y = (float)(Math.floor(Math.random() * columns -1) + 1) *scale;
    //System.out.println(x + ", " + y);
  }

  public void Place() {
    fill(255, 0, 0);
    rect(x, y, scale, scale);
    
  }
}
