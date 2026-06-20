void degrade(float x, float y, float tam, float cant, color col1, color col2){
  rectMode(CORNER);
  for ( int i=0; i< cant; i++) {
    float lado = map(i, 0, cant-1, tam, 0);
    noStroke();
    color col = (lerpColor(col1, col2, i / cant * 2.5));
    fill(col);
    pushMatrix();
    translate(x, y);
    rect(0, 0, lado, lado);
    popMatrix();
  }  
}
