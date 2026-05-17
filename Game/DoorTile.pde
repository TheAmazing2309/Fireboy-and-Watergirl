public class DoorTile extends Tile{
  int compleated = 0;
  
  public DoorTile(Hitbox hitbox, PImage[] a, boolean collisionOn){
    super(hitbox,a,collisionOn);
  }
  
  @Override public boolean collide(Player other){return false;}
}
