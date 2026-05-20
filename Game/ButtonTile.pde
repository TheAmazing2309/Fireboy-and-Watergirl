public class ButtonTile extends Tile{
  int code;
  
  public ButtonTile (Hitbox hitbox, PImage[] a, int code){
    super(hitbox, a);
    this.code = code;
  }
  
  public void activate(){
    map.activations.add(code);
  }
  
  @Override public void render(){
   fill(100 * code);
   rect(hitbox.position.x,hitbox.position.y,hitbox.size.x, hitbox.size.y);
  }
  
}
