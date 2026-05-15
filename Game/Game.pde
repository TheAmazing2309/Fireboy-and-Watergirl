Player watergirl, fireboy;
boolean w,a,d,up,left,right;
PImage[] waterAnimation, fireAnimation;
boolean [] inputs = {w,a,d,up,left,right};
void setup(){
  size (1000,700);
  watergirl = new Player(false, new PVector(40,10), waterAnimation, inputs);
  fireboy = new Player(true, new PVector(10,10), fireAnimation, inputs);
  
}

void draw(){
  background(255);
  
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
  if (key == ' '){
    System.out.println("water: " + watergirl.velocity.x + " fire: " + fireboy.velocity.x);
    System.out.println(w + " " + a + " " + d + " " + left + " " + right + " " + up);
  }
}

void keyReleased(){
  if (key == 'w'){
    w = false;
  }
  if (key == 'a'){
    a = false;
  }
  if (key == 'd'){
    d = false;
  }
  if (keyCode == UP){
    up = false;
  }
  if (keyCode == LEFT){
    left = false;
  }
  if (keyCode == RIGHT){
    right = false;
  }
  
}
