/* 
Schlegel Agustin
Comisión 3
tp 1
abril 2026
*/
PImage img;

void setup() {
  size(800,400);
  img = loadImage("Data/MuralTp.jpg");
}

void draw() {
  background(#0490B4); //fondo
  fill(#F6333D);
  rect(595,200,75,210,80,80,100,00); // Parte del torso
  ellipse(580,275,105,105); // Hombro Der
  fill(#0B748A);
  rect(400,370,42,30,0,60,0,0); // Pierna Izq
  fill(#F6333D);
  rect(440,300,155,150); //Torso abajo
  fill(#0B748A);
  pushMatrix();
  translate(390,250);
  rotate(radians(-10));
  rect(0,0,50,50); // Brazo Izq
  popMatrix();
  fill(#F6333D);
  ellipse(450,275,75,75); // Hombro Izq
  ellipse(520,325,170,150); // Pecho
  stroke(1);
  pushMatrix();
  translate(510,210);
  rotate(radians(-5));
  ellipse(0,0,165,250); // Cabeza
  fill(#000000);
  triangle(-60, 50, -10, 50, -50, -60); //Ojo Izq (parte negra)
  triangle(60, 50, 10, 50, 50, -60); //Ojo Izq (parte blanca)
  fill(#FFFFFF);
  triangle(-50, 40, -15, 40, -48, -45); //Ojo Der (parte negra)
  triangle(50, 40, 15, 40, 48, -45); //Ojo Der (parte blanca)
  popMatrix();
  fill(#0B748A);
  pushMatrix();
  translate(640,180);
  rotate(radians(10));
  rect(0,0,65,250,90,80,0,0); // Torso Parte Azul
  popMatrix();
  fill(#F6333D);
  ellipse(720,220,100,100); // Brazo Der
  rect(675,312,60,30); // Pulgar parte 1
  pushMatrix();
  translate(680,250);
  rotate(radians(5));
  rect(0,0,25,65); // Pulgar parte 2
  popMatrix();
  ellipse(740,260,110,110); // Puño
  rect(770,250,25,80,5,5,5,0); // dedo
  rect(745,250,25,80,5,5,0,0); // dedo
  rect(720,250,25,80,5,5,0,0); // dedo
  rect(695,250,25,80,5,5,0,5); // dedo
  fill(#000000);
  ellipse(510,395,20,40); // Araña Torso
  ellipse(510,375,15,20); // Araña Cabeza
  pushStyle();
  strokeWeight(3);
  line(490,375,510,395); // Araña Pata
  line(530,375,510,395); // Araña Pata
  line(485,390,510,395); // Araña Pata
  line(535,390,510,395); // Araña Pata
  popStyle();
  image(img,0,0,400,400); // Imagen Mural
}
