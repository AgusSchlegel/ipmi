PImage Logo,Carlos,James,Kendall,Logan,Grupo; 
PFont BTR;
int PosXLogo,PosYLogo,TamXLogo,TamYLogo,PosXC,PosYC,PosXJ,PosYJ,PosXK,PosYK,PosXL,PosYL,PosXG,PosYG,PosXRect,PosYRect,TamXRect,TamYRect,TamXG,TamYG,Opacidad,Frame,Caracter1,Caracter2,Caracter3,Fase,PosXText;
boolean Boton,Terminado;
String Texto1,Texto2;

void setup(){
  size(640,480);
  Logo = loadImage("data/BTRLOGO.png");
  Carlos = loadImage("data/Carlos.png");
  James = loadImage("data/James.png");
  Kendall = loadImage("data/Kendall.png");
  Logan = loadImage("data/Logan.png");
  Grupo = loadImage("data/BTRGrupo.png");
  BTR = createFont("data/VivelaRivoluzione.ttf",38);
  TamXRect = 0;
  TamYRect = 0;
  Opacidad = 255;
  Frame = 0;
  Caracter1 = 0;
  Caracter2 = 0;
  Caracter3 = 0;
  Fase = 1;
  PosXLogo = 192;
  PosYLogo = 70;
  TamXLogo = 256;
  TamYLogo = 170;
  PosXG = 92;
  PosYG = 480;
  TamXG = 455;
  TamYG = 256;
  PosXText = -100;
  Boton = false;
  Terminado = false;
  Texto1 = "Big Time Rush es una banda de pop creada para una serie de nickelodeon\n\nLa serie fue estrenada el 18 de enero del 2010 la cual cuenta con 4 temporadas, tambien sacaron una pelicula estrenada el 10 de marzo de 2012";
  Texto2 = "Como banda Big Time Rush saco 4 albumes, BTR en 2010, Elevate en 2011, 24/Seven en 2013 y Another Life en 2023.\n\nCuentan con 2.6M de reproducciones mensuales en spotify. ";
}

void draw(){
  background(255); // Fondo
  noStroke(); // Sin borde
  
  
  // Logo
  image(Logo,PosXLogo,PosYLogo,TamXLogo,TamYLogo); // Logo de la banda
  
  // Boton
  fill(155,Opacidad); // Color y opacidad del boton
  rect(270,335,100,50); // Boton
  fill(0,Opacidad); // Color y opacidad del texto
  textAlign(CENTER,CENTER); // Alineado del texto en su X e Y
  textFont(BTR); // Fuente de texto
  text("PLAY",320,360); // Texto y posicion
  println(Boton);
  
  if(Boton == true){
    image(Grupo,PosXG,PosYG,TamXG,TamYG);
    if(Opacidad > 0){
      Opacidad = Opacidad - 15;
    }
    if(PosYG >= 226 && Fase == 1 ){
        PosYG = PosYG - 2;
    }
    if(TamXLogo >= 128){
      TamXLogo = TamXLogo - 1;
     }
    if(TamYLogo >= 85){
      TamYLogo = TamYLogo - 1;  
    }
    if(PosXLogo >= 50 && Fase == 1 ){ 
      PosXLogo = PosXLogo - 1;
    }
    if(PosYLogo >= 25){ 
      PosYLogo = PosYLogo - 1;
    }
    if(PosXLogo <= 50){
      fill(0);
      textSize(24);
      if(Fase == 1){
        if(Terminado == false){
          if(Caracter1 < Texto1.length()){
            Caracter1 = Caracter1 + 1;
          }else{
            Terminado = true;
            Frame = frameCount;
          }    
        }
        text(Texto1.substring(0,Caracter1),185,10,400,250);
        if(Terminado == true){
          if(frameCount > Frame + 300){
            if(Caracter1 > 0){
              Caracter1 = Caracter1 - 1;
             }else{
             Fase = 2;
             Terminado = false;
             Frame = frameCount;
            }  
         }   
      }
    }
      else if(Fase == 2){
      if(Terminado == false){
        if(Caracter2 < Texto2.length()){
           Caracter2 = Caracter2 + 1; 
        }else {
          Terminado = true;
          Frame = frameCount;
        }
      }
      text(Texto2.substring(0,Caracter2),185,10,400,250);
      if(Terminado == true){
        if(frameCount > Frame + 300){
          if(Caracter2 > 0){
            Caracter2 = Caracter2 - 1;
           }else{
             Fase = 3;
             Terminado = false;
             Frame = frameCount;
            }  
          }   
        }
      }else if(Fase == 3){
        if(Terminado == false){
           if(PosYG < 480){
             PosYG = PosYG + 2;  
           }
          if(PosYG == 480){
            textAlign(CENTER,CENTER);
            textSize(80);
            text("INTEGRANTES",PosXText,240); 
            if(PosXText <= 320){
              PosXText = PosXText + 5;
              Frame = frameCount;
            }
           if(frameCount > Frame + 150){
             if(PosXText <= 800){
              PosXText = PosXText + 5;    
             }
            }
          }
        }
      }
    //text(mouseX + ","+ mouseY,50,20);
    }
  }
}
void mousePressed(){
  if(mouseX >= 270 && mouseX <= 370 && mouseY >= 335 && mouseY <= 385){
    Boton = true;
  }
}
