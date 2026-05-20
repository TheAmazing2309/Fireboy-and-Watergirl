public class Timer{
  long start;
  long pausedTime;
  float time;
  
  public Timer(){
    start = System.nanoTime();
  }
  
  public void getTime(){
    time = (System.nanoTime() - start)/1000000000.0;
  }
  
  public void render(){
    String text = "";
    if ((int) time/60 < 10){
      text += "0";
    }
    if ((int)time % 60 < 10){
    text(text + (int) time/60 + " : " + "0" + (int)time % 60,width/2 - 70, 50);
    }else{
    text(text + (int) time/60 + " : " + (int)time % 60,width/2 - 70, 50);
    }
  }
  
}
