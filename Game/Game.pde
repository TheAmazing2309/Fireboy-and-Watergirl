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
  map = new Map(1);
  windowResize(scale*map.tileMap[0].length*Tile.size, scale*map.tileMap.length*Tile.size);
  map.render();
  watergirl = new Player(false, new Hitbox(new PVector(40,100), new PVector(10,10), true), waterAnimation);
  fireboy = new Player(true, new Hitbox(new PVector(80,100), new PVector(10,10), true), fireAnimation);
  buttonList.add(new Button(50,50,200,200,color(#00FF00)));
}

void draw(){
    if (gameState == TITLE){
      for (int i = 0; i < buttonList.size(); i++){
        buttonList.get(i).render("Play");
      }
    }else if (gameState == PLAY){
      background(255);
      watergirl.applyInputs();
      fireboy.applyInputs();
      watergirl.applyAdjustments();
      fireboy.applyAdjustments();
      map.updateSlidingTiles();
      map.render();
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
    //image();
    }else if (gameState == WIN){
    //image();
    System.out.println("win");
    }else if (gameState == LOSE){
    //image();
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

void mouseClicked(){
    for (int i = 0; i < buttonList.size(); i++){
      buttonList.get(i).clicked();
    }
}
