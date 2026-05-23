public class ButtonTile extends Tile{
  SlidingTile tileLink;
  public boolean openThisFrame;
  
  public ButtonTile (Hitbox h1, Hitbox h2, PImage[] a, SlidingTile tileLink){
    super(h1, h2, a);
    this.tileLink = tileLink;
    openThisFrame = false;
  }
  
  public void activate(){
    openThisFrame = false;
    tileLink.otkroy();
  }
  public void deactivate(){
    try{
    tileLink.zakroy();
    }catch (NullPointerException e){
      e.printStackTrace();
    }
  }
  
  public void setTileLink(SlidingTile tileLink){
    this.tileLink = tileLink;
  }
  
  @Override public void render(){
   fill(0);
   rect(renderHitbox.position.x,renderHitbox.position.y,renderHitbox.size.x, renderHitbox.size.y);
  }
  
}
