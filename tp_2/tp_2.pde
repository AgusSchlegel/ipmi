//Declaracion de variables:
PImage logoMine,Fondo,Cuadro1,Cuadro2,Cuadro3;
PFont Mine;
boolean TituloYBoton,CuadroPos;
int PosX,PosY,VelX,VelY,FrameDelCuadro,Caracter,Pantalla;
String Descripcion; 

void setup () {
  size(640,480); // Tamaño de la ventana
  logoMine = loadImage("data/Logo Minecraft.png"); // Carga de imagen en la variable
  Cuadro1 = loadImage("data/Cuadro1.png");// Carga de imagen en la variable
  Cuadro2 = loadImage("data/Cuadro2.jpg");// Carga de imagen en la variable
  Cuadro3 = loadImage("data/Cuadro3.jpg");// Carga de imagen en la variable
  Fondo = loadImage("data/Fondo Mine.jpg");// Carga de imagen en la variable
  Mine = createFont("data/Minecrafter.Reg.ttf",48);// Carga de fuente en la variable
  TituloYBoton = true; // Valor inicial del boolean
  VelY = 20;// Valor inicial de la velocidad de movimiento en el eje Y
  VelX = 15;// Valor inicial de la velocidad de movimiento en el eje X
  PosY = 480;// Valor inicial de la posicion en el eje Y
  PosX= -256;// Valor inicial de la posicion en el eje X
  FrameDelCuadro = 0;// Valor inicial del frame a guardar
  Caracter = 0; // Valor inicial de los caracteres en pantalla
  Descripcion = ""; // Descipcion empieza en vacio
  Pantalla = 1;
}

