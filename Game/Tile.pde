public abstract class Tile{
  public Hitbox collisionsHitbox;
  public Hitbox renderHitbox;
  public PImage[] animation;
  public int animationState;
  public boolean renderEveryFrame;
  public static final int size = 16;
  
  public Tile(Hitbox collisionsHitbox, Hitbox renderHitbox, PImage[] a, boolean r){
    this.collisionsHitbox = collisionsHitbox;
    this.renderHitbox = renderHitbox;
    renderEveryFrame = r;
    animation = a;
    animationState = 0;
  }
  
  public void render(){
    if (animation == null) {
      fill(255);
      rect(renderHitbox.position.x, renderHitbox.position.y, renderHitbox.size.x, renderHitbox.size.y);
      return;
    }

    image(animation[animationState], renderHitbox.position.x, renderHitbox.position.y, renderHitbox.size.x, renderHitbox.size.y);
    animationState++;
    animationState%=animation.length;
  }
  
  @Override public String toString(){
    return (this.renderHitbox.position.y/(size*scale)) + " " + (this.renderHitbox.position.x/(size*scale));
  }
}
