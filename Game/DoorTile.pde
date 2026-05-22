public class DoorTile extends Tile{
  public boolean opened = false;
  public boolean fire;

  
  public DoorTile(Hitbox h1, Hitbox h2, PImage[] a, boolean fire){
    super(h1, h2 ,a);
    this.fire = fire;
  }
  
  @Override public void render(){
    if (opened) fill(0, 255, 0);
    else fill(255, 0, 0);
    rect(renderHitbox.position.x, renderHitbox.position.y, renderHitbox.size.x, renderHitbox.size.y);
  }
}
