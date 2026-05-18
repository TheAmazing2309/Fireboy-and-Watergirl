public class UI {
  public UI() {

  }
  public void display(int gameState){
      if (gameState == 0){
    //image();
    }else if (gameState == 1){
      background(255);
      map.render();
      timer.render();
      watergirl.display();
      fireboy.display();
      watergirl.move();
      fireboy.move();
    }else if (gameState == 2){
    //image();
    }else if (gameState == 3){
    //image();
    }else if (gameState == 4){
    //image();
    }
  }
}
