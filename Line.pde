
abstract class Line {
  // 1. Attributes
  Node origin, end;

  // 2. Constructors
  // 2.1. Default
  Line(Node node1, Node node2) {
    origin = node1;
    end = node2;
  }

  // 3. Methods

  abstract void display();

  
  // 3.3. Getters

  Node origin() {
    return origin;
  }
  Node end() {
    return end;
  }}

    


    
