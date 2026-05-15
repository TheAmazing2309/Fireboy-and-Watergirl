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
    this.collisions = new boolean[]{false, false, false, false};
    other.collisions = new boolean[]{false, false, false, false};
    
    float overlapLeft = other.position.x + other.size.x - this.position.x;
    float overlapRight = this.position.x + this.size.x - other.position.x;
    float overlapAbove = other.position.y + other.size.y - this.position.y;
    float overlapBelow = this.position.y + this.size.y - other.position.y;
    
    float smallestOverlap = Math.min(Math.min(overlapLeft, overlapRight), Math.min(overlapAbove, overlapBelow));
    
    if (overlapLeft == smallestOverlap){
      this.collisions[LEFT] = true;
      other.collisions[RIGHT] = true;
    }
    else if (overlapRight == smallestOverlap){
      this.collisions[RIGHT] = true;
      other.collisions[LEFT] = true;
    }
    else if (overlapAbove == smallestOverlap){
      this.collisions[TOP] = true;
      other.collisions[BOTTOM] = true;
    }
    else if (overlapBelow == smallestOverlap){
      this.collisions[BOTTOM] = true;
      other.collisions[BOTTOM] = true;
    }
  }
}
