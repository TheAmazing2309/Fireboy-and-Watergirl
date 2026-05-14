import java.util.*;
import java.io.*;
public class Map{
  private int tileSize;
  private int levelWidth;
  private int levelHeight;
  private int scale;
  private Tile[][] tileMap;
  
  public Map(int lw, int lh, int scale, int level){
    try{
      tileSize = scale * Tile.size;
      levelWidth = lw;
      levelHeight = lh;
      this.scale = scale;
      tileMap = new Tile[lw][lh];
      Scanner sc = new Scanner(new File(level+".txt"));
      for (int i = 0; i < lh; i++){
        String line = sc.nextLine();
        for (int j = 0; j < lw; j++){
          switch (line.charAt(j)){
            case ' ': tileMap[i][j] = new WallTile(createShape(RECT, j * tileSize, i * tileSize, tileSize, tileSize), false); break;
            case '#': tileMap[i][j] = new WallTile(createShape(RECT, j * tileSize, i * tileSize, tileSize, tileSize), true); break;
            default: throw new IllegalArgumentException("Illegal char in level " + level);
          }
        }
      }
      sc.close();
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    }
  }
}
