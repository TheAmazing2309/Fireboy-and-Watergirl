public class DoorTile extends Tile{
  int compleated = 0;
  Hitbox hitbox;
  
  public DoorTile(Hitbox hitbox, PImage[] a){
    super(hitbox,a);
  }
  
  @Override public boolean collide(Player other){return false;}
}
