public abstract class Tile{
  
  private PShape hitbox;
  private PImage[] animation;
  
  public Tile(){
  }
  
  public abstract void animate();
  
  public abstract void collide(Player other);
}
