public class ButtonTile extends Tile{
  SlidingTile tileLink;
  public boolean openThisFrame;
  public int c;
  public color[] colors = {#B3B004, #2BB222, #A922B2, #0441B3, #B24922, #BFBFBF};
 
  public ButtonTile (Hitbox h1, Hitbox h2, PImage[] a, SlidingTile tileLink, boolean r, int c){
    super(h1, h2, a, r);
    this.tileLink = tileLink;
    openThisFrame = false;
    this.c=c;
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
   image(loadImage("sprites/BackgroundTile.png"), this.renderHitbox.position.x, this.renderHitbox.position.y, map.tileSize, map.tileSize);
   fill(colors[c]);
   rect(collisionsHitbox.position.x,collisionsHitbox.position.y,collisionsHitbox.size.x, collisionsHitbox.size.y);
  }
  
}
