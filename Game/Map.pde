public class Map{
  private int tileSize;
  private int levelWidth;
  private int levelHeight;
  private int scale;
  private Tile[][] tileMap;
  
  public Map(int lw, int lh, int scale, int level){
    tileSize = scale * Tile.size;
    levelWidth = lw;
    levelHeight = lh;
    this.scale = scale;
    tileMap = new Tile[lw][lh];
    String[] lines = loadStrings("levels/"+level+".txt");
    for (int i = 0; i < lh; i++){
      String line = lines[i];
      for (int j = 0; j < lw; j++){
        switch (line.charAt(j)){
          case ' ': tileMap[i][j] = new WallTile(new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize)), null, false); break;
          case '#': tileMap[i][j] = new WallTile(new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize)), new PImage[]{loadImage("sprites/test.png")}, true); break;
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
