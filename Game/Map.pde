import java.util.*;
public class Map{
  private int tileSize;
  private int levelWidth;
  private int levelHeight;
  public Tile[][] tileMap;
  
  public Map(int level){
    String[] lines = loadStrings("levels/"+level+".txt");
    tileSize = scale * Tile.size;
    levelWidth = lines[0].length();
    levelHeight = lines.length;
    //System.out.println(levelHeight + "x" + levelWidth);
    tileMap = new Tile[levelHeight][levelWidth];
    for (int i = 0; i < levelHeight; i++){
      String line = lines[i];
      //System.out.println(line + " " + line.length());
      for (int j = 0; j < levelWidth; j++){
        switch (line.charAt(j)){
          case ' ': tileMap[i][j] = new WallTile(new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), null); break;
          case '#': tileMap[i][j] = new WallTile(new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), true), new PImage[]{loadImage("sprites/test.png")}); break;
          default: throw new IllegalArgumentException("Illegal char in level " + level);
        }
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
