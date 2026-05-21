public class SlidingTile extends Tile{
  
  public int direction;
  
  private int openSpeed = 5;
  private int positionAt = 0;
  
  
  public SlidingTile(Hitbox h1, Hitbox h2, PImage[] a, int direction){
    super(h1, h2, a);
    this.direction = direction;
  }
  
  public boolean otkroy(){
    if (positionAt >= openSpeed) return true;
    positionAt++;
    if (direction == Top){
      collisionsHitbox.size.y -= (Tile.size * scale) / openSpeed;
    }
    if (direction == Bottom){
      collisionsHitbox.size.y -= (Tile.size * scale) / openSpeed;
    }
    if (direction == Left){
      collisionsHitbox.size.x -= (Tile.size * scale) / openSpeed;
    }
    if (direction == Right){
      collisionsHitbox.size.x -= (Tile.size * scale) / openSpeed;
    }
    return false;
  }
  
  public boolean zakroy(){
    if (positionAt <= 0) return true;
    positionAt--;
    if (direction == Top){
      collisionsHitbox.size.y += (Tile.size * scale) / openSpeed;
    }
    if (direction == Bottom){
      collisionsHitbox.size.y += (Tile.size * scale) / openSpeed;
    }
    if (direction == Left){
      collisionsHitbox.size.x += (Tile.size * scale) / openSpeed;
    }
    if (direction == Right){
      collisionsHitbox.size.x += (Tile.size * scale) / openSpeed;
    }
    return false;
  }
  
  @Override public void render(){
    fill(255);
    println("THIS SHOULD NOT BE IN THE FINAL PRODUCT!!");
    fill(0);
    rect(renderHitbox.position.x,renderHitbox.position.y,renderHitbox.size.x, renderHitbox.size.y);
  }
}
