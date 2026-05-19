public class Button{
   private float x1,y1,x2,y2;
   
   public Button(float x1, float y1, float x2, float y2){
     this.x1 = x1;
     this.y1 = y1;
     this.x2 = x2;
     this.y2 = y2;
   }
   
   public void render(String text){
     if (mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2){
       fill(180);
     }else{
     fill(100);
     }
     rect(x1,y1,x2,y2);
   }
   
   public void clicked(){
     if (mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2){
       
     }
   }


}
