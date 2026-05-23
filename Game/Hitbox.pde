public class Hitbox{
  public PVector position;
  public PVector size;
  public boolean[] collisions; // top,down,left,right
  public boolean collisionsOn;
  
  public Hitbox(PVector p,PVector s, boolean collisionsOn){
    position = p;
    size = s;
    this.collisionsOn = collisionsOn;
    collisions = new boolean[]{false, false, false, false};
  }
  
  public Hitbox copy(){
    return new Hitbox(position, size, collisionsOn);
  }
  
  public void collide(Hitbox other){ //<>//
    //System.out.println(this.collisionsOn + " " + other.collisionsOn);
    
    this.collisions = new boolean[]{false, false, false, false};
    other.collisions = new boolean[]{false, false, false, false};
    if (!collisionsOn || !other.collisionsOn) return;
    if (this.position.x + this.size.x <= other.position.x || this.position.x >= other.position.x + other.size.x || this.position.y + this.size.y <= other.position.y || this.position.y >= other.position.y + other.size.y) return;
    
    float overlapLeft = other.position.x + other.size.x - this.position.x;
    float overlapRight = this.position.x + this.size.x - other.position.x;
    float overlapAbove = other.position.y + other.size.y - this.position.y;
    float overlapBelow = this.position.y + this.size.y - other.position.y;
    
    float smallestOverlap = Math.min(Math.min(overlapLeft, overlapRight), Math.min(overlapAbove, overlapBelow));
    
    if (overlapLeft == smallestOverlap){
      this.collisions[Left] = true;
      other.collisions[Right] = true;
    }
    else if (overlapRight == smallestOverlap){
      this.collisions[Right] = true;
      other.collisions[Left] = true;
    }
    else if (overlapAbove == smallestOverlap){
      this.collisions[Top] = true;
      other.collisions[Bottom] = true;
    }
    else if (overlapBelow == smallestOverlap){
      this.collisions[Bottom] = true;
      other.collisions[Top] = true;
    }
  }
}
