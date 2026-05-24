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
      hitbox.size.y -= (Tile.size * scale) / openSpeed;
    }
    if (direction == Bottom){
      hitbox.size.y -= (Tile.size * scale) / openSpeed;
    }
    if (direction == Left){
      hitbox.size.x -= (Tile.size * scale) / openSpeed;
    }
    if (direction == Right){
      hitbox.size.x -= (Tile.size * scale) / openSpeed;
    }
    return false;
  }
  
  public boolean zakroy(){
    if (positionAt <= 0) return true;
    positionAt--;
    if (direction == Top){
      hitbox.size.y += (Tile.size * scale) / openSpeed;
    }
    if (direction == Bottom){
      hitbox.size.y += (Tile.size * scale) / openSpeed;
    }
    if (direction == Left){
      hitbox.size.x += (Tile.size * scale) / openSpeed;
    }
    if (direction == Right){
      hitbox.size.x += (Tile.size * scale) / openSpeed;
    }
    return false;
  }
  
  @Override public void render(){
    fill(255);
    //println("THIS SHOULD NOT BE IN THE FINAL PRODUCT!!");
    fill(0);
    rect(hitbox.position.x,hitbox.position.y,hitbox.size.x, hitbox.size.y);
  }
}
