public class WallTile extends Tile{
  
  public WallTile (Hitbox hitbox, PImage[] a){
    super(hitbox, a);
  }
  
  @Override public boolean collide(Player other){return false;}

}
