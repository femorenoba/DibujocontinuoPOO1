public class GuideLines  extends Line {
   @Override
   void display() {
    pushStyle();
    strokeWeight(9);
    stroke(130,130,130);
    line(origin.position.x, origin.position.y, end.position.x, end.position.y);
    
    popStyle(); } 
    
  public GuideLines(Node node1, Node node2){
  super(node1,node2);
   }}
