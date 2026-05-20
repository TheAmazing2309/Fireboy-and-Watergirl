public class SlidingTile extends Tile{
  
  public int direction;
  
  private int openSpeed = 5;
  private int positionAt = 0;
  
  
  public SlidingTile(Hitbox hitbox, PImage[] a, int direction){
    super(hitbox, a);
    this.direction = direction;
  }
  
  public boolean otkroy(){
    if (positionAt >= openSpeed) return true;
    positionAt++;
    if (direction == Top){
      hitbox.position.y -= (Tile.size * scale) / openSpeed;
    }
    if (direction == Bottom){
      hitbox.position.y += (Tile.size * scale) / openSpeed;
    }
    if (direction == Left){
      hitbox.position.x -= (Tile.size * scale) / openSpeed;
    }
    if (direction == Right){
      hitbox.position.x += (Tile.size * scale) / openSpeed;
    }
    return false;
  }
  
  public boolean zakroy(){
    if (positionAt <= 0) return true;
    positionAt--;
    if (direction == Top){
      hitbox.position.y += (Tile.size * scale) / openSpeed;
    }
    if (direction == Bottom){
      hitbox.position.y -= (Tile.size * scale) / openSpeed;
    }
    if (direction == Left){
      hitbox.position.x += (Tile.size * scale) / openSpeed;
    }
    if (direction == Right){
      hitbox.position.x -= (Tile.size * scale) / openSpeed;
    }
    return false;
  }
  
  @Override public void render(){
    println("THIS SHOULD NOT BE IN THE FINAL PRODUCT!!");
    fill(0);
    rect(hitbox.position.x,hitbox.position.y,hitbox.size.x, hitbox.size.y);
  }
}
