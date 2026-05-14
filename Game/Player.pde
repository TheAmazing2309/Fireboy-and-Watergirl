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
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.set(0, 0);
 }
 
 public void apply(PVector force){
   acceleration.add(force);
 }
 
 public void display(){
 fill(0);
 square(position.x,position.y,10);
 }
 
 public void animate(){
   PImage currentimg;
  for (int i = 0; i < animation.length; i++){
    currentimg = animation[i];
    image(currentimg,position.x,position.y);
  }
 }
}
