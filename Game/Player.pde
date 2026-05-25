public class Player{
  public Hitbox hitbox;
  PVector jump = new PVector(0, -9);
  PVector gravity = new PVector(0, .5);
  float speed = 2;
  public final float activationDistance = 1000;
  boolean fire;
  boolean canJump;
  PVector velocity, acceleration;
  PImage[] animation;
  float prevX;
  float prevY;
  
  //original info 
  float originalHitboxX,originalHitboxY ;
  PImage[] originalAnimation;
  
  public Player(boolean fire, Hitbox hitbox, PImage[] animation){   
    this.fire = fire;
    this.hitbox = hitbox;
    this.animation = animation;
    originalHitboxX = hitbox.position.x;
    originalHitboxY = hitbox.position.y;
    originalAnimation = animation;
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    canJump = false;
    prevX = hitbox.position.x;
    prevY = hitbox.position.y;
 }
  //<>// //<>// //<>// //<>// //<>//
 public void applyInputs(){ //<>// //<>// //<>//
     prevX = hitbox.position.x; //<>//
   prevY = hitbox.position.y; //<>// //<>// //<>// //<>// //<>//
   if (!fire){ //<>// //<>// //<>//
     if (inputs[0] && canJump && velocity.y == 0){ //<>//
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
   if(velocity.y < 8){
      acceleration.add(gravity);
   }
    velocity.add(acceleration);
    hitbox.position.add(velocity);
    acceleration.set(0, 0);
 }
 
 private void apply(PVector force){
   acceleration.add(force);
 }
 
 public void render(){
   //fill(255);
   //rect(prevX, prevY,  hitbox.size.x, hitbox.size.y);
   if (fire){
     fill(#FF0000);
   }else{
     fill(#0000FF);
   }
   rect(hitbox.position.x,hitbox.position.y,hitbox.size.x, hitbox.size.y);
   fill(0);
 }
 
 private void adjust(int dir, Tile other){
   
   if (dir == Bottom){
      this.hitbox.position.y = other.collisionsHitbox.position.y - this.hitbox.size.y;
      this.velocity = new PVector(0, 0);
      this.canJump = true;
      if (other instanceof ButtonTile && !((ButtonTile)other).openThisFrame){
        ((ButtonTile)other).activate();
        ((ButtonTile)other).openThisFrame = true;
      }
   }
   if (dir == Top){
     this.hitbox.position.y = other.collisionsHitbox.position.y + other.collisionsHitbox.size.y + 1;
     this.velocity = new PVector(0, 0);
   }
   if (dir == Left){
     this.hitbox.position.x = other.collisionsHitbox.position.x + other.collisionsHitbox.size.x + 1;
   }
   if (dir == Right){
     this.hitbox.position.x = other.collisionsHitbox.position.x - this.hitbox.size.x - 1;
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
       this.hitbox.collide(tile.collisionsHitbox);
       for (int d = 0; d <= 3; d++){
          if (this.hitbox.collisions[d]){
           // System.out.println(tile + " x " + d);
            if (!(tile instanceof LiquidTile)) this.adjust(d, tile);
            else{
              if (fire && ((LiquidTile)tile).fireAllergic) gameState = LOSE;
              if (!fire && ((LiquidTile)tile).waterAllergic) gameState = LOSE;
            }
          }
        }
     }
   }
   checkDoor(map.doors[0]);
   checkDoor(map.doors[1]);

   if (map.doors[0].opened && map.doors[1].opened){
     if(map.waterGemsCollected + map.fireGemsCollected == map.gems.size()){
       gameState = WIN;
     }else {
       gameState = HALFWIN;
     }
     
   }
   for (GemTile gem : map.gems) gem.detectCollision(this);

 }
 
 public void checkDoor(DoorTile a){
   //println(Math.pow(this.hitbox.position.x - a.collisionsHitbox.position.x, 2) + Math.pow(this.hitbox.position.y - a.collisionsHitbox.position.y, 2));
   //if (Math.pow(this.hitbox.position.x - a.collisionsHitbox.position.x, 2) + Math.pow(this.hitbox.position.y - a.collisionsHitbox.position.y, 2) <= activationDistance && this.fire == a.fire){
   if (this.hitbox.position.x >= a.renderHitbox.position.x && this.hitbox.position.x + this.hitbox.size.x <= a.renderHitbox.position.x + a.renderHitbox.size.x && this.hitbox.position.y >= a.renderHitbox.position.y && this.hitbox.position.y + this.hitbox.size.y <= a.renderHitbox.position.y + a.renderHitbox.size.y +1 && this.fire == a.fire){
     println("OPEN");
     a.opened = true;
   } else if (this.fire == a.fire){
     println("CLOSE");
     a.opened = false;
   }
 }
 
 public void reset(){
    hitbox.position.x = originalHitboxX;
    hitbox.position.y = originalHitboxY;
    animation = originalAnimation;
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    canJump = false;
    prevX = hitbox.position.x;
    prevY = hitbox.position.y;
 }

}
