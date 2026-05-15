import java.util.*;
public final int scale = 10;
public final int TOP = 0;
public final int BOTTOM = 1;
public final int LEFT = 2;
public final int RIGHT = 3;

Player watergirl, fireboy;
PImage[] waterAnimation, fireAnimation;
boolean [] inputs = {false,false,false,false,false,false};

Map map;

void setup(){
  size(5*16*10, 5*16*10);
  map = new Map(1);
  map.render();
  watergirl = new Player(false, new Hitbox(new PVector(40,10), new PVector(10,10)), waterAnimation);
  fireboy = new Player(true, new Hitbox(new PVector(10,10), new PVector(10,10)), fireAnimation);
}

void draw(){
  background(255);
  map.render();
  watergirl.display();
  fireboy.display();
  watergirl.move();
  fireboy.move();
}


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
