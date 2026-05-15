import java.util.*;
public final int scale = 10;
public final int TOP = 0;
public final int BOTTOM = 1;
public final int LEFT = 2;
public final int RIGHT = 3;

Player a = new Player(new Hitbox(new PVector(0, 0), new PVector(100, 100)));
Player b = new Player(new Hitbox(new PVector(100, 0), new PVector(100, 100)));

void setup(){
  size(5*16*10, 5*16*10);
  Map map = new Map(1);
  map.render();
}

void draw(){
  a.hitbox.collide(b.hitbox);
  System.out.println(Arrays.toString(a.hitbox.collisions));
}

void keyPressed(){
  a.hitbox.position.x++;
}
//Testing branching!
