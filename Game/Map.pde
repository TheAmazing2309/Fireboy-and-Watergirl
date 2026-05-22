import java.util.*;
public class Map{
  private int tileSize;
  private int levelWidth;
  private int levelHeight;
  public Tile[][] tileMap;
  public ButtonTile[] buttons;
  public DoorTile[] doors;

  public Map(int level){
    String[] lines = loadStrings("levels/"+level+".txt");
    tileSize = (int)(scale * Tile.size);
    levelWidth = lines[0].length();
    levelHeight = lines.length;
    buttons = new ButtonTile[10];
    doors = new DoorTile[2];
    SlidingTile[] slidingTileTemp = new SlidingTile[10];
    //System.out.println(levelHeight + "x" + levelWidth);
    tileMap = new Tile[levelHeight][levelWidth];
    for (int i = 0; i < levelHeight; i++){
      String line = lines[i];
      //System.out.println(line + " " + line.length());
      for (int j = 0; j < levelWidth; j++){ // 0-9 button codes, )-( lever codes
        char el = line.charAt(j);
        if (el == ' ') tileMap[i][j] = new WallTile(new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), null);
        else if (el == '#') tileMap[i][j] = new WallTile(new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), true), new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), new PImage[]{loadImage("sprites/test.png")});
        else if (el >= '0' && el <= '9'){ 
          tileMap[i][j] = new ButtonTile(new Hitbox(new PVector(j * tileSize, i * tileSize + tileSize * 0.8), new PVector(tileSize, tileSize * 0.2), true), new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), true), null, null);
          buttons[el-'0'] = (ButtonTile)tileMap[i][j];
        }
        else if ((el >= 'a' && el <= 'j') || (el >= 'A' && el <= 'J')){ 
          Tile temp;
          if (el >= 'a' && el <= 'j') {//Left
            temp = new SlidingTile(new Hitbox(new PVector(j * tileSize, i*tileSize+tileSize*((i>0&&lines[i-1].charAt(j)==' ')?0:1-slidingTileThickness)), new PVector(tileSize, tileSize * slidingTileThickness), true), new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), null, Left);
            el -= 'a';
          }
          else if (el >= 'A' && el <= 'J'){ //Right
            temp = new SlidingTile(new Hitbox(new PVector(j * tileSize, i*tileSize+tileSize*((i>0&&lines[i-1].charAt(j)==' ')?0:1-slidingTileThickness)), new PVector(tileSize, tileSize * slidingTileThickness), true), new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), null, Right);
            el -= 'A';
          }
          else if (el >= 'k' && el <= 't'){ //Top
            temp = new SlidingTile(new Hitbox(new PVector(j * tileSize+tileSize*((j>0&&lines[i].charAt(j)==' ')?0:1-slidingTileThickness), i * tileSize), new PVector(tileSize * slidingTileThickness, tileSize), true), new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), null, Top);
            el -= 'k';
          }
          else { //Bottom
            temp = new SlidingTile(new Hitbox(new PVector(j * tileSize+tileSize*((j>0&&lines[i].charAt(j)==' ')?0:1-slidingTileThickness), i * tileSize), new PVector(tileSize * slidingTileThickness, tileSize), true), new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), null, Bottom);
            el -= 'K';
          }
          tileMap[i][j] = temp;
          slidingTileTemp[el] = (SlidingTile)temp;
        }
        else if (el == ']' || el == '['){
          boolean fire = (el == ']');
          int index = 0;
          if (doors[0] != null) index = 1;
          doors[index] = new DoorTile(new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), new Hitbox(new PVector(j * tileSize, (i-1) * tileSize), new PVector(tileSize, tileSize * 2), false), null, fire);
          tileMap[i][j] = doors[index];
        }
        else throw new IllegalArgumentException("Illegal char in level " + level);
        }
      }
      println(Arrays.toString(slidingTileTemp));
      println(Arrays.toString(buttons));
      for (int i = 0; i < 10; i++){
        if (buttons[i] != null){
          System.out.println("HEllo");
          println(Arrays.toString(slidingTileTemp));
          buttons[i].setTileLink(slidingTileTemp[i]);
        }
      }
    } 
  
  public void render(boolean all){
    for (int i = 0; i < levelHeight; i++){
      for (int j = 0; j < levelWidth; j++){
        if (all) tileMap[i][j].render();
        if (!all && tileMap[i][j].animation == null){
          //println(tileMap[i][j]);
          tileMap[i][j].render();
        }
      }
    }
  }
  
  public void resetButtons(){
    for (ButtonTile b : buttons){
      if (b != null) b.openThisFrame = false;
    }
  }
  
  public void applyButtons(){
    for (ButtonTile b : buttons){
      if (b != null && !b.openThisFrame && b.tileLink != null) b.deactivate();
    }
  }
  /*
  public void updateSlidingTiles(){
    for (int i = 0; i < buttons.length; i++){
      if (buttons[i] == null || buttons[i].tileLink == null) continue;
      fireboy.hitbox.collide(buttons[i].tileLink.hitbox);
      println(Arrays.toString(fireboy.hitbox.collisions));
      if (fireboy.hitbox.collisions[Bottom]) buttons[i].activate();
      else buttons[i].deactivate();
      
      watergirl.hitbox.collide(buttons[i].tileLink.hitbox);
      println(Arrays.toString(watergirl.hitbox.collisions));
      if (watergirl.hitbox.collisions[Bottom]) buttons[i].activate();
      else buttons[i].deactivate();
    }
  }
  */
}
