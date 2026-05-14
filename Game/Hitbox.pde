public class Hitbox{
  public PVector position;
  public PVector size;
  public boolean[] collisions; // top,down,left,right
  
  public Hitbox(PVector p,PVector s){
    position = p;
    size = s;
    collisions = new boolean[]{false, false, false, false};
  }
  
  public void collide(Hitbox other){
    collisions = new boolean[]{false, false, false, false};
    if (this.position.x <= other.position.x + other.size.x){
      this.collisions[LEFT] = true;
      other.collisions[RIGHT] = true;
    }
    if (this.position.x + this.size.x >= other.position.x){
      this.collisions[RIGHT] = true;
      other.collisions[LEFT] = true;
    }
    if (this.position.y <= other.position.y + other.size.y){
      this.collisions[TOP] = true;
      other.collisions[BOTTOM] = true;
    }
    if (this.position.y + this.size.y >= other.position.y){
      this.collisions[BOTTOM] = true;
      other.collisions[BOTTOM] = true;
    }
  }
}
