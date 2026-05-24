public class GemTile extends Tile{

  public boolean fire;
  public boolean collected;
  public float activationDistance = 1000;
  
  public GemTile(Hitbox h1, Hitbox h2, PImage[] a, boolean r, boolean f){
    super(h1, h2, a, r);
    fire=f;
    collected=false;
  }
  
  public void detectCollision(Player p){
    if (collected) return;
    println(Math.pow((this.collisionsHitbox.position.x - p.hitbox.position.x), 2) + Math.pow((this.collisionsHitbox.position.y - p.hitbox.position.y), 2));
    println(p.fire + " " + fire);
    collected = (p.fire==fire) && (Math.pow((this.collisionsHitbox.position.x - p.hitbox.position.x), 2) + Math.pow((this.collisionsHitbox.position.y - p.hitbox.position.y), 2) <= activationDistance);
    if (collected){
      if (fire) map.fireGemsCollected++;
      else map.waterGemsCollected++;
    }
}
  
  @Override public void render(){
    image(loadImage("sprites/BackgroundTile.png"), this.renderHitbox.position.x, this.renderHitbox.position.y, map.tileSize, map.tileSize);
    if (!collected) image(animation[0], renderHitbox.position.x, renderHitbox.position.y);
  }
}
