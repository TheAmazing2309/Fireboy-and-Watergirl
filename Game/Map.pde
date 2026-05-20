import java.util.*;
public class Map{
  private int tileSize;
  private int levelWidth;
  private int levelHeight;
  public Tile[][] tileMap;
  public ButtonTile[] buttons;

  public Map(int level){
    String[] lines = loadStrings("levels/"+level+".txt");
    tileSize = scale * Tile.size;
    levelWidth = lines[0].length();
    levelHeight = lines.length;
    buttons = new ButtonTile[10];
    SlidingTile[] slidingTileTemp = new SlidingTile[10];
    //System.out.println(levelHeight + "x" + levelWidth);
    tileMap = new Tile[levelHeight][levelWidth];
    for (int i = 0; i < levelHeight; i++){
      String line = lines[i];
      //System.out.println(line + " " + line.length());
      for (int j = 0; j < levelWidth; j++){ // 0-9 button codes, )-( lever codes
        char el = line.charAt(j);
        if (el == ' ') tileMap[i][j] = new WallTile(new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), null);
        else if (el == '#') tileMap[i][j] = new WallTile(new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), true), new PImage[]{loadImage("sprites/test.png")});
        else if (el >= '0' && el <= '9'){ 
          tileMap[i][j] = new ButtonTile(new Hitbox(new PVector(j * tileSize, i * tileSize + tileSize * 0.8), new PVector(tileSize, tileSize * 0.2), true), null, null);
          buttons[el-'0'] = (ButtonTile)tileMap[i][j];
        }
        else if ((el >= 'a' && el <= 'j') || (el >= 'A' && el <= 'J') || (el >= 'k' && el <= 't') || (el >= 'K' && el <= 'T')){ 
          Tile temp;
          if (el >= 'a' && el <= 'j') {
            temp = new SlidingTile(new Hitbox(new PVector(j * tileSize, i*tileSize+tileSize*((i>0&&lines[i-1].charAt(j)==' ')?0:1-slidingTileThickness)), new PVector(tileSize, tileSize * slidingTileThickness), true), null, Left);
            el -= 'a';
          }
          else if (el >= 'A' && el <= 'J'){ 
            temp = new SlidingTile(new Hitbox(new PVector(j * tileSize, i*tileSize+tileSize*((i>0&&lines[i-1].charAt(j)==' ')?0:1-slidingTileThickness)), new PVector(tileSize, tileSize * slidingTileThickness), true), null, Right);
            el -= 'A';
          }
          else if (el >= 'k' && el <= 't'){
            temp = new SlidingTile(new Hitbox(new PVector(j * tileSize+tileSize*((j>0&&lines[i].charAt(j)==' ')?0:1-slidingTileThickness), i * tileSize), new PVector(tileSize * slidingTileThickness, tileSize), true), null, Top);
            el -= 'k';
          }
          else {
            temp = new SlidingTile(new Hitbox(new PVector(j * tileSize+tileSize*((j>0&&lines[i].charAt(j)==' ')?0:1-slidingTileThickness), i * tileSize), new PVector(tileSize * slidingTileThickness, tileSize), true), null, Bottom);
            el -= 'K';
          }
          tileMap[i][j] = temp;
          slidingTileTemp[el] = (SlidingTile)temp;
        }
        else throw new IllegalArgumentException("Illegal char in level " + level);
        }
      }
      for (int i = 0; i < 10; i++){
        if (slidingTileTemp[i] != null && buttons[i] != null){
          buttons[i].setTileLink(slidingTileTemp[i]);
        }
      }
    } 
  
  public void render(){
    for (int i = 0; i < levelHeight; i++){
      for (int j = 0; j < levelWidth; j++){
        tileMap[i][j].render();
      }
    }
  }
}
