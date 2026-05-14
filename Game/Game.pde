Player watergirl, fireboy;
boolean w,a,d,up,left,right;
PVector speed = new PVector(1, 0);
PVector jump = new PVector(0, 3);
PVector gravity = new PVector(0, 0);
PImage[] waterAnimation, fireAnimation;
void setup(){
  size (1000,700);
  watergirl = new Player(false, new PVector(40,10), waterAnimation);
  fireboy = new Player(true, new PVector(10,10), fireAnimation);
  
}

void draw(){
  if (w){
  fireboy.apply(jump);
  }
  if (a){
  fireboy.apply(speed.mult(-1));
  }
  if (d){
  fireboy.apply(speed);
  }
  
  if (up){
  watergirl.apply(jump);
  }
  if (left){
  watergirl.apply(speed.mult(-1));
  }
  if (right){
  watergirl.apply(speed);
  }
  
  watergirl.apply(gravity);
  fireboy.apply(gravity);
  watergirl.display();
  fireboy.display();
  watergirl.move();
  fireboy.move();
}
//Testing branching!

void keyPressed(){
  if (key == 'w'){
    w = true;
  }
  if (key == 'a'){
    a = true;
  }
  if (key == 'd'){
    d = true;
  }
  if (keyCode == UP){
    up = true;
  }
  if (keyCode == LEFT){
    left = true;
  }
  if (keyCode == RIGHT){
    right = true;
  }
  
}
