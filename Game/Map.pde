import java.util.*;
public class Map{
  private int tileSize;
  private int levelWidth;
  private int levelHeight;
  public Tile[][] tileMap;
  public ArrayList<Integer> activations;
  
  public Map(int level){
    String[] lines = loadStrings("levels/"+level+".txt");
    tileSize = scale * Tile.size;
    levelWidth = lines[0].length();
    levelHeight = lines.length;
    activations = new ArrayList<Integer>();
    //System.out.println(levelHeight + "x" + levelWidth);
    tileMap = new Tile[levelHeight][levelWidth];
    for (int i = 0; i < levelHeight; i++){
      String line = lines[i];
      //System.out.println(line + " " + line.length());
      for (int j = 0; j < levelWidth; j++){ // 0-9 button codes, )-( lever codes
        char el = line.charAt(j);
        if (el == ' ') tileMap[i][j] = new WallTile(new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), null);
        else if (el == '#') tileMap[i][j] = new WallTile(new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), true), new PImage[]{loadImage("sprites/test.png")});
        else if (el >= '0' && el <= '9') tileMap[i][j] = new ButtonTile(new Hitbox(new PVector(j * tileSize, i * tileSize + tileSize * 0.8), new PVector(tileSize, tileSize * 0.2), true), null, el-'0');
        else throw new IllegalArgumentException("Illegal char in level " + level);
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
