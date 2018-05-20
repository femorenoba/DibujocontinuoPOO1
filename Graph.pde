
class Graph {
  // 1. Attributes 

  Node[] nodes;
  Line[] lines;
  PImage ganar,perder;
  int k,numlines;
  Table tableNodes;
  Table tableConnect;
 
  // 2. Constructors
  // 2.1. Default in this case dummy constructor
  
  Graph() { 
    for (int i = 0; i < nodes.length; i++)
      nodes[i] = i<5 ? new Circle() :new Triangle();
    // conecta todos los nodos en bucle
    
    for (int i = 0; i < lines.length; i++)
        lines[i] = i<5 ? new GuideLines(nodes[i], nodes[i]):new Dotted(nodes[i], nodes[i]);
  }
  // 2.2. Main constructor
  // file es un archico csv ubicado en la carpeta
  Graph(String file, String file2) {
    
   tableNodes = loadTable(file, "header");
   nodes = new Node[tableNodes.getRowCount()];
   
   for (int i= 0 ; i < tableNodes.getRowCount(); i++){
    TableRow row = tableNodes.getRow(i);
    int x = row.getInt("x");
    int y = row.getInt("y");
    nodes[i] = i<5 ? new Circle(new PVector(x,y), float (35)): new Triangle(new PVector(x,y),float(35));
    }
    
    tableConnect= loadTable(file2);
    int count=0;
    for (int i=0; i<tableConnect.getRowCount(); i++) {  
     for (int j=0; j<tableConnect.getRowCount(); j++) {
       float a= tableConnect.getFloat(i, j);
        if (a==1) {
        count++; }
      }}

    lines = new Line[count];
    int x=-1;
    for(int i=0;i<tableConnect.getRowCount();i++){
     for(int j=0;j< tableConnect.getRowCount();j++){
      if(tableConnect.getFloat(i, j)==1){
     x++;
     numlines++;
    
     lines[x]= i <3 ? new GuideLines(nodes[i], nodes[j]):new Dotted(nodes[i], nodes[j]);
      }}
    }      
  }

  void display() {
    
   for (int i = 0; i < nodes.length; i++)
      nodes[i].display();
      
    for (int i = 0; i < lines.length; i++)
      lines[i].display();
    
   
    }
  
  void letsplay() {

   switch(clicked) {
   case 0:
     for (int i=0; i<nodes.length; i++) 
      if (nodes[i].pick(mouseX, mouseY)) {
      play[0]=nodes[i].position.x;
      play[1]=nodes[i].position.y;
      k=i; }
      clicked++;
      break; 

    case 1:
      for (int i=0; i<nodes.length; i++) 
       if (nodes[i].pick(mouseX, mouseY)) {
       play[2]=nodes[i].position.x;
       play[3]=nodes[i].position.y;


    switch(tableConnect.getInt(i, k)) {
       case 0:
        break;
        
      case 1:
       //Dibujar la linea      
       for (int a=0; a<lines.length; a++) 
       if (((play[0]==lines[a].origin.position.x)&&(play[1]==lines[a].origin.position.y)&&(play[2]==lines[a].end.position.x)&&(play[3]==lines[a].end.position.y))||((play[0]==lines[a].end.position.x)&&(play[1]==lines[a].end.position.y)&&(play[2]==lines[a].origin.position.x)&&(play[3]==lines[a].origin.position.y))) {
       pushStyle();
       strokeWeight(12);
       stroke(250, 31, 78);
       line(play[0], play[1], play[2], play[3]);
       count2++;
       popStyle();
     }
       //cambiar valores sobre la tabla
     
     for (int c=0; c<tableConnect.getRowCount(); c++) {  
     for (int j=0; j<tableConnect.getRowCount(); j++) {
      float a= tableConnect.getFloat(c, j);
        if (a==1) {
       tableConnect.setInt(i, k, 3);}}}
       k=i;
       clicked++;
       break;
       
       case 3:
       println("game over");
       gameover=1;
       break;
      
     }}
      break;   
      case 2:
      play[0]=play[2];
      play[1]=play[3];
      clicked--;
      break;
    }
  }
 
  void reset(){
    for(int a=0;a<tableConnect.getRowCount();a++){
     for(int b=0;b< tableConnect.getRowCount();b++){
      if(tableConnect.getInt(a, b)==3){
      tableConnect.setInt(a, b, 1);
     }
   }
  }
  
  } 
 void compare() {
   if (count2==(numlines)) {
   ganar = loadImage("ganar.jpg");
  image(ganar, 0, 0);
    
    }

    if (gameover==1) {
  perder = loadImage("perder.jpg");
  image(perder, 0, 0);
      
     }
   }
}

 
