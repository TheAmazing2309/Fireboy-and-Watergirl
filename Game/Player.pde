public class Player{
 float[][] hitbox;
 boolean fire;
 PVector position, velocity, acceleration;
 PImage[] animation;
 PVector speed = new PVector(1, 0);
PVector jump = new PVector(0, 3);
PVector gravity = new PVector(0, 0);
PVector friction = new PVector(.1, 0);
 
 public Player(boolean fire, PVector position, PImage[] animation, boolean[] inputs){
   this.fire = fire;
   this.position = position;
   this.animation = animation;
   velocity = new PVector(0,0);
   acceleration = new PVector(0,0);
 }
 
 public void move(){
  // if (w){
  //fireboy.apply(jump);
  //}
  //if (a){
  ////fireboy.apply(speed.mult(-1));
  //fireboy.position.add(-.6,0);
  //}
  //if (d){
  ////fireboy.apply(speed);
  //fireboy.position.add(.6,0);
  //}
  //if (up){
  //watergirl.apply(jump);
  //}
  //if (left){
  ////watergirl.apply(speed.mult(-1));
  //watergirl.position.add(-.6,0);
  //}
  //if (right){
  ////watergirl.apply(speed);
  //watergirl.position.add(.6,0);
  //}
  //if (fireboy.velocity.x > 2){
  //fireboy.apply(speed.mult(-1));
  //}
  //if (fireboy.velocity.x < -2){
  //fireboy.apply(speed);
  //}
  //if (watergirl.velocity.x > 2){
  //watergirl.apply(speed.mult(-1));
  //}
  //if (watergirl.velocity.x < -2){
  //watergirl.apply(speed);
  //}
  //if (!a && !d && fireboy.velocity.x < 0){
  //fireboy.apply(friction);
  //}
  //if (!a && !d && fireboy.velocity.x > 0){
  //fireboy.apply(friction.mult(-1));
  //}
  //if (!left && !right && watergirl.velocity.x < 0){
  //watergirl.apply(friction);
  //}
  //if (!left && !right && watergirl.velocity.x > 0){
  //watergirl.apply(friction.mult(-1));
  //}
  //watergirl.apply(gravity);
  //fireboy.apply(gravity);
    acceleration.add(gravity);
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
