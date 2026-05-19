public abstract class Tile{
  public Hitbox hitbox;
  public PImage[] animation;
  public int animationState;
  public static final int size = 16;
  
  public Tile(Hitbox hitbox, PImage[] a){
    this.hitbox = hitbox;
    animation = a;
    animationState = 0;
  }
  
  public void render(){
    if (animation == null) return;
    image(animation[animationState], hitbox.position.x, hitbox.position.y, hitbox.size.x, hitbox.size.y);
    animationState++;
    animationState%=animation.length;
  }
  
  public abstract boolean collide(Player other);
  
  @Override public String toString(){
    return (this.hitbox.position.y/(size*scale)) + " " + (this.hitbox.position.x/(size*scale));
  }
}
