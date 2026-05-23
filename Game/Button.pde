public class Button{
   private float x1,y1,x2,y2;
   private color c;
   
   public Button(float x1, float y1, float x2, float y2, color c){
     this.x1 = x1;
     this.y1 = y1;
     this.x2 = x2;
     this.y2 = y2;
     this.c = c;
   }
   
   public void render(String text){
     rectMode(RADIUS);
     if (mouseX > x1 - x2 && mouseX < x1 + x2 && mouseY > y1 - y2 && mouseY < y1 + y2){
     fill(180);
     }else{
     fill(c);
     }
     rect(x1,y1,x2,y2);
     fill(255);
     text(text,x1-40,y1);
     rectMode(CORNER);
   }
   
   public void clicked(){
     if (mouseX > x1 - x2 && mouseX < x1 + x2 && mouseY > y1 - y2 && mouseY < y1 + y2){
       if(this.equals(titleButtonList.get(0))){
         timer.pause = System.nanoTime();
         gameState = PLAY;
       }else if (this.equals(pauseButtonList.get(0))){
         gameState = TITLE;
       }else if (this.equals(pauseButtonList.get(1))){
         gameState = PLAY;
         //implement retry
         fireboy.reset();
         watergirl.reset();
       }else if (this.equals(pauseButtonList.get(2))){
         gameState = PLAY;
       }else if (this.equals(pauseButtonList.get(0))){
         
       }
     }
   }


}
