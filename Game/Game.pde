import java.util.*;
public final int scale = 10;
public final int TOP = 0;
public final int BOTTOM = 1;
public final int LEFT = 2;
public final int RIGHT = 3;

Hitbox a = new Hitbox(new PVector(0, 201), new PVector(100, 100));
Hitbox b = new Hitbox(new PVector(201, 201), new PVector(100, 100));

void setup(){
  size(5*16*10, 5*16*10);
  Map map = new Map(1);
  map.render();
}

void draw(){
  a.collide(b);
  System.out.println(Arrays.toString(a.collisions));
}

void keyPressed(){
  a.position.x++;
}
//Testing branching!
