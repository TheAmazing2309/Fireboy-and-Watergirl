public class DoorTile extends Tile{
  public boolean opened = false;
  public boolean fire;

  
  public DoorTile(Hitbox hitbox, PImage[] a, boolean fire){
    super(hitbox,a);
    this.fire = fire;
  }
  
  public void update(Player a){
    this.hitbox.collide(a.hitbox);
    if ((this.hitbox.collisions[Right] == true || this.hitbox.collisions[Left] == true || this.hitbox.collisions[Top] == true|| this.hitbox.collisions[Bottom] == true)){
    if (fire && a.fire){
    opened = true;
    }
    if (!fire && !a.fire){
      opened = true;
    }
    }
  }
}
