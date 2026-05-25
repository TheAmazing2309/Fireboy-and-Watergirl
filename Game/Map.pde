import java.util.*;
public class Map{
  private int tileSize;
  private int levelWidth;
  private int levelHeight;
  public Tile[][] tileMap;
  public ButtonTile[] buttons;
  public DoorTile[] doors;
  public ArrayList<GemTile> gems;
  public int waterGemsCollected = 0;
  public int fireGemsCollected = 0;
  public PVector waterStartPos;
  public PVector fireStartPos;

  public Map(int level){
    String[] lines = loadStrings("levels/"+level+".txt");
    tileSize = (int)(scale * Tile.size);
    levelWidth = lines[0].length();
    levelHeight = lines.length;
    buttons = new ButtonTile[10];
    gems = new ArrayList<GemTile>();
    doors = new DoorTile[2];
    SlidingTile[] slidingTileTemp = new SlidingTile[10];
    //System.out.println(levelHeight + "x" + levelWidth);
    tileMap = new Tile[levelHeight][levelWidth];
    for (int i = 0; i < levelHeight; i++){
      String line = lines[i];
      //System.out.println(line + " " + line.length());
      for (int j = 0; j < levelWidth; j++){ // 0-9 button codes, )-( lever codes
        char el = line.charAt(j);
        if (el == ' '||el=='.'||el==',') tileMap[i][j] = new WallTile(new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), new PImage[]{loadImage("sprites/BackgroundTile.png")}, true);
        if (el == '#') tileMap[i][j] = new WallTile(new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), true), new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), new PImage[]{loadImage("sprites/PlatformTile.png")}, false);
        else if (el >= '0' && el <= '9'){ 
          tileMap[i][j] = new ButtonTile(new Hitbox(new PVector(j * tileSize, i * tileSize + tileSize * 0.8), new PVector(tileSize, tileSize * 0.2), true), new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), true), null, null, true, el-'0');
          buttons[el-'0'] = (ButtonTile)tileMap[i][j];
        }
        else if ((el >= 'a' && el <= 'j') || (el >= 'A' && el <= 'J') || (el >= 'k' && el <= 't') || (el >= 'K' && el <= 'T')){ 
          Tile temp;
          if (el >= 'a' && el <= 'j') {//Left
          el -= 'a';
            temp = new SlidingTile(new Hitbox(new PVector(j * tileSize, i * tileSize + tileSize/2 - slidingTileThickness/2), new PVector(tileSize, tileSize * slidingTileThickness), true), new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), null, Left, true, el);
          }
          else if (el >= 'A' && el <= 'J'){ //Right
          el -= 'A';
            temp = new SlidingTile(new Hitbox(new PVector(j * tileSize, i * tileSize + tileSize/2 - slidingTileThickness/2), new PVector(tileSize, tileSize * slidingTileThickness), true), new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), null, Right, true,el);
          }
          else if (el >= 'k' && el <= 't'){ //Top
          el -= 'k';
            temp = new SlidingTile(new Hitbox(new PVector(j * tileSize + tileSize/2 -slidingTileThickness/2, i * tileSize), new PVector(tileSize * slidingTileThickness, tileSize), true), new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), null, Top, true,el);
          }
          else { //Bottom
          el -= 'K';
            temp = new SlidingTile(new Hitbox(new PVector(j * tileSize + tileSize/2 -slidingTileThickness/2, i * tileSize), new PVector(tileSize * slidingTileThickness, tileSize), true), new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), null, Bottom, true,el);
          }
          tileMap[i][j] = temp;
          slidingTileTemp[el] = (SlidingTile)temp;
        }
        else if (el == ']' || el == '['){
          boolean fire = (el == ']');
          int index = 0;
          if (doors[0] != null) index = 1;
          doors[index] = new DoorTile(new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), new Hitbox(new PVector(j * tileSize, (i+1) * tileSize - 48), new PVector(48, 48), false), (fire?new PImage[]{loadImage("sprites/FireboyDoor.png")}:new PImage[]{loadImage("sprites/WatergirlDoor.png")}), fire, true);
          tileMap[i][j] = new WallTile(new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), new PImage[]{loadImage("sprites/BackgroundTile.png")}, true);
        }
        else if (el == 'z' || el == 'y' || el == 'x'){
          tileMap[i][j] = new LiquidTile(new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), true), new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), null, (el=='z'||el=='x'), (el=='z'||el=='y'), true);
        }
        else if (el == '>' || el == '<'){
          tileMap[i][j] = new GemTile(new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), new Hitbox(new PVector(j * tileSize, i * tileSize), new PVector(tileSize, tileSize), false), ((el=='<')?new PImage[]{loadImage("sprites/FireGem.png")}:new PImage[]{loadImage("sprites/WaterGem.png")}), true, el=='<');
          gems.add((GemTile)tileMap[i][j]);
      }
      //else throw new IllegalArgumentException("Illegal char in level " + level + " " + el);
        if (el==',') fireStartPos = new PVector(j * tileSize, i * tileSize);
        if (el=='.') waterStartPos = new PVector(j * tileSize, i * tileSize);
        }
        
      }
      //println(Arrays.toString(slidingTileTemp));
      //println(Arrays.toString(buttons));
      for (int i = 0; i < 10; i++){
        if (buttons[i] != null){
          //System.out.println("HEllo");
          //println(Arrays.toString(slidingTileTemp));
          buttons[i].setTileLink(slidingTileTemp[i]);
        }
      }
    } 
  
  public void render(boolean all){
    for (int i = 0; i < levelHeight; i++){
      for (int j = 0; j < levelWidth; j++){
        if (all) tileMap[i][j].render();
        if (!all && tileMap[i][j].renderEveryFrame && !(tileMap[i][j] instanceof WallTile)){
          //println(tileMap[i][j]);
          tileMap[i][j].render();
        }
      }
    }
   for (int k = 0; k <=1 && !all; k++){
     Player temp;
     if (k==0) temp = fireboy;
     else temp = watergirl;
     int startX = Math.max(0, (int)temp.hitbox.position.x/(Tile.size*scale)-1);
     int startY = Math.max(0, (int)temp.hitbox.position.y/(Tile.size*scale)-1);
     int endX = Math.min(map.tileMap[0].length - 1,(int)(temp.hitbox.position.x+temp.hitbox.size.x)/(Tile.size*scale) + 1);
     int endY = Math.min(map.tileMap.length - 1,(int)(temp.hitbox.position.y+temp.hitbox.size.y)/(Tile.size*scale) + 1);
     for (int i = startY; i <= endY; i++){
       for (int j = startX; j <= endX; j++){
         if ((tileMap[i][j] instanceof WallTile) && tileMap[i][j].renderEveryFrame) tileMap[i][j].render();
       }
     }
   }
   doors[0].render();
   doors[1].render();
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
      //println(Arrays.toString(fireboy.hitbox.collisions));
      if (fireboy.hitbox.collisions[Bottom]) buttons[i].activate();
      else buttons[i].deactivate();
      
      watergirl.hitbox.collide(buttons[i].tileLink.hitbox);
      //println(Arrays.toString(watergirl.hitbox.collisions));
      if (watergirl.hitbox.collisions[Bottom]) buttons[i].activate();
      else buttons[i].deactivate();
    }
  }
  */
}
