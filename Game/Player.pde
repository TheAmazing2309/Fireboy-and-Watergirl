public class Player{
  public Hitbox hitbox;
  
  PVector jump = new PVector(0, -2);
  PVector gravity = new PVector(0, .1);
  PVector friction = new PVector(.1, 0);
  float speed = 0.6;
  
  boolean fire;
  PVector velocity, acceleration;
  PImage[] animation;

 
  public Player(boolean fire, Hitbox hitbox, PImage[] animation){   
    this.fire = fire;
    this.hitbox = hitbox;
    this.animation = animation;
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
 }
 
 public void update(){
   if (fire){
     if (inputs[0]){
     this.apply(jump);
     }
     if (inputs[1]){
     this.hitbox.position.add(-speed,0);
     }
     if (inputs[2]){
     this.hitbox.position.add(speed,0);
     }
   }else{
     if (inputs[3]){
     this.apply(jump);
     }
     if (inputs[4]){
     this.hitbox.position.add(-speed,0);
     }
     if (inputs[5]){
     this.hitbox.position.add(speed,0);
     }
   }
    acceleration.add(gravity);
    velocity.add(acceleration);
    hitbox.position.add(velocity);
    acceleration.set(0, 0);
 }
 
 private void apply(PVector force){
   acceleration.add(force);
 }
 
 public void render(){
   fill(0);
   rect(hitbox.position.x,hitbox.position.y,hitbox.size.x, hitbox.size.y);
 }
 
 public void adjust(int dir, Tile other){
   if (dir == BOTTOM){
      this.hitbox.position.y = other.hitbox.position.y - this.hitbox.size.y;
   }
 }
 
 /*
 public Tile[] nearestTiles(){
   Tile a = map.tileMap[][]
 }
 */
}
