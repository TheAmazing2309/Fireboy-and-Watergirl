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
public ArrayList<Button> titleButtonList= new ArrayList<Button>();
public ArrayList<Button> pauseButtonList= new ArrayList<Button>();
public ArrayList<Button> winButtonList= new ArrayList<Button>();
public ArrayList<Button> loseButtonList= new ArrayList<Button>();
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
  map = new Map(1); //<>// //<>// //<>//
  windowResize((int)(scale*map.tileMap[0].length*Tile.size), (int)(scale*map.tileMap.length*Tile.size));
  map.render(true);
  watergirl = new Player(false, new Hitbox(new PVector(40,100), new PVector(10,10), true), waterAnimation);
  fireboy = new Player(true, new Hitbox(new PVector(80,100), new PVector(10,10), true), fireAnimation);
  //PLAY
  titleButtonList.add(new Button(width/2,56 * height/100,width/10,height/30,color(#00FF00), false));
  //END
  pauseButtonList.add(new Button(40.5 * width/100,58 * height/100,width/12,height/16,color(#00FF00), false));
  //RETRY
  pauseButtonList.add(new Button(64.5 * width/100,58 * height/100,width/12,height/16,color(#00FF00), false));
  //RESUME
  pauseButtonList.add(new Button(52.5 * width/100,74 * height/100,width/11,height/16,color(#00FF00), false));  
  //CONTINUE
  winButtonList.add(new Button(52.5 * width/100,78 * height/100,width/8.5,height/16,color(#00FF00), false));
  //RETRY
  loseButtonList.add(new Button(52 * width/100,70 * height/100,width/12,height/20,color(#00FF00), false));
  //MENU
  loseButtonList.add(new Button(31 * width/100,70 * height/100,width/12,height/20,color(#00FF00), false));
  //SKIP
  loseButtonList.add(new Button(74 * width/100,70 * height/100,width/12,height/20,color(#00FF00), false));
}

void draw(){
    if (gameState == TITLE){
      renderedMap = false;
        background(255);
        image(loadImage("sprites/fireboyWallpaper2.jpg"),0,0,width,height);
      for (int i = 0; i < titleButtonList.size(); i++){
        titleButtonList.get(i).render();
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
    renderedMap = false;
    for (int i = 0; i < pauseButtonList.size(); i++){
        pauseButtonList.get(i).render();
      }
    }else if (gameState == WIN){
    image(loadImage("sprites/winScreen.png"),width/10, height/10,width/1.2,height/1.2);
    //System.out.println("win");
    for (int i = 0; i < winButtonList.size(); i++){
        winButtonList.get(i).render();
      }
    }else if (gameState == LOSE){
    image(loadImage("sprites/loseScreen.png"),width/10, height/10,width/1.2,height/1.2);
    for (int i = 0; i < loseButtonList.size(); i++){
        loseButtonList.get(i).render();
      }
    }
}

//public static void reset(){
//  watergirl = new Player(false, new Hitbox(new PVector(40,100), new PVector(10,10), true), waterAnimation);
//  fireboy = new Player(true, new Hitbox(new PVector(80,100), new PVector(10,10), true), fireAnimation);
//}


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
    System.out.println(timer.time);
    System.out.println(watergirl.hitbox.position.x);
  }
  if (key == 'r'){
  watergirl.reset();
  }  
  if (key == 'l'){
  gameState++;
  gameState %= 5;
  }
  if(key == ESC && gameState == PLAY){
    key = 0;
    gameState = PAUSE;
  }
  if(key == ESC && gameState == PAUSE){
    key = 0;
    gameState = PLAY;
  }
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
    if (gameState == TITLE){
      for (int i = 0; i < titleButtonList.size(); i++){
      titleButtonList.get(i).clicked();
      }
    }else if (gameState == PAUSE){
      for (int i = 0; i < pauseButtonList.size(); i++){
      pauseButtonList.get(i).clicked();
      }
    }else if (gameState == WIN){
      for (int i = 0; i < winButtonList.size(); i++){
      winButtonList.get(i).clicked();
      }
    }else if (gameState == LOSE){
       for (int i = 0; i < loseButtonList.size(); i++){
      loseButtonList.get(i).clicked();
      }
    }
}
