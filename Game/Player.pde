public class Player{
 float[][] hitbox;
 boolean fire;
 PVector position, velocity, acceleration;
 PImage[] animation;
 
 public Player(boolean fire, PVector position, PImage[] animation){
   this.fire = fire;
   this.position = position;
   this.animation = animation;
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0);
 }
 
 public void move(){
 
 }
 
 public void animate(){
   PImage currentimg;
  for (int i = 0; i < animation.length; i++){
    currentimg = animation[i];
    image(currentimg,position.x,position.y);
  }
 }
}
