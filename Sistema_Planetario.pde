//import gifAnimation.*;

//GifMaker ficherogif;

PImage img_sol;
PImage img_mercurio;
PImage img_venus;
PImage img_tierra;
PImage img_luna;
PImage img_marte;
PImage img_jupiter;
PImage img_ganimedes;
PImage img_cielo;

PShape sol;
PShape mercurio;
PShape venus;
PShape tierra;
PShape luna;
PShape marte;
PShape jupiter;
PShape ganimedes;

float rotacionX = -PI/6;

boolean subir_camara = false;
boolean bajar_camara = false;
boolean pausa = false;

float angulo_rotacion = 0;
float v_rotacion = PI/128;

float angulo_sol = 0;
float angulo_mercurio = random(0, TWO_PI);
float angulo_venus = random(0, TWO_PI);
float angulo_tierra = random(0, TWO_PI);
float angulo_luna = 0;
float angulo_marte = random(0, TWO_PI);
float angulo_jupiter = random(0, TWO_PI);
float angulo_ganimedes = 0;

float velocidad_sol = PI/1024;
float velocidad_mercurio = PI/512;
float velocidad_venus = PI/1024;
float velocidad_tierra = PI/1340;
float velocidad_luna = PI/128;
float velocidad_marte = PI/1580;
float velocidad_jupiter = PI/2024;
float velocidad_ganimedes = PI/256;

float radio_orbita_mercurio = 150;
float radio_orbita_venus = 200;
float radio_orbita_tierra = 300;
float radio_orbita_luna = 45;
float radio_orbita_marte = 400;
float radio_orbita_jupiter = 700;
float radio_orbita_ganimedes = 60;

float radio_sol = 100;
float radio_mercurio = 10;
float radio_venus = 15;
float radio_tierra = 25;
float radio_luna = 8;
float radio_marte = 25;
float radio_jupiter = 40;
float radio_ganimedes = 5;

void setup(){
  size(1600, 1000, P3D);
  strokeWeight(0);
  noFill();
  
  //ficherogif = new GifMaker( this, "sistema_solar.gif");
  //ficherogif.setRepeat(0);
  
  img_sol = loadImage("texturas/sol.png");
  img_mercurio = loadImage("texturas/mercurio.jpg");
  img_venus =  loadImage("texturas/venus.jpg");
  img_tierra = loadImage("texturas/tierra.jpg");
  img_luna = loadImage("texturas/luna.jpg");
  img_marte = loadImage("texturas/marte.jpg");
  img_jupiter = loadImage("texturas/jupiter.jpg");
  img_ganimedes = loadImage("texturas/ganimedes.jpg");
  img_cielo = loadImage("cielo.png");

  sol = createShape(SPHERE, radio_sol);
  sol.setTexture(img_sol);
  
  mercurio = createShape(SPHERE, radio_mercurio);
  mercurio.setTexture(img_mercurio);
  
  venus = createShape(SPHERE, radio_venus);
  venus.setTexture(img_venus);
  
  tierra = createShape(SPHERE, radio_tierra);
  tierra.setTexture(img_tierra);
  
  luna = createShape(SPHERE, radio_luna);
  luna.setTexture(img_luna);
  
  marte = createShape(SPHERE, radio_marte);
  marte.setTexture(img_marte);
  
  jupiter = createShape(SPHERE, radio_jupiter);
  jupiter.setTexture(img_jupiter);
  
  ganimedes = createShape(SPHERE, radio_ganimedes);
  ganimedes.setTexture(img_ganimedes);
  
  noStroke();
}

float getAngulo(float anterior, float velocidad){
  float angulo = (anterior + velocidad) % TWO_PI;
  return angulo;
}

void dibujaMercurio(){
  pushMatrix();
 
  strokeWeight(1);
  stroke(128);
  
  pushMatrix();
  rotateX(PI/2);
  circle(0, 0, 2 * radio_orbita_mercurio);
  popMatrix();
  
  strokeWeight(0);
  
  angulo_mercurio = getAngulo(angulo_mercurio, velocidad_mercurio);
  translate(-radio_orbita_mercurio * cos(angulo_mercurio), 0, radio_orbita_mercurio * sin(angulo_mercurio));
  
  pushMatrix();
  rotateY(angulo_rotacion);
  shape(mercurio);
  popMatrix();
  
  pushMatrix();
  rotateX(-rotacionX);
  text("Mercurio", 0, radio_mercurio + 10);
  popMatrix();
  
  popMatrix();
}

void dibujaVenus(){
  pushMatrix();
  
  strokeWeight(1);
  stroke(128);
  
  pushMatrix();
  rotateX(PI/2);
  circle(0, 0, 2 * radio_orbita_venus);
  popMatrix();
  
  strokeWeight(0);
  
  angulo_venus = getAngulo(angulo_venus, velocidad_venus);
  translate(-radio_orbita_venus * cos(angulo_venus), 0, radio_orbita_venus * sin(angulo_venus));
  
  pushMatrix();
  rotateY(angulo_rotacion);
  shape(venus);
  popMatrix();
  
  pushMatrix();
  rotateX(-rotacionX);
  text("Venus", 0, radio_venus + 10);
  popMatrix();
  
  popMatrix();
}

