

public class Triangle extends Node {
  
  @Override
  void display() {
    pushStyle();
    rectMode(CENTER);
    strokeWeight(5);
    stroke(255, 20, 147);
    fill(255, 255, 0);
    if (pick(mouseX, mouseY)) {
      stroke(255, 255, 0);
      fill(255, 20, 147);
    }
    triangle(position.x, position.y - 20, position.x - 20, position.y + 20, position.x + 20, position.y + 20);
    popStyle();
  }

  @Override
  boolean pick(int x, int y) {
    return abs(x-position().x) <= size()/2 && abs(y-position().y) <= size()/2;
    }
 public Triangle(PVector p, Float s){
  super(p,s);
}
public Triangle(){
  super();
}}
