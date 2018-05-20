public class Dotted extends Line {
   @Override
   void display() {
    pushStyle();
    strokeWeight(9);
    stroke(130,130,130);
    for (int i = 0; i <= 10; i++) {
  float x = lerp(origin.position.x, end.position.x, i/15.0);
  float y = lerp(origin.position.y, end.position.y, i/15.0);
  point(x, y);
}
  popStyle(); } 
    
  public Dotted(Node node1, Node node2){
  super(node1,node2);
   }}
