PImage tp3;
int cant,tam,tono;
float mod;
boolean click;

void setup(){
  size(800,400);
  tp3 = loadImage("data/28.jpg");
  cant = 25;
  tam = 10;
  mod = 400/cant; 
  click = false;
}

void draw(){
  if(click){
    for (int i = 0; i < 400; i++) {
      stroke(lerpColor(color(95, 115, 85), color(144, 52, 29), i / 400.200));
      line(400 + i, 0 , 400 + i, 400);
    } 
  }else{
    for (int i = 0; i < 400; i++) {
      stroke(lerpColor(color(144, 52, 29), color(67, 69, 149), i / 400.200));
      line(400 + i, 0 , 400 + i, 400);
    }   
  }
  image(tp3,0,0,400,400);
  fill(0);
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
          if(click){
            fill(105, 119, 225);  
          }else{
            fill(114, 143, 85);
          }
        }else{
          tam = 10;
          if(click){
            fill(60, 78, 197);  
          }else{
            fill(95, 115, 85); 
          }
        }
      }
      if(f>=8 && f<=16){        
        if(c>=8 && c<=16){
          if(click){
            ellipse(posX, posY, tam, tam); 
          }else{
            rect(posX, posY, tam, tam);  
          }
        }else{
          if(click){
            rect(posX, posY, tam, tam); 
          }else{
            ellipse(posX, posY, tam, tam);  
            } 
          }
      }else{
        if(click){
          rect(posX, posY, tam, tam); 
        }else{
          ellipse(posX, posY, tam, tam);  
        }  
      }
    }
  }
}

void mouseClicked(){
  click = !click;
}
