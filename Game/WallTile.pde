public class WallTile extends Tile{
  
  private PShape hitbox;
  private PImage[] animation;
  
  public WallTile(int x, int y){
   hitbox = createShape(SQUARE,x,y,16);
  }

  public void animate(){
    
  }
  
  public void collide(Player other){
  
  }
}
