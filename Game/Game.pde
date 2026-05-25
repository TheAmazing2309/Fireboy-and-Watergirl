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
public final int LEVELS = 5;
public final int HALFWIN = 6;
public final float slidingTileThickness = 0.4;
public boolean renderedMap = false;
public int gameState = 0;
public long pauseStart;
public int level = 1;  
public boolean L1,L2,L3,L4,L5,L6,L7;
public final color compleate = #00FF00;
public final color incompleate = #FF0000;
public Button B1 = new Button(5 * width/10,4 * height/10,20 * width/100,20 * height/100,incompleate, true);
public Button B2 = new Button(10 * width/10,4 * height/10,20 * width/100,20 * height/100,incompleate, true);
public Button B3 = new Button(15 * width/10,4 * height/10,20 * width/100,20 * height/100,incompleate, true);
public Button B4 = new Button(20 * width/10,4 * height/10,20 * width/100,20 * height/100,incompleate, true);
public Button B5 = new Button(25 * width/10,4 * height/10,20 * width/100,20 * height/100,incompleate, true);
public Button B6 = new Button(30 * width/10,4 * height/10,20 * width/100,20 * height/100,incompleate, true);
public Button B7 = new Button(35 * width/10,4 * height/10,20 * width/100,20 * height/100,incompleate, true);
public ArrayList<Button> levelList= new ArrayList<Button>();
public ArrayList<Button> titleButtonList= new ArrayList<Button>();
public ArrayList<Button> pauseButtonList= new ArrayList<Button>();
public ArrayList<Button> winButtonList= new ArrayList<Button>();
public ArrayList<Button> loseButtonList= new ArrayList<Button>();
public ArrayList<DoorTile> doorList= new ArrayList<DoorTile>(); //<>// //<>// //<>//
Player watergirl, fireboy; //<>//
PImage[] waterAnimation, fireAnimation;
boolean [] inputs = {false,false,false,false,false,false};
Timer timer = new Timer();
UI ui = new UI();
Map map;

void setup(){
  pixelDensity(1);
  textSize(50);
  size(1, 1);
  //textureMode(NORMAL);
  noStroke();
  map = new Map(level); //<>// //<>// //<>// //<>//
  windowResize((int)(scale*map.tileMap[0].length*Tile.size), (int)(scale*map.tileMap.length*Tile.size));
  map.render(true);
  watergirl = new Player(false, new Hitbox(map.waterStartPos, new PVector(10,10), true), waterAnimation);
  fireboy = new Player(true, new Hitbox(map.fireStartPos, new PVector(10,10), true), fireAnimation);
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
  //LEVELS
  levelList.add(B1);
  levelList.add(B2);
  levelList.add(B3);
  levelList.add(B4);
  levelList.add(B5);
  levelList.add(B6);
  levelList.add(B7);
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
    }else if (gameState == LEVELS){
    background(255);
    fill(255);
      for (int i = 0; i < levelList.size(); i++){
        levelList.get(i).render();
      }
    fill(0);
    textSize(30);
    text("1",3 * width/100,10 * height/100);
    text("2",6.5 * width/100,10 * height/100);
    text("3",10 * width/100,10 * height/100);
    text("4",13.5 * width/100,10 * height/100);
    text("5",17 * width/100,10 * height/100);
    text("6",20.5 * width/100,10 * height/100);
    text("7",24 * width/100,10 * height/100);
    }else if (gameState == HALFWIN){
    image(loadImage("sprites/winScreen2.png"),width/10, height/10,width/1.2,height/1.2);
    for (int i = 0; i < winButtonList.size(); i++){
        winButtonList.get(i).render();
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
  gameState %= 7;
  }
  if(key == ESC && gameState == PLAY){
    key = 0;
    pauseStart = System.nanoTime();
    gameState = PAUSE;
  }
  if(key == ESC && gameState == PAUSE){
    key = 0;
    timer.pausedTime = (System.nanoTime() - pauseStart)/1000000000.0;
    timer.time -= timer.pausedTime;
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
    }else if (gameState == WIN || gameState == HALFWIN){
      for (int i = 0; i < winButtonList.size(); i++){
      winButtonList.get(i).clicked();
      }
    }else if (gameState == LOSE){
       for (int i = 0; i < loseButtonList.size(); i++){
      loseButtonList.get(i).clicked();
      }
    }else if (gameState == LEVELS){
       for (int i = 0; i < levelList.size(); i++){
      levelList.get(i).clicked();
      }
    }
}
