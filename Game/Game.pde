import java.util.*;
public final int scale = 2;
public final int Top = 0;
public final int Bottom = 1;
public final int Left = 2;
public final int Right = 3;
public final int TITLE = 0;
public final int PLAY = 1;
public final int PAUSE = 2;
public final int WIN = 3;
public final int LOSE = 4;
public final float slidingTileThickness = 0.2;
public boolean renderedMap = false;
public int gameState = 0;
public ArrayList<Button> buttonList= new ArrayList<Button>();
public ArrayList<DoorTile> doorList= new ArrayList<DoorTile>();
Player watergirl, fireboy;
PImage[] waterAnimation, fireAnimation;
boolean [] inputs = {false,false,false,false,false,false};
Timer timer = new Timer();
UI ui = new UI();
Map map;

void setup(){
  //pixelDensity(1);
  textSize(50);
  size(1, 1);
  //textureMode(NORMAL);
  noStroke();
  map = new Map(1); //<>//
  windowResize((int)(scale*map.tileMap[0].length*Tile.size), (int)(scale*map.tileMap.length*Tile.size));
  map.render(true);
  watergirl = new Player(false, new Hitbox(new PVector(40,100), new PVector(10,10), true), waterAnimation);
  fireboy = new Player(true, new Hitbox(new PVector(80,100), new PVector(10,10), true), fireAnimation);
  buttonList.add(new Button(width/2,56 * height/100,width/10,height/30,color(#00FF00)));
}

void draw(){
    if (gameState == TITLE){
        background(255);
        image(loadImage("sprites/fireboyWallpaper2.jpg"),0,0,width,height);
      for (int i = 0; i < buttonList.size(); i++){
        buttonList.get(i).render("");
      }
    }else if (gameState == PLAY){
      if (!renderedMap) {
        renderedMap = true;
        background(255);
        map.render(true);
      }
      
      map.resetButtons();
      
      watergirl.applyInputs();
      fireboy.applyInputs();
      
      watergirl.applyAdjustments();
      fireboy.applyAdjustments();
      
      map.applyButtons();
      
      //background(255);
      map.render(false);
      timer.render();
      watergirl.render();
      fireboy.render();

      //int i = 0;
      //while(doorList.get(i).opened == true){
      //  i++;
      //  if(i == 2){
      //  gameState = 3;
      //  break;
      //  }
      //}
      
    }else if (gameState == PAUSE){
    image(loadImage("sprites/pauseScreen.png"),width/10, height/10,width/1.2,height/1.2);
    }else if (gameState == WIN){
    image(loadImage("sprites/winScreen.png"),width/10, height/10,width/1.2,height/1.2);
    //System.out.println("win");
    }else if (gameState == LOSE){
    image(loadImage("sprites/loseScreen.png"),width/10, height/10,width/1.2,height/1.2);
    }
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
  if (key == 'l'){
  gameState++;
  gameState %= 5;
  }
  //if(key == ESC && gameState == PLAY){
  //  gameState = PAUSE;
  //}
  //if(key == ESC && gameState == PAUSE){
  //  gameState = PLAY;
  //}
}

void keyReleased(){
  if (key == 'w' || key == 'W'){
    inputs[0] = false;
  }
  if (key == 'a' || key == 'A'){
    inputs[1] = false;
  }
  if (key == 'd' || key == 'D'){
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

void mouseClicked(){
    for (int i = 0; i < buttonList.size(); i++){
      buttonList.get(i).clicked();
    }
}
