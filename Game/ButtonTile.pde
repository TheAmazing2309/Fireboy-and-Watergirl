public class ButtonTile extends Tile{
  SlidingTile tileLink;
  
  public ButtonTile (Hitbox hitbox, PImage[] a, SlidingTile tileLink){
    super(hitbox, a);
    this.tileLink = tileLink;
  }
  
  public void activate(){
    tileLink.otkroy();
  }
  public void deactivate(){
    tileLink.zakroy();
  }
  
  public void setTileLink(SlidingTile tileLink){
    this.tileLink = tileLink;
  }
  
  @Override public void render(){
   fill(100 * code);
   rect(hitbox.position.x,hitbox.position.y,hitbox.size.x, hitbox.size.y);
  }
  
}
