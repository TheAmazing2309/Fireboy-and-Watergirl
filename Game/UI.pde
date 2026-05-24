public class UI {
  public boolean L1,L2,L3,L4,L5,L6,L7;
  public final color compleate = #00FF00;
  public final color incompleate = #FF0000;
  public final Button B1 = new Button(5 * width/10,4 * height/10,20 * width/100,20 * height/100,incompleate, true);
  public final Button B2 = new Button(10 * width/10,4 * height/10,20 * width/100,20 * height/100,incompleate, true);
  public final Button B3 = new Button(15 * width/10,4 * height/10,20 * width/100,20 * height/100,incompleate, true);
  public final Button B4 = new Button(20 * width/10,4 * height/10,20 * width/100,20 * height/100,incompleate, true);
  public final Button B5 = new Button(25 * width/10,4 * height/10,20 * width/100,20 * height/100,incompleate, true);
  public final Button B6 = new Button(30 * width/10,4 * height/10,20 * width/100,20 * height/100,incompleate, true);
  public final Button B7 = new Button(35 * width/10,4 * height/10,20 * width/100,20 * height/100,incompleate, true);
  public ArrayList<Button> levelList= new ArrayList<Button>();

  public UI() {
  levelList.add(B1);
  levelList.add(B2);
  levelList.add(B3);
  levelList.add(B4);
  levelList.add(B5);
  levelList.add(B6);
  levelList.add(B7);
  }
  public void redner(){
    background(255);
    fill(255);
      for (int i = 0; i < levelList.size(); i++){
        levelList.get(i).render();
      }
  }
}