void draw(){
  println(frameCount);// Imprime en la consola el fotograma actual 
  strokeWeight(2); // Grosor del borde de las figuras
  textFont(Mine); // Fuente Personalizada
  image(Fondo,0,0); // Imagen de Fondo
  
  //Primera pantalla (de presentacion)
  if(TituloYBoton){ // Si TituloYBoton es true ejecuta el if
    dibujarTitulo(); // Dibuja el titulo
    dibujarBoton();// Dibuja el Boton
  }
  //Pasa a la siguiente pantalla
  else{
    Rectangulo(); // Rectangulo estatico de fondo pare descripcion de la imagen
    if(Pantalla == 1){
      Pantalla1();// Primera pantalla de cuadros
      }
      else if(Pantalla == 2){
        Pantalla2();
      }
      else if(Pantalla == 3){
        Pantalla3();  
      }
    } 
}
  void dibujarTitulo(){
    // Titulo
    fill(0,155); // Color del fondo titulo
    rect(155,50,330,170,20); // Fondo del titulo 
    image(logoMine,160,150,320,55); // Logo del titulo
    fill(#D1C6C1); // Color del texto del titulo
    text("EL ARTE\n   EN",215,95); // Titulo
  }
    void dibujarBoton(){
    // Boton
    fill(255); // Color del fondo del boton
    rect(270,400,100,50); // Boton
    fill(0); // Color del texto del boton
    textSize(32); // Tamaño del texto del boton
    text("PLAY",275,440); // Texto del boton
  }
  
  void Rectangulo(){
    // Fondo de descripciones
    fill(0,155); // Color del fondo de descripciones
    rect(330,PosY,300,280,25); // Fondo de descripciones
    if(PosY > 100){ // Se fija si el fondo llego a su poscion
      PosY = PosY - VelY; // Si no llego, se mueve de abajo hacia arriba
    }
    else{ // si ya llego a la PosY = 100
     fill(255); // Color del texto
     textSize(18);// Tamaño del texto
     textAlign(LEFT,TOP);// Alinea el texto arriba de todo a la izquierda de su posicion en X e Y
     String textoAnimado = Descripcion.substring(0, Caracter); // El substring lee a Descripcion y lo recorta en caracteres individuales, asignandole una posicion a cada uno
     text(textoAnimado, 350, 120); // Posicion del texto y variable global para el texto por cada pantalla
    }
  }
  
  void Pantalla1(){ //Primera Pantalla
    image(Cuadro1,PosX,100,256,256); // Primer cuadro
    fill(0,155); // Color del fondo del titulo del cuadro
    rect(PosX,350,256,60);// Fondo del titulo del cuadro
    if(CuadroPos){ // Se fija si CuadroPos es true
      if(frameCount > FrameDelCuadro){ // Se fija si ya pasaron los 5 segundos comparando el frameCount actual con el guardado anteriormente
        if(PosX > -300){ // Se fija si siguen adentro de la pantalla (comparando su PosX con un valor fijo de afuera)
          PosX = PosX - VelX; // Mueve el rectangulo y el cuadro a la izquierda para sacarlos de escena
        }
        if(PosX <= -256 && Caracter == 0){ // Entra al if si el cuadro se fue de escena y el texto se borro
          Pantalla = 2; // Iguala a la siguiente pantalla
          PosX = -256; // La posicion de PosX vuelve a su valor Inicial
          CuadroPos = false; // Cambia el valor a false para que siga funcionando la animacion
        }
        if(frameCount % 2 == 0){ // Entra al if cuando el frameCount sea par y dar mas tiempo entre letra y letra
          if(Caracter > 0){ // Si hay mas de 0 caracteres sigue borrando caracter a caracter
          if(Caracter > 5){
            Caracter = Caracter - 5; // Inicia la cantidad de caracteres en pantalla en 0
          }
          else{
            Caracter = Caracter - 1; // Inicia la cantidad de caracteres en pantalla en 0  
          }
          }
        }
      }
      else{
        if(Caracter < Descripcion.length()){ // Si la cantidad de caracteres es menor al largo de la descripcion (caracteres de la descripcion)
          if(frameCount % 2 == 0){ // Entra al if cuando el frameCount sea par y dar mas tiempo entre letra y letra
            Caracter = Caracter + 1; // A los caracteres en pantalla le suma 1  
          }
        }
      }
    }else{ //Si CuadroPos no es true, entra en el else
       PosX = PosX + VelX; // Como el rectangulo y el cuadro aun no estan en posicion, suma en PosX para moverlos (a la velocidad determinada por VelX)
       if(PosX >= 30){ // Se fija que PosX sea mayor o igual a 30
         CuadroPos = true; // Cambie el false a true ya que el rectangulo y el cuadro llegaron a su posicion
         FrameDelCuadro = frameCount + 600; // Al frameCount de cuando el rectangulo y el cuadro llegan a su posicion le suma 300 frames (5 segundos ya que son 60 frames por segundo) y lo guarda para comparar
         Descripcion = "Este cuadro es una\nrepresentacion del\nprimer nivel del video\njuego Donkey Kong.\n\n\n\nHecho por el artista\nKristoffer Zetterstrand"; // Descripcion final del cuadro
         }
       }
     fill(255); // Color del titulo de la foto
     textSize(14); // Tamaño de fuente
     textAlign(CENTER, CENTER); // Alinea el texto al centro de su coordenada x e y
     text("Donkey Kong \n de \n Kristoffer Zetterstrand",PosX + 128, 380); // texto y coordenadas (Con PosX asi respeta el movimiento del rectangulo)
    }
  void Pantalla2(){ //Segunda Pantalla
    image(Cuadro2,PosX,100,256,256); // Primer cuadro
    fill(0,155); // Color del fondo del titulo del cuadro
    rect(PosX,360,256,60);// Fondo del titulo del cuadro
    if(CuadroPos){ // Se fija si CuadroPos es true
      if(frameCount > FrameDelCuadro){ // Se fija si ya pasaron los 5 segundos comparando el frameCount actual con el guardado anteriormente
        if(PosX >= -300){ // Se fija si siguen adentro de la pantalla (comparando su PosX con un valor fijo de afuera)
          PosX = PosX - VelX; // Mueve el rectangulo y el cuadro a la izquierda para sacarlos de escena
        }
        if(PosX <= -256 && Caracter == 0){ // Entra al if si el cuadro se fue de escena y el texto se borro
          Pantalla = 3; // Iguala a la siguiente pantalla
          PosX = -256; // La posicion de PosX vuelve a su valor Inicial
          CuadroPos = false; // Cambia el valor a false para que siga funcionando la animacion
         }
         if(frameCount % 2 == 0){ // Entra al if cuando el frameCount sea par y dar mas tiempo entre letra y letra
          if(Caracter > 0){ // Si hay mas de 0 caracteres sigue borrando caracter a caracter
          if(Caracter > 8){
            Caracter = Caracter - 8; // Inicia la cantidad de caracteres en pantalla en 0
          }
          else{
            Caracter = Caracter - 1; // Inicia la cantidad de caracteres en pantalla en 0  
          }
          }
        }
      }
      else{
        if(Caracter < Descripcion.length()){ // Si la cantidad de caracteres es menor al largo de la descripcion (caracteres de la descripcion)
          if(frameCount % 2 == 0){ // Entra al if cuando el frameCount sea par y dar mas tiempo entre letra y letra
            Caracter = Caracter + 1; // A los caracteres en pantalla le suma 1  
          }
        }
      }
    }else{ //Si CuadroPos no es true, entra en el else
       PosX = PosX + VelX; // Como el rectangulo y el cuadro aun no estan en posicion, suma en PosX para moverlos (a la velocidad determinada por VelX)
       if(PosX >= 30){ // Se fija que PosX sea mayor o igual a 30
         CuadroPos = true; // Cambie el false a true ya que el rectangulo y el cuadro llegaron a su posicion
         FrameDelCuadro = frameCount + 600; // Al frameCount de cuando el rectangulo y el cuadro llegan a su posicion le suma 300 frames (5 segundos ya que son 60 frames por segundo) y lo guarda para comparar
         Descripcion = "Este cuadro es una\nrepresentacion del\nmapa del videojuego\nCounter Strike 1.6.\n\n\n\nHecho por el artista\nKristoffer Zetterstrand"; // Descripcion final del cuadro
         }
       }
     fill(255); // Color del titulo de la foto
     textSize(14); // Tamaño de fuente
     textAlign(CENTER, CENTER); // Alinea el texto al centro de su coordenada x e y
     text("De aztec 2 \n de \n Kristoffer Zetterstrand",PosX + 128, 390); // texto y coordenadas (Con PosX asi respeta el movimiento del rectangulo)
    }
      void Pantalla3(){ //Tercera Pantalla
    image(Cuadro3,PosX,100,256,256); // Primer cuadro
    fill(0,155); // Color del fondo del titulo del cuadro
    rect(PosX,360,256,60);// Fondo del titulo del cuadro
    if(CuadroPos){ // Se fija si CuadroPos es true
      if(frameCount > FrameDelCuadro){ // Se fija si ya pasaron los 5 segundos comparando el frameCount actual con el guardado anteriormente
        if(PosX >= -300){ // Se fija si siguen adentro de la pantalla (comparando su PosX con un valor fijo de afuera)
          PosX = PosX - VelX; // Mueve el rectangulo y el cuadro a la izquierda para sacarlos de escena
        }
        if(PosX <= -256 && Caracter == 0){ // Entra al if si el cuadro se fue de escena y el texto se borro
          Pantalla = 4; // Iguala a la siguiente pantalla
          PosX = -256; // la posicion de PosX vuelve a su valor Inicial
          CuadroPos = false; // Cambia el valor a false para que siga funcionando la animacion
         }
         if(frameCount % 2 == 0){ // Entra al if cuando el frameCount sea par y dar mas tiempo entre letra y letra
          if(Caracter > 0){ // Si hay mas de 0 caracteres sigue borrando caracter a caracter
          if(Caracter > 10){
            Caracter = Caracter - 10; // Inicia la cantidad de caracteres en pantalla en 0
          }
          else{
            Caracter = Caracter - 1; // Inicia la cantidad de caracteres en pantalla en 0  
          }
          }
        }
      }
      else{
        if(Caracter < Descripcion.length()){ // Si la cantidad de caracteres es menor al largo de la descripcion (caracteres de la descripcion)
          if(frameCount % 2 == 0){ // Entra al if cuando el frameCount sea par y dar mas tiempo entre letra y letra
            Caracter = Caracter + 1; // A los caracteres en pantalla le suma 1  
          }
        }
      }
    }else{ //Si CuadroPos no es true, entra en el else
       PosX = PosX + VelX; // Como el rectangulo y el cuadro aun no estan en posicion, suma en PosX para moverlos (a la velocidad determinada por VelX)
       if(PosX >= 30){ // Se fija que PosX sea mayor o igual a 30
         CuadroPos = true; // Cambie el false a true ya que el rectangulo y el cuadro llegaron a su posicion
         FrameDelCuadro = frameCount + 600; // Al frameCount de cuando el rectangulo y el cuadro llegan a su posicion le suma 300 frames (5 segundos ya que son 60 frames por segundo) y lo guarda para comparar
         Descripcion = "Este cuadro es una\nobra original del\nartista basada en\nlos estilos que mas\nle gustan al mismo una\nmezcla de arte clasico\ncon la estetica de los\nvideojuegos\n\n\nHecho por el artista\nKristoffer Zetterstrand"; // Descripcion final del cuadro
         }
       }
     fill(255); // Color del titulo de la foto
     textSize(14); // Tamaño de fuente
     textAlign(CENTER, CENTER); // Alinea el texto al centro de su coordenada x e y
     text("Skull On Fire \n de \n Kristoffer Zetterstrand",PosX + 128, 390); // texto y coordenadas (Con PosX asi respeta el movimiento del rectangulo)
    }
  void mousePressed() { // Reacciona al click del mouse
    if(TituloYBoton){ // Solo si se muestra la pantalla de presentacion, entra al mismo
      if (mouseX >= 270 && mouseX <= 370 && mouseY >= 400 && mouseY <= 450) { // Evalua que el mouse este en el espacio que ocupa el boton
      TituloYBoton = false; // Cambia el true a false por lo cual borra la pantalla de presentacion
        }
    }  
}
