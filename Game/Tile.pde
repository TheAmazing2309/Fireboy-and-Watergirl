public abstract class Tile{
  
  private PShape hitbox;
  private PImage[] animation;
  public boolean collisionOn;
  public static final int size = 16;
  
  public Tile(PShape hitbox, boolean collisionOn){
    this.hitbox = hitbox;
    this.collisionOn = collisionOn;
  }
  
  public abstract void animate();
  
  public abstract boolean collide(Player other);
}
