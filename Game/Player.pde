public class Player{
  public Hitbox hitbox;
  
  PVector jump = new PVector(0, -8);
  PVector gravity = new PVector(0, .5);
  float speed = 2;
  public final float activationDistance = 100;
  boolean fire;
  boolean canJump;
  PVector velocity, acceleration;
  PImage[] animation;

 
  public Player(boolean fire, Hitbox hitbox, PImage[] animation){   
    this.fire = fire;
    this.hitbox = hitbox;
    this.animation = animation;
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    canJump = false;
 }
 
 public void applyInputs(){
   if (fire){ //<>// //<>//
     if (inputs[0] && canJump && velocity.y == 0){
     this.apply(jump);
     canJump = false;
     }
     if (inputs[1]){
     this.hitbox.position.add(-speed,0);
     }
     if (inputs[2]){
     this.hitbox.position.add(speed,0);
     }
   }else{
     if (inputs[3] && canJump && velocity.y == 0){
     this.apply(jump);
     canJump = false;
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
 
 private void adjust(int dir, Tile other){
   if (dir == Bottom){
      this.hitbox.position.y = other.hitbox.position.y - this.hitbox.size.y;
      this.velocity = new PVector(0, 0);
      this.canJump = true;
   }
   if (dir == Top){
     this.hitbox.position.y = other.hitbox.position.y + other.hitbox.size.y + 1;
     this.velocity = new PVector(0, 0);
   }
   if (dir == Left){
     this.hitbox.position.x = other.hitbox.position.x + other.hitbox.size.x;
     //println(this.hitbox.position.x);
   }
   if (dir == Right){
     this.hitbox.position.x = other.hitbox.position.x - this.hitbox.size.x - 1;
   }
 }
 
 public void applyAdjustments(){
  // ArrayList<Tile> tiles = nearestTiles();
   int startX = Math.max(0, (int)this.hitbox.position.x/(Tile.size*scale)-1);
   int startY = Math.max(0, (int)this.hitbox.position.y/(Tile.size*scale)-1);
   int endX = Math.min(map.tileMap[0].length - 1,(int)(this.hitbox.position.x+this.hitbox.size.x)/(Tile.size*scale) + 1);
   int endY = Math.min(map.tileMap.length - 1,(int)(this.hitbox.position.y+this.hitbox.size.y)/(Tile.size*scale) + 1);
   for (int i = startY; i <= endY; i++){
     for (int j = startX; j <= endX; j++){
       Tile tile = map.tileMap[i][j];
       this.hitbox.collide(tile.hitbox);
       for (int d = 0; d <= 3; d++){
          if (this.hitbox.collisions[d]){
           // System.out.println(tile + " x " + d);
            this.adjust(d, tile);
          }
        }
     }
   }
 }
 
 public void checkDoor(DoorTile a){
   if (Math.pow(this.hitbox.position.x - a.hitbox.position.x, 2) + Math.pow(this.hitbox.position.y - a.hitbox.position.y, 2) <= activationDistance){
   a.opened = true;
   }
 }

}
