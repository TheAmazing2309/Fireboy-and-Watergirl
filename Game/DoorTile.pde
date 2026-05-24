public class DoorTile extends Tile{
  public boolean opened = false;
  public boolean fire;

  
  public DoorTile(Hitbox h1, Hitbox h2, PImage[] a, boolean fire, boolean r){
    super(h1, h2 ,a, r);
    this.fire = fire;
  }
/*
  @Override public void render(){
    
    //if (opened) fill(0, 255, 0);
    //else fill(255, 0, 0);
    image(animation[an);
  }
  */
}