void dibujaLuna(){
  pushMatrix();
  
  strokeWeight(1);
  stroke(128);
  
  pushMatrix();
  rotateX(PI/2);
  circle(0, 0, 2 * radio_orbita_luna);
  popMatrix();
  
  strokeWeight(0);
  
  angulo_luna = getAngulo(angulo_luna, velocidad_luna);
  rotateY(angulo_luna);
  
  translate(-radio_orbita_luna, 0, 0);
  
  pushMatrix();
  rotateY(angulo_rotacion);
  shape(luna);
  popMatrix();
  
  pushMatrix();
  rotateY(-angulo_luna);
  rotateX(-rotacionX);
  text("Luna", 0, radio_luna + 20);
  popMatrix();
 
  popMatrix();
}

void dibujaTierra(){
  pushMatrix();
  
  strokeWeight(1);
  stroke(128);
  
  pushMatrix();
  rotateX(PI/2);
  circle(0, 0, 2 * radio_orbita_tierra);
  popMatrix();
  
  strokeWeight(0);
  
  angulo_tierra = getAngulo(angulo_tierra, velocidad_venus);
  translate(-radio_orbita_tierra * cos(angulo_tierra), 0, radio_orbita_tierra * sin(angulo_tierra));
  
  pushMatrix();
  rotateY(angulo_rotacion);
  shape(tierra);
  popMatrix();
  
  dibujaLuna();  
  
  pushMatrix();
  rotateX(-rotacionX);
  text("Tierra", 0, radio_tierra + 20);
  popMatrix();
  
  popMatrix();
}

void dibujaMarte(){
  pushMatrix();
  
  strokeWeight(1);
  stroke(128);
  
  pushMatrix();
  rotateX(PI/2);
  circle(0, 0, 2 * radio_orbita_marte);
  popMatrix();
  
  strokeWeight(0);
  
  angulo_marte = getAngulo(angulo_marte, velocidad_marte);
  translate(-radio_orbita_marte * cos(angulo_marte), 0, radio_orbita_marte * sin(angulo_marte));
  
  pushMatrix();
  rotateY(angulo_rotacion);
  shape(marte);
  popMatrix();
  
  pushMatrix();
  rotateX(-rotacionX);
  text("Marte", 0, radio_marte + 20);
  popMatrix();
  
  popMatrix();  
}

void dibujaGanimedes(){
  pushMatrix();
  
  strokeWeight(1);
  stroke(128);
  
  pushMatrix();
  rotateX(PI/2);
  circle(0, 0, 2 * radio_orbita_ganimedes);
  popMatrix();
  
  strokeWeight(0);
  
  angulo_ganimedes = getAngulo(angulo_ganimedes, velocidad_ganimedes);
  rotateY(angulo_ganimedes);
  
  translate(-radio_orbita_ganimedes, 0, 0);
  
  pushMatrix();
  rotateY(angulo_rotacion);
  shape(ganimedes);
  popMatrix();
  
  pushMatrix();
  rotateY(-angulo_ganimedes);
  rotateX(-rotacionX);
  text("Ganímedes", 0, radio_ganimedes + 10);
  popMatrix();
 
  popMatrix();
}

void dibujaJupiter(){
  pushMatrix();
  
  strokeWeight(1);
  stroke(128);
  
  pushMatrix();
  rotateX(PI/2);
  circle(0, 0, 2 * radio_orbita_jupiter);
  popMatrix();
  
  strokeWeight(0);
  
  angulo_jupiter = getAngulo(angulo_jupiter, velocidad_jupiter);
  translate(-radio_orbita_jupiter * cos(angulo_jupiter), 0, radio_orbita_jupiter * sin(angulo_jupiter));
  
  pushMatrix();
  rotateY(angulo_rotacion);
  shape(jupiter);
  popMatrix();
  
  dibujaGanimedes();
  
  pushMatrix();
  rotateX(-rotacionX);
  text("Júpiter", 0, radio_jupiter + 20);
  popMatrix();
  
  popMatrix();  
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
  textFont(createFont("Arial", 24));
  textAlign(LEFT, TOP);
  
  text("Para subir la perspectiva pulse \'Tecla Arriba\'", 30, 30);
  text("Para bajar la perspectiva pulse \'Tecla Abajo\'", 30, 60);
  text("Para pausar o reiniciar pulse \'Tecla Espacio\'", 30, 90);
  
  textFont(createFont("Arial", 18));
  textAlign(CENTER, CENTER);
}

void dibujaSistemaSolar(){

  imprime_leyenda();
  
  translate(width/2, height/2, 0);

  actualizar_perspectiva();
  rotateX(rotacionX);

  pushMatrix();
  rotateX(-rotacionX);
  text("Sol", 0, radio_sol + 25);
  popMatrix();
  
  pushMatrix();
  
  angulo_sol = getAngulo(angulo_sol, velocidad_sol);
  rotateY(angulo_sol);
  shape(sol);
  
  popMatrix();

  angulo_rotacion = getAngulo(angulo_rotacion, v_rotacion);
  
  dibujaMercurio(); 
  dibujaVenus();
  dibujaTierra();
  dibujaMarte();
  dibujaJupiter();
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
