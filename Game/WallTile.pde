public class WallTile extends Tile{
  
  public WallTile (Hitbox hitbox, PImage[] a, boolean collisionOn){
    super(hitbox, a, collisionOn);
  }
  
  @Override public boolean collide(Player other){return false;}

}
