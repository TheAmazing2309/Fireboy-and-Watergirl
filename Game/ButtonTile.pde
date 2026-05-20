public class ButtonTile extends Tile{
  SlidingTile tileLink;
  public boolean openThisFrame;
  
  public ButtonTile (Hitbox hitbox, PImage[] a, SlidingTile tileLink){
    super(hitbox, a);
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
   rect(hitbox.position.x,hitbox.position.y,hitbox.size.x, hitbox.size.y);
  }
  
}
