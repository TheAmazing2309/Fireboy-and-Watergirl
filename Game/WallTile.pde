public class WallTile extends Tile{

  public WallTile (PShape hitbox, boolean collisionOn){
    super(hitbox, collisionOn);
  }
  
  @Override public void animate(){}
  @Override public boolean collide(Player other){return false;}
}
