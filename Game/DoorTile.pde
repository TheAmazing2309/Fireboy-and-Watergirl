public class DoorTile extends Tile{
  public boolean opened = false;
  public boolean fire;

  
  public DoorTile(Hitbox hitbox, PImage[] a, boolean fire){
    super(hitbox,a);
    this.fire = fire;
  }
  
  //public void update(){
  //  if (this.hitboc
  //}
}
