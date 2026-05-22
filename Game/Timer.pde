public class Timer{
  long start;
  long pausedTime = 0;
  float time = 0;
  public long pause;
  
  public Timer(){
    start = System.nanoTime();
  }
  
  public void getTime(){
    time += (System.nanoTime() - pause)/1000000000.0;
    //if (gameState == PLAY){
    ////  pausedTime += System.nanoTime() - pause;
    //  System.out.println(time);
    //}
    pause = System.nanoTime();
  }
  
  public void render(){
    fill(255);
    rect(width/2 - 80, 60,200,-50);
    getTime();
    fill(0);
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
  
  public void resatrt(){
  time = 0;
  pausedTime = 0;
  }
  
}
