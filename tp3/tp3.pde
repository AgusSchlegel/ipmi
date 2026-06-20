/*
Schlegel Agustin
Comision 3
Tp 3
https://youtu.be/dYgsAj2xFlg
*/
PImage tp3;
int cant,tam,tono;
float mod;

void setup(){
  size(800,400);
  tp3 = loadImage("data/28.jpg");
  cant = 25;
  tam = 10;
  mod = 400/cant;  
}

void draw(){
  boolean estadoActual = obtenerEstadoClick();
  if(estadoActual == true){
    degrade(400,0,400,20,color(144, 52, 29),color(95, 115, 85));
  }else{
     degrade(400,0,400,20,color(67, 69, 149), color(144, 52, 29));   
  }
  image(tp3,0,0,400,400);
  rectMode(CENTER);
  noStroke();
  for(int f=1; f<cant; f++){
    for(int c=1;c<cant; c++){
      float posX = 400 + (f*mod);
      float posY = (c*mod);
      if(mouseX>=0){
        float distancia = dist(mouseX, mouseY, posX, posY);
        if(distancia < 20){
          tam = 14;
          if(estadoActual == true){
            fill(105, 119, 225);  
          }else{
            fill(114, 143, 85);
          }
        }else{
          tam = 10;
          if(estadoActual == true){
            fill(60, 78, 197);  
          }else{
            fill(95, 115, 85); 
          }
        }
      }
      if(f>=8 && f<=16){        
        if(c>=8 && c<=16){
          if(estadoActual == true){
            ellipse(posX, posY, tam, tam); 
          }else{
            rect(posX, posY, tam, tam);  
          }
        }else{
          if(estadoActual == true){
            rect(posX, posY, tam, tam); 
          }else{
            ellipse(posX, posY, tam, tam);  
            } 
          }
      }else{
        if(estadoActual == true){
          rect(posX, posY, tam, tam); 
        }else{
          ellipse(posX, posY, tam, tam);  
        }  
      }
    }
  }
}
