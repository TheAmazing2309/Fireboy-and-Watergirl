public class Timer{
  long start;
  
  public Timer(){
    start = System.nanoTime();
  }
  
  public float getTime(){
    return (System.nanoTime() - start)/1000000000.0;
  }
  
  public void render(){
    text((int) getTime()/60 + " : " + (int)getTime() % 60,width/2, 50);
  }
  
}
