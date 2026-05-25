public class Button{
   private float x1,y1,x2,y2;
   public  color c;
   private boolean fill;
   
   public Button(float x1, float y1, float x2, float y2, color c, boolean fill){
     this.x1 = x1;
     this.y1 = y1;
     this.x2 = x2;
     this.y2 = y2;
     this.c = c;
     this.fill = fill;
   }
   
   public void render(){
     rectMode(RADIUS);
     if (fill){
       if (mouseX > x1 - x2 && mouseX < x1 + x2 && mouseY > y1 - y2 && mouseY < y1 + y2){
         fill(180);
       }else{
         fill(c);
       }
     }else{
     noFill();
     }
     rect(x1,y1,x2,y2);
     //fill(255);
     //text(text,x1-40,y1);
     rectMode(CORNER);
   }
   
   public void clicked(){
     if (mouseX > x1 - x2 && mouseX < x1 + x2 && mouseY > y1 - y2 && mouseY < y1 + y2){
       if(this.equals(titleButtonList.get(0))){
         timer.pause = System.nanoTime();
         timer.restart();
         gameState = PLAY;
       }else if (this.equals(pauseButtonList.get(0))){
         gameState = TITLE;
         fireboy.reset();
         watergirl.reset();
         timer.restart();
       }else if (this.equals(pauseButtonList.get(1))){
         gameState = PLAY;
         fireboy.reset();
         watergirl.reset();
         timer.restart();
         //implement retry
       }else if (this.equals(pauseButtonList.get(2))){
         gameState = PLAY;
         timer.pausedTime = (System.nanoTime() - pauseStart)/1000000000.0;
         timer.time -= timer.pausedTime;
       }else if (this.equals(winButtonList.get(0))){
         if(level == 1){
           L1 = true;
           B1.c = compleate;
         }else if(level == 2){
           L2 = true;
           B2.c = compleate;
         }else if(level == 3){
           L3 = true;
           B3.c = compleate;
         }else if(level == 4){
           L4 = true;
           B4.c = compleate;
         }else if(level == 5){
           L5 = true;
           B5.c = compleate;
         }else if(level == 6){
           L6 = true;
           B6.c = compleate;
         }else if(level == 7){
           L7 = true;
           B7.c = compleate;
         }
         gameState = LEVELS;
       }else if (this.equals(loseButtonList.get(0))){
         gameState = PLAY;
         //implement retry
         map.render(true);
         fireboy.reset();
         watergirl.reset();
         timer.restart();
       }else if (this.equals(loseButtonList.get(1))){
         gameState = TITLE;
         map.render(true);
         fireboy.reset();
         watergirl.reset();
         timer.restart();
       }else if (this.equals(loseButtonList.get(2))){
         if(level == 1){
           L1 = true;
           B1.c = compleate;
         }else if(level == 2){
           L2 = true;
           B2.c = compleate;
         }else if(level == 3){
           L3 = true;
           B3.c = compleate;
         }else if(level == 4){
           L4 = true;
           B4.c = compleate;
         }else if(level == 5){
           L5 = true;
           B5.c = compleate;
         }else if(level == 6){
           L6 = true;
           B6.c = compleate;
         }else if(level == 7){
           L7 = true;
           B7.c = compleate;
         }
         gameState = LEVELS;
       }else if (this.equals(levelList.get(0))){
         level = 1;
         map = new Map(level); //<>// //<>// //<>// //<>//
         windowResize((int)(scale*map.tileMap[0].length*Tile.size), (int)(scale*map.tileMap.length*Tile.size));
         watergirl = new Player(false, new Hitbox(map.waterStartPos, new PVector(10,10), true), waterAnimation);
         fireboy = new Player(true, new Hitbox(map.fireStartPos, new PVector(10,10), true), fireAnimation);
         map.render(true);
         timer.restart();
         gameState = PLAY;
       }else if (this.equals(levelList.get(1)) && L1){
         level = 2;
         map = new Map(level); //<>// //<>// //<>// //<>//
         windowResize((int)(scale*map.tileMap[0].length*Tile.size), (int)(scale*map.tileMap.length*Tile.size));
         watergirl = new Player(false, new Hitbox(map.waterStartPos, new PVector(10,10), true), waterAnimation);
         fireboy = new Player(true, new Hitbox(map.fireStartPos, new PVector(10,10), true), fireAnimation);
         map.render(true);
         timer.restart();
         gameState = PLAY;
       }else if (this.equals(levelList.get(2)) && L2){
         level = 3;
         map = new Map(level); //<>// //<>// //<>// //<>//
         windowResize((int)(scale*map.tileMap[0].length*Tile.size), (int)(scale*map.tileMap.length*Tile.size));
         watergirl = new Player(false, new Hitbox(map.waterStartPos, new PVector(10,10), true), waterAnimation);
         fireboy = new Player(true, new Hitbox(map.fireStartPos, new PVector(10,10), true), fireAnimation);
         map.render(true);
         timer.restart();
         gameState = PLAY;
       }else if (this.equals(levelList.get(3)) && L3){
         level = 4;
         map = new Map(level); //<>// //<>// //<>// //<>//
         windowResize((int)(scale*map.tileMap[0].length*Tile.size), (int)(scale*map.tileMap.length*Tile.size));
         watergirl = new Player(false, new Hitbox(map.waterStartPos, new PVector(10,10), true), waterAnimation);
         fireboy = new Player(true, new Hitbox(map.fireStartPos, new PVector(10,10), true), fireAnimation);
         map.render(true);
         timer.restart();
         gameState = PLAY;
       }else if (this.equals(levelList.get(4)) && L4){
         level = 5;
         map = new Map(level); //<>// //<>// //<>// //<>//
         windowResize((int)(scale*map.tileMap[0].length*Tile.size), (int)(scale*map.tileMap.length*Tile.size));
         watergirl = new Player(false, new Hitbox(map.waterStartPos, new PVector(10,10), true), waterAnimation);
         fireboy = new Player(true, new Hitbox(map.fireStartPos, new PVector(10,10), true), fireAnimation);
         map.render(true);
         timer.restart();
         gameState = PLAY;
       }else if (this.equals(levelList.get(5)) && L5){
         level = 6;
         map = new Map(level); //<>// //<>// //<>// //<>//
         windowResize((int)(scale*map.tileMap[0].length*Tile.size), (int)(scale*map.tileMap.length*Tile.size));
         watergirl = new Player(false, new Hitbox(map.waterStartPos, new PVector(10,10), true), waterAnimation);
         fireboy = new Player(true, new Hitbox(map.fireStartPos, new PVector(10,10), true), fireAnimation);
         map.render(true);
         timer.restart();
         gameState = PLAY;
       }else if (this.equals(levelList.get(6)) && L6){
         level = 7;
         map = new Map(level); //<>// //<>// //<>// //<>//
         windowResize((int)(scale*map.tileMap[0].length*Tile.size), (int)(scale*map.tileMap.length*Tile.size));
         watergirl = new Player(false, new Hitbox(map.waterStartPos, new PVector(10,10), true), waterAnimation);
         fireboy = new Player(true, new Hitbox(map.fireStartPos, new PVector(10,10), true), fireAnimation);
         map.render(true);
         timer.restart();
         gameState = PLAY;
       }
     }
   }


}
