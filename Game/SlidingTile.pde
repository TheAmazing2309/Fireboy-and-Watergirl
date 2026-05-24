public class SlidingTile extends Tile{
  
  public int direction;
  
  private int openSpeed = 5;
  private int positionAt = 0;
  
  
  public SlidingTile(Hitbox h1, Hitbox h2, PImage[] a, int direction, boolean r){
    super(h1, h2, a, r);
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
    rect(renderHitbox.position.x,renderHitbox.position.y,renderHitbox.size.x, renderHitbox.size.y);
    fill(0);
    rect(collisionsHitbox.position.x, collisionsHitbox.position.y, collisionsHitbox.size.x, collisionsHitbox.size.y);
  }
}
