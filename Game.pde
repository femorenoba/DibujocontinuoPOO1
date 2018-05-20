/**
 Para cambiar el 'nivel' presione cualquier tecla
 */
PImage img;
Graph[] levels;
// total, current por defecto vale 0
int total, current, clicked,gameover,initial;
double count2;
float[]play=new float [4];
int aux=0;
String []file = {"nodeslvl0.csv","nodeslvl1.csv","nodeslvl2.csv","nodeslvl3.csv","nodeslvl4.csv"};
String []file2= {"Connectlvl0.csv","Connectlvl1.csv","Connectlvl2.csv","Connectlvl3.csv","Connectlvl4.csv"};

void setup() {
  size(600, 700);
  img = loadImage("fondo.jpg");
  image(img, 0, 0);
  
  // numero total de niveles
  total = 5;
  levels = new Graph[total];
  for (int i = 0; i < levels.length; i++)
   levels[i] = new Graph(file[i],file2[i]);
}

void draw() { 
   fill(150,0,150); rect(150,550,100,45,7); fill(0,0,0); textSize(32);text("Next",160,580); 
   fill(150,0,150); rect(350,550,100,45,7);fill(0,0,0); textSize(32);text("Reset",360,580);
 
  if(initial==0){
  levels[current].display(); 
  initial++; }
  
  else if (initial==1){
    levels[current].compare();
}}

void mousePressed() {
  if(150 <= mouseX && mouseX <= 250 && 550 <= mouseY && mouseY <= 650){
    clicked=0;image(img, 0, 0); initial=0; count2=0;gameover=0;image(img, 0, 0);
    
    levels[current].reset();
    if (current <total-1)
    current++;
    else
      current=0;
  }
  if(350 <= mouseX && mouseX <= 450 && 550 <= mouseY && mouseY <= 650){
    initial=0;count2=0;clicked=0;gameover=0;image(img, 0, 0);
    levels[current].reset();
  }}
 
void mouseClicked(){

 levels[current].letsplay(); 
}
