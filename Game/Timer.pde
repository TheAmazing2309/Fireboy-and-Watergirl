public class Timer{
  long start;
  
  public Timer(){
    start = System.nanoTime();
  }
  
  public float getTime(){
    return (System.nanoTime() - start)/1000000000.0;
  }
  
  public void render(){
    String text = "";
    if ((int) getTime()/60 < 10){
      text += "0";
    }
    if ((int)getTime() % 60 < 10){
    text(text + (int) getTime()/60 + " : " + "0" + (int)getTime() % 60,width/2 - 70, 50);
    }else{
    text(text + (int) getTime()/60 + " : " + (int)getTime() % 60,width/2 - 70, 50);
    }
    
  }
  
}
