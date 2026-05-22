/* 
Schlegel Agustin
Comisión 3
tp 2
mayo 2026
*/
PImage Logo,Carlos,James,Kendall,Logan,Grupo,Disco1,Disco2,Disco3,Disco4,Disco5; 
PFont BTR;
int PosXD1,PosXD2,PosXD3,PosXD4,PosXD5,PosXLogo,PosYLogo,TamXLogo,TamYLogo,PosXC,PosXJ,PosXK,PosXL,PosXG,PosYG,TamXG,TamYG,Opacidad,Frame,Caracter1,Caracter2,Caracter3,Fase,PosXText,PosXText2,PosXText3,PosXText4,PosXText5,PosXText6;
boolean Boton,Terminado,Integrante,TerminadoDiscos;
String Texto1,Texto2;

void setup(){
  size(640,480);
  Logo = loadImage("data/BTRLOGO.png");
  Carlos = loadImage("data/Carlos.png");
  James = loadImage("data/James.png");
  Kendall = loadImage("data/Kendall.png");
  Logan = loadImage("data/Logan.png");
  Grupo = loadImage("data/BTRGrupo.png");
  Disco1 = loadImage("data/BTR-Disco.png");
  Disco2 = loadImage("data/Elevate-Disco.png");
  Disco3 = loadImage("data/24_Seven-Disco.png");
  Disco4 = loadImage("data/Another-Life-Disco.png");
  Disco5 = loadImage("data/Movie-Ep.png");
  BTR = createFont("data/VivelaRivoluzione.ttf",38);
  Opacidad = 255;
  Frame = 0;
  Caracter1 = 0;
  Caracter2 = 0;
  Caracter3 = 0;
  Fase = 0;
  PosXLogo = 192;
  PosYLogo = 70;
  TamXLogo = 256;
  TamYLogo = 170;
  PosXG = 92;
  PosYG = 480;
  TamXG = 455;
  TamYG = 256;
  PosXText = -100;
  PosXText2 = -100;
  PosXText3 = 800;
  PosXText4 = -150;
  PosXText5 = 800;
  PosXText6 = -150;
  PosXK = -305;
  PosXJ = 640;
  PosXC= -305;
  PosXL= 640;
  PosXD1 = -125;
  PosXD2 = 640;
  PosXD3 = -125;
  PosXD4 = 640;
  PosXD5 = -205;
  Boton = false;
  Terminado = false;
  TerminadoDiscos = false;
  Integrante = false;
  Texto1 = "Big Time Rush es una banda de pop creada para una serie de nickelodeon\n\nLa serie fue estrenada el 18 de enero del 2010 la cual cuenta con 4 temporadas, tambien sacaron una pelicula estrenada el 10 de marzo de 2012";
  Texto2 = "Cuentan con 2.6M de reproducciones mensuales en spotify.";
}

