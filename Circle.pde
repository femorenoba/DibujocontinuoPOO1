/**
 Nodo de forma circular.
 */

public class Circle extends Node {
  @Override
  void display() {
    pushStyle();
    strokeWeight(5);
    stroke(255, 0, 255);
    fill(0, 255, 0);
    if (pick(mouseX, mouseY)) {
      stroke(0, 255, 0);
      fill(255, 0, 255);
    }
    ellipse(position.x, position.y, size, size);
    popStyle();
  }

  boolean pick(int x, int y) {
    return sqrt(sq(x-position().x) + sq(y-position().y)) <= size()/2;
    }

  public Circle(PVector p, Float s){
  super(p,s);
  }
  public Circle(){
  super();
  }}
