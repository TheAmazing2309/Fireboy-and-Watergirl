Player watergirl, fireboy;
//boolean w,a,d,up,left,right;
PImage[] waterAnimation, fireAnimation;
boolean [] inputs = {false,false,false,false,false,false};
void setup(){
  size (1000,700);
  watergirl = new Player(false, new PVector(40,10), waterAnimation);
  fireboy = new Player(true, new PVector(10,10), fireAnimation);
  
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
    inputs[0] = true;
  }
  if (key == 'a'){
    inputs[1] = true;
  }
  if (key == 'd'){
    inputs[2] = true;
  }
  if (keyCode == UP){
    inputs[3] = true;
  }
  if (keyCode == LEFT){
    inputs[4] = true;
  }
  if (keyCode == RIGHT){
    inputs[5] = true;
  }
  if (key == ' '){
    System.out.println("water: " + watergirl.velocity.x + " fire: " + fireboy.velocity.x);
    System.out.println(inputs[0] + " " + inputs[1] + " " + inputs[2] + " " + inputs[3] + " " + inputs[4] + " " + inputs[5]);
  }
}

void keyReleased(){
  if (key == 'w'){
    inputs[0] = false;
  }
  if (key == 'a'){
    inputs[1] = false;
  }
  if (key == 'd'){
    inputs[2] = false;
  }
  if (keyCode == UP){
    inputs[3] = false;
  }
  if (keyCode == LEFT){
    inputs[4] = false;
  }
  if (keyCode == RIGHT){
    inputs[5] = false;
  }
  
}
