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
    if (animation == null) {
      fill(255);
      rect(hitbox.position.x, hitbox.position.y, hitbox.size.x, hitbox.size.y);
      return;
    }
    
    //beginShape();
    //texture(animation[animationState]);
    //vertex(hitbox.position.x, hitbox.position.y);
    //vertex(hitbox.position.x + hitbox.size.x, hitbox.position.y);
    //vertex(hitbox.position.x + hitbox.size.x, hitbox.position.y + hitbox.size.y);
    //vertex(hitbox.position.x, hitbox.position.y + hitbox.size.y);
    //endShape();
    
    image(animation[animationState], hitbox.position.x, hitbox.position.y, hitbox.size.x, hitbox.size.y);
    animationState++;
    animationState%=animation.length;
  }
  
  @Override public String toString(){
    return (this.hitbox.position.y/(size*scale)) + " " + (this.hitbox.position.x/(size*scale));
  }
}
