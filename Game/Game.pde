import java.util.*;
public final int scale = 10;
public final int Top = 0;
public final int Bottom = 1;
public final int Left = 2;
public final int Right = 3;

Player watergirl, fireboy;
PImage[] waterAnimation, fireAnimation;
boolean [] inputs = {false,false,false,false,false,false};

Map map;

void setup(){
  size(5*16*10, 5*16*10);
  map = new Map(1);
  map.render();
  watergirl = new Player(false, new Hitbox(new PVector(40,10), new PVector(10,10), true), waterAnimation);
  fireboy = new Player(true, new Hitbox(new PVector(10,10), new PVector(10,10), true), fireAnimation);
}

void draw(){
  
  watergirl.update();
  fireboy.update();
  
  for (int i = 0; i < map.tileMap.length; i++){
    for (int j = 0; j < map.tileMap[0].length; j++){
      watergirl.hitbox.collide(map.tileMap[i][j].hitbox);
    //  System.out.println(Arrays.toString(watergirl.hitbox.collisions));
      for (int d = 0; d <= 3; d++){
        if (watergirl.hitbox.collisions[d]){
          System.out.println(i + " " + j);
          watergirl.adjust(d, map.tileMap[i][j]);
        }
      }
    }
  }
  
  background(255);
  map.render();
  watergirl.render();
  fireboy.render();
  
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
