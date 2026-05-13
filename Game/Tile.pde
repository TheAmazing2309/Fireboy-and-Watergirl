public abstract class Tile{
  
  private PShape hitbox;
  private boolean fire;
  private PImage[] animation;
  
  public abstract void animate();
  
  public abstract void collide(Player other);
}
