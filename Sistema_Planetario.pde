//import gifAnimation.*;

//GifMaker ficherogif;

Planeta sol;
Planeta mercurio;
Planeta venus;
Planeta tierra;
Planeta luna;
Planeta marte;
Planeta jupiter;
Planeta ganimedes;

float rotacionX = -PI/6;

boolean subir_camara = false;
boolean bajar_camara = false;
boolean pausa = false;

void setup(){
  size(1600, 1000, P3D);
  strokeWeight(0);
  noFill();
  
  //ficherogif = new GifMaker( this, "sistema_planetario.gif");
  //ficherogif.setRepeat(0);

  sol = new Planeta("Sol", "sol.png", 0, PI/1024, 0, 100, PI/1024);
  mercurio = new Planeta("Mercurio", "mercurio.jpg", random(0, TWO_PI), PI/512, 150, 10, PI/128);
  venus = new Planeta("Venus", "venus.jpg", random(0, TWO_PI), PI/1024, 200, 15, PI/128);
  tierra = new Planeta("Tierra", "tierra.jpg", random(0, TWO_PI), PI/1340, 300, 25, PI/128);
  luna = new Planeta("Luna", "luna.jpg", random(0, TWO_PI), PI/128, 45, 8, PI/128);
  marte = new Planeta("Marte", "marte.jpg", random(0, TWO_PI), PI/1580, 400, 25, PI/128);
  jupiter = new Planeta("Jupiter", "jupiter.jpg", random(0, TWO_PI), PI/2024, 700, 40, PI/256);
  ganimedes = new Planeta("Ganimedes", "ganimedes.jpg", random(0, TWO_PI), PI/128, 60, 5, PI/128);
  
  noStroke();
}

void actualizar_perspectiva(){
  if(subir_camara && rotacionX > -PI/2){
    rotacionX -= PI/512;
  }
  
  if(bajar_camara && rotacionX < PI/2){
    rotacionX += PI/512;
  }
}

void imprime_leyenda(){
  textFont(createFont("Arial", 22));
  textAlign(LEFT, TOP);
  
  text("Para subir la perspectiva pulse \'Tecla Arriba\'", 28, 28);
  text("Para bajar la perspectiva pulse \'Tecla Abajo\'", 28, 56);
  text("Para pausar o reiniciar pulse \'Tecla Espacio\'", 28, 84);
  
  textFont(createFont("Arial", 18));
  textAlign(CENTER, CENTER);
}

void dibujaSistemaSolar(){

  imprime_leyenda();
  
  translate(width/2, height/2, 0);

  actualizar_perspectiva();
  
  rotateX(rotacionX);

  sol.dibuja_planeta(rotacionX, null);
  mercurio.dibuja_planeta(rotacionX, null);
  venus.dibuja_planeta(rotacionX, null);
  tierra.dibuja_planeta(rotacionX, null);;
  
  Punto pos_rel = tierra.getPosicionRelativa();
  luna.dibuja_planeta(rotacionX, pos_rel);
  
  marte.dibuja_planeta(rotacionX, null);
  jupiter.dibuja_planeta(rotacionX, null);
  
  pos_rel = jupiter.getPosicionRelativa();
  ganimedes.dibuja_planeta(rotacionX, pos_rel);

}

void draw(){
  //background(img_cielo);
  background(0);
  
  dibujaSistemaSolar();

  //ficherogif.addFrame();
}

void keyPressed(){
  if (key == CODED && keyCode == UP) {
    subir_camara = true;  
  }
  
  if (key == CODED && keyCode == DOWN) {
    bajar_camara = true;
  }
  
  if(key == ' '){
    if(pausa){
      pausa = false;
      loop();
    }else{
      pausa = true;
      noLoop();
    }
  }
  
  //if(key == 'r'){
  //  ficherogif.finish();
  //}
}

void keyReleased(){
  if (key == CODED && keyCode == UP) {
    subir_camara = false;  
  }
  
  if (key == CODED && keyCode == DOWN) {
    bajar_camara = false;
  }
}
