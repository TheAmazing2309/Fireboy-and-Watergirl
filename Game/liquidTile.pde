public class LiquidTile extends Tile{
  public boolean opened = false;
  public boolean fireAllergic;
  public boolean waterAllergic;

  
  public LiquidTile(Hitbox h1, Hitbox h2, PImage[] a, boolean fire, boolean water, boolean r){
    super(h1, h2,a,r);
    this.fireAllergic = fire;
    this.waterAllergic = water;
  }
  
  @Override public void render(){
    if (fireAllergic && waterAllergic) fill(0,255,0, 100);
    else if (waterAllergic) fill(255,0,0,100);
    else fill(0,0,255,100);
    rect(renderHitbox.position.x, renderHitbox.position.y, renderHitbox.size.x, renderHitbox.size.x);
  }
}