void draw(){
  background(255); 
  noStroke();
  image(Logo,PosXLogo,PosYLogo,TamXLogo,TamYLogo);
  println(Fase);
  if(Boton == false){ 
    fill(155,Opacidad); 
    rect(270,335,100,50); 
    fill(0,Opacidad); 
    textAlign(CENTER,CENTER); 
    textFont(BTR); 
    text("PLAY",320,360);
  }  
  if(Boton == true){
    image(Grupo,PosXG,PosYG,TamXG,TamYG);
    if(Opacidad > 0){
      Opacidad = Opacidad - 15;
    }
    if(PosYG >= 226 && Fase == 0){
        PosYG = PosYG - 2;
    }
    if(TamXLogo >= 128){
      TamXLogo = TamXLogo - 1;
     }
    if(TamYLogo >= 85){
      TamYLogo = TamYLogo - 1;  
    }
    if(PosXLogo >= 50 && Fase == 0){ 
      PosXLogo = PosXLogo - 1;
    }
    if(PosYLogo >= 25){ 
      PosYLogo = PosYLogo - 1;
    }
    if(PosXLogo <= 50 && Fase == 0){
      fill(0);
      textSize(24);
      Fase = 1;
    }else if(Fase == 1){
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
             }else if(Caracter1 == 0){
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
            text("DISCOGRAFIA",PosXText,240); 
            if(PosXText <= 320){
              PosXText = PosXText + 5;
              Frame = frameCount;
            }
           if(frameCount > Frame + 120){
             if(PosXText < 800){
              PosXText = PosXText + 5; 
             }else if(PosXText >= 800){
                Fase = 4;
                Terminado = true;
                Frame = frameCount;
              }
            }
          }
        }
      }else if(Fase == 4){
        if(Terminado == true){
          image(Disco1,PosXD1,120,125,125);
          image(Disco2,PosXD2,120,125,125);
          image(Disco3,PosXD3,280,125,125);
          image(Disco4,PosXD4,280,125,125);
          textSize(20);
          textAlign(CENTER,CENTER);
          text("BTR (2010)",PosXD1 + 65,265);
          text("Elevate (2011)",PosXD2 + 65,265);
          text("24/seven (2013)",PosXD3 + 65,425);
          text("Another Life (2023)",PosXD4 + 65,425);
          if(TerminadoDiscos == false && frameCount < Frame + 240){
            if(PosXD1 < 100 && PosXD2 > 415 && PosXD3 < 100 && PosXD4 > 415){
              PosXD1 = PosXD1 + 5;
              PosXD2 = PosXD2 - 5;
              PosXD3 = PosXD1 + 5;
              PosXD4 = PosXD2 - 5;
            }else{
              TerminadoDiscos = true;  
            }
          }
          if(frameCount > Frame + 240){
            if(PosXD1 >= -125 && PosXD2 <= 640 && PosXD3 >= -125 && PosXD4 <= 640){
              PosXD1 = PosXD1 - 5;
              PosXD2 = PosXD2 + 5;
              PosXD3 = PosXD3 - 5;
              PosXD4 = PosXD4 + 5;
            }else{
              TerminadoDiscos = false;
              Terminado = true;
              Fase = 5;
              Frame = frameCount;
            }
          }
        }
      }else if(Fase == 5){
        if(Terminado == true){
          image(Disco5,PosXD5,140,200,200);
          textSize(32);
          text("Big Time Rush Movie\n(EP 2012)",PosXD5 + 95,370);
          if(PosXD5 < 220){
            Frame = frameCount;
            PosXD5 = PosXD5 + 5;  
          }else if(frameCount > Frame + 120){
            if(PosXD5 < 650){
              PosXD5 = PosXD5 + 5;  
            }else{
              Fase = 6;
              Terminado = false;
              Frame = frameCount;
            }
          }
        }
      }else if(Fase == 6){
        if(Terminado == false){
          textAlign(CENTER,CENTER);
          textSize(80);
          text("INTEGRANTES",PosXText2,240);
          if(PosXText2 < 320){
            PosXText2 = PosXText2 + 5;
          }
          if(frameCount > Frame + 180){
            if(PosXText2 < 800){
              PosXText2 = PosXText2 + 5; 
            }else if(PosXText2 >= 800){
              Fase = 7;
              Terminado = true;
              Frame = frameCount;
            }
          }         
        }
      }else if(Fase == 7){
        if(Terminado == true){
          textSize(38);
          text("Kendall\nSchmidt",PosXText3,240);
          image(Kendall,PosXK,125,304,385);
          if(frameCount <= Frame + 71){
            PosXK = PosXK + 5;
            PosXText3 = PosXText3 - 5;
          }else{
            Integrante = true;
          }
          if(Integrante == true && frameCount >= Frame + 191 && frameCount < Frame + 262){
            PosXK = PosXK - 5;
            PosXText3 = PosXText3 + 5;            
          }else if(frameCount > Frame + 262){
            Fase = 8;
            Terminado = false;
            Frame = frameCount;
            Integrante = false;
          }
        }
      }else if(Fase == 8){
        if(Terminado == false){
          textSize(38);
          text("James\nMaslow",PosXText4,240);
          image(James,PosXJ,125,304,385);
          if(frameCount <= Frame + 71){
            PosXJ = PosXJ - 5;
            PosXText4 = PosXText4 + 5;
          }else{
            Integrante = true;
          }
          if(Integrante == true && frameCount >= Frame + 191 && frameCount < Frame + 262){
            PosXJ = PosXJ + 5;
            PosXText4 = PosXText4 - 5;            
          }else if(frameCount > Frame + 262){
            Fase = 9;
            Terminado = true;
            Frame = frameCount;
            Integrante = false;
          }
        }
      }else if(Fase == 9){
        if(Terminado == true){
          textSize(38);
          text("Carlos\nPena Jr.",PosXText5,240);
          image(Carlos,PosXC,125,304,385);
          if(frameCount <= Frame + 71){
            PosXC = PosXC + 5;
            PosXText5 = PosXText5 - 5;
          }else{
            Integrante = true;
          }
          if(Integrante == true && frameCount >= Frame + 191 && frameCount < Frame + 262){
            PosXC = PosXC - 5;
            PosXText5 = PosXText5 + 5;            
          }else if(frameCount > Frame + 262){
            Fase = 10;
            Terminado = false;
            Frame = frameCount;
            Integrante = false;
          }
        }
      }else if(Fase == 10){
        if(Terminado == false){
          textSize(38);
          text("Logan\nHenderson",PosXText6,240);
          image(Logan,PosXL,125,304,385);
          if(frameCount <= Frame + 71){
            PosXL = PosXL - 5;
            PosXText6 = PosXText6 + 5;
          }else{
            Integrante = true;
          }
          if(Integrante == true && frameCount >= Frame + 191 && frameCount < Frame + 262){
            PosXL = PosXL + 5;
            PosXText6 = PosXText6 - 5;            
          }else if(frameCount > Frame + 262){
            Fase = 11;
            Terminado = true;
            Frame = frameCount;
            Integrante = false;
          }
        }
      }else if(Fase == 11){
        if(Terminado == true){
          Opacidad = 255;
          fill(155,Opacidad); 
          rect(260,335,120,50); 
          fill(0,Opacidad); 
          textAlign(CENTER,CENTER); 
          text("Reiniciar",320,360);
        }
      }      
  }
}

void reiniciar (){
  Frame = 0;
  Caracter1 = 0;
  Caracter2 = 0;
  Caracter3 = 0;
  Fase = 0;
  PosXLogo = 192;
  PosYLogo = 70;
  TamXLogo = 256;
  TamYLogo = 170;
  PosXG = 92;
  PosYG = 480;
  TamXG = 455;
  TamYG = 256;
  PosXText = -100;
  PosXText2 = -100;
  PosXText3 = 800;
  PosXText4 = -150;
  PosXText5 = 800;
  PosXText6 = -150;
  PosXK = -305;
  PosXJ = 640;
  PosXC= -305;
  PosXL= 640;
  PosXD1 = -125;
  PosXD2 = 640;
  PosXD3 = -125;
  PosXD4 = 640;
  PosXD5 = -205;
  Boton = false;
  Terminado = false;
  TerminadoDiscos = false;
  Integrante = false; 
}
void mousePressed(){
  if(mouseX >= 270 && mouseX <= 370 && mouseY >= 335 && mouseY <= 385){
    Boton = true;
  }
  if(mouseX >= 260 && mouseX <= 380 && mouseY >= 335 && mouseY <= 385 && Fase == 11){
    reiniciar();
  }
}
