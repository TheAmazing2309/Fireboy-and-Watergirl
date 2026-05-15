public class Timer{
  long start;
  
  public Timer(){
    start = System.nanoTime();
  }
  
  public long getTime(){
    return System.nanoTime() - start;
  }
  
  public void render(){
    
  }
  
}
