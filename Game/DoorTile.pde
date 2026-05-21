public class DoorTile extends Tile{
  public boolean opened = false;
  public boolean fire;

  
  public DoorTile(Hitbox h1, Hitbox h2, PImage[] a, boolean fire){
    super(h1, h2 ,a);
    this.fire = fire;
  }
  
  public void update(Player a){
    this.collisionsHitbox.collide(a.hitbox);
    if ((this.collisionsHitbox.collisions[Right] == true || this.collisionsHitbox.collisions[Left] == true || this.collisionsHitbox.collisions[Top] == true|| this.collisionsHitbox.collisions[Bottom] == true)){
    if (fire && a.fire){
    opened = true;
    }
    if (!fire && !a.fire){
      opened = true;
    }
    }
  }
}
