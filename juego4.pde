int screen;
int player1;
int player2;
PFont font;
int atta1;
int atta2;
int hp1;
int hp2;
int turn;

PImage ej1;
PImage ej2;
PImage ej3;
PImage ej4;
PImage ej5;
PImage fondo1;
PImage fondo2;

Army terracota;
Army cascosA;
Army barbaros;
Army espartanos;
Army zombis;

PGraphics card1;
PGraphics card2;
PGraphics card3;
PGraphics card4;
PGraphics card5;

void setup(){
  size(1280,720);
  screen = 1;
  fondo1 = loadImage("fondo1.jpg");
  fondo2 = loadImage("fondo2.jpg");
  background(fondo1);
  card1 = createGraphics(200,280);
  card2 = createGraphics(200,280);
  card3 = createGraphics(200,280);
  card4 = createGraphics(200,280);
  card5 = createGraphics(200,280);
  ej1 = loadImage("negro.jpg");
  ej2 = loadImage("azul.jpg");
  ej3 = loadImage("verde.jpg");
  ej4 = loadImage("blanco.jpg");
  ej5 = loadImage("z.jpg");
  player1 = 0;
  player2 = 0;
  font = createFont("BahnhofUltra-48.vlw",32);
  textFont(font);
  terracota = new Army("Soldados de Terracota", 10,200,1,card1);
  cascosA = new Army("Cascos Azules", 7,80,2,card2);
  barbaros = new Army("Barbaros", 15,60,3,card3);
  espartanos = new Army("Espartanos", 12,70,4,card4);
  zombis = new Army("Zombis", 9,100,5,card5);
  turn = 1;
}

void draw(){
//dibujo de las cartas
card1.beginDraw();
  card1.image(ej1,0,0);
card1.endDraw();

card2.beginDraw();
  card2.image(ej2,0,0);
card2.endDraw();

card3.beginDraw();
  card3.image(ej3,0,0);
card3.endDraw();

card4.beginDraw();
  card4.image(ej4,0,0);
card4.endDraw();

card5.beginDraw();
  card5.image(ej5,0,0);
card5.endDraw();

//a partir de aquí empieza la pantalla de inicio
if (screen==1){
  textAlign(CENTER);
  fill(0,80,30);
  textSize(80);
  text("Armies of the World.",640,360);
  textSize(40);
  text("Presiona el botón para continuar.",640,440);
  fill(100,0,0);
  rect(560,480,160,80);  
  if(mouseX>560 && mouseX <560+160 && mouseY>480 && mouseY <480+80){
    fill(255,0,0);
    rect(560,480,160,80);
  }
  if(mousePressed){
    if(mouseX>560 && mouseX <560+160 && mouseY>480 && mouseY <480+80){
      screen = 2;
    }
  }
}

//a partir de aquí inicia la pantalla de selección
if(screen==2){
  background(50,100,100);
  textAlign(CENTER);
  textSize(40);
  fill(0);
  text("Elige sabiamente Jugador 1.",640,75);
  textSize(25);
  text("Pasa el cursor sobre las facciones para revelar su información.",640,150);

//imagenes para los personajes
  image(card1,90,180);
  image(card2,315,180);
  image(card3,540,180);
  image(card4,765,180);
  image(card5,990,180);

//cursor sobre el personaje despliega su información
  if(mouseX>90 && mouseX <290 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(terracota.name,150,500);
    text("Daño: 10 puntos.",150,580);
    text("Jugador 1: Presiona la tecla A para seleccionar.",150,620);
    text("Jugador 2: En espera.",150,660);
  }
  if(mouseX>315 && mouseX <510 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(cascosA.name,150,500);
    text("Daño: 7 puntos.",150,580);
    text("Jugador 1: Presiona la tecla S para seleccionar.",150,620);
    text("Jugador 2: En espera.",150,660);
  } 
  if(mouseX>540 && mouseX <740 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(barbaros.name,150,500);
    text("Daño: 15 puntos.",150,580);
    text("Jugador 1: Presiona la tecla D para seleccionar.",150,620);
    text("Jugador 2: En espera.",150,660);
  }
  if(mouseX>765 && mouseX <965 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(espartanos.name,150,500);
    text("Daño: 15 puntos.",150,580);
    text("Jugador 1: Presiona la tecla F para seleccionar.",150,620);
    text("Jugador 2: En espera.",150,660);
  } 
  if(mouseX>990 && mouseX <1190 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(zombis.name,150,500);
    text("Daño: 9 puntos.",150,580);
      text("Jugador 1: Presiona la tecla G para seleccionar.",150,620);
    text("Jugador 2: En espera.",150,660);
  }
//selección de player1
  if (keyPressed) {
    if (key == 'a' || key == 'A') {
      player1 = terracota.number;
    }
  }
  if (keyPressed) {
    if (key == 's' || key == 'S') {
      player1 = cascosA.number;
    }
  }
  if (keyPressed) {
    if (key == 'd' || key == 'D') {
      player1 = barbaros.number;
    }
  }
  if (keyPressed) {
    if (key == 'f' || key == 'F') {
      player1 = espartanos.number;
    }
  }
  if (keyPressed) {
    if (key == 'g' || key == 'G') {
      player1 = zombis.number;
    }
  }
  if(player1 > 0){
    screen = 3;
  }
}

//selección de player2
if(screen ==3){
  background(100,100,50);
  textAlign(CENTER);
  textSize(40);
  fill(0);
  text("Elige sabiamente Jugador 2.",640,75);
  textSize(25);
  text("Pasa el cursor sobre las facciones para revelar su información.",640,150);

//imagenes para los personajes
if(player1==1){
  image(card2,315,180);
  image(card3,540,180);
  image(card4,765,180);
  image(card5,990,180);

//cursor sobre el personaje despliega su información
  if(mouseX>315 && mouseX <510 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(cascosA.name,150,500);
    text("Daño: 7 puntos.",150,580);
    text("Jugador 1: Elegido.",150,620);
    text("Jugador 2: Presiona la tecla X para seleccionar.",150,660);
  }
  if(mouseX>540 && mouseX <740 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(barbaros.name,150,500);
    text("Daño: 15 puntos.",150,580);
    text("Jugador 1: Elegido.",150,620);
    text("Jugador 2: Presiona la tecla C para seleccionar.",150,660);
  }
  if(mouseX>765 && mouseX <965 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(espartanos.name,150,500);
    text("Daño: 15 puntos.",150,580);
    text("Jugador 1: Elegido.",150,620);
    text("Jugador 2: Presiona la tecla V para seleccionar.",150,660);
  } 
  if(mouseX>990 && mouseX <1190 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(zombis.name,150,500);
    text("Daño: 9 puntos.",150,580);
    text("Jugador 1: Elegido.",150,620);
    text("Jugador 2: Presiona la tecla B para seleccionar.",150,660);
  } 
  if (keyPressed) {
    if (key == 'x' || key == 'X') {
      player2 = cascosA.number;
    }
  }
  if (keyPressed) {
    if (key == 'c' || key == 'C') {
      player2 = barbaros.number;
    }
  }
  if (keyPressed) {
    if (key == 'v' || key == 'V') {
      player2 = espartanos.number;
    }
  }
  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      player2 = zombis.number;
    }
  }
}

if(player1==2){
  image(card1,90,180);
  image(card3,540,180);
  image(card4,765,180);
  image(card5,990,180);

//cursor sobre el personaje despliega su información
  if(mouseX>90 && mouseX <290 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(terracota.name,150,500);
    text("Daño: 10 puntos.",150,580);
    text("Jugador 1: Elegido.",150,620);
    text("Jugador 2: Presiona la tecla Z para seleccionar.",150,660);
  }
  if(mouseX>540 && mouseX <740 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(barbaros.name,150,500);
    text("Daño: 15 puntos.",150,580);
    text("Jugador 1: Elegido.",150,620);
    text("Jugador 2: Presiona la tecla C para seleccionar.",150,660);
  }
  if(mouseX>765 && mouseX <965 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(espartanos.name,150,500);
    text("Daño: 15 puntos.",150,580);
    text("Jugador 1: Elegido.",150,620);
    text("Jugador 2: Presiona la tecla V para seleccionar.",150,660);
  }   
  if(mouseX>990 && mouseX <1190 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(zombis.name,150,500);
    text("Daño: 9 puntos.",150,580);
    text("Jugador 1: Elegido.",150,620);
    text("Jugador 2: Presiona la tecla B para seleccionar.",150,660);
  }
  if (keyPressed) {
    if (key == 'z' || key == 'Z') {
      player2 = terracota.number;
    }
  }
  if (keyPressed) {
    if (key == 'c' || key == 'C') {
      player2 = barbaros.number;
    }
  }
  if (keyPressed) {
    if (key == 'v' || key == 'V') {
      player2 = espartanos.number;
    }
  }
  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      player2 = zombis.number;
    }
  }
}

if(player1==3){
  image(card1,90,180);
  image(card2,315,180);
  image(card4,765,180);
  image(card5,990,180);
  
//cursor sobre el personaje despliega su información
  if(mouseX>90 && mouseX <290 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(terracota.name,150,500);
    text("Daño: 10 puntos.",150,580);
    text("Jugador 1: Elegido.",150,620);
    text("Jugador 2: Presiona la tecla Z para seleccionar.",150,660);
  }
  if(mouseX>315 && mouseX <510 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(cascosA.name,150,500);
    text("Daño: 7 puntos.",150,580);
    text("Jugador 1: Elegido.",150,620);
    text("Jugador 2: Presiona la tecla X para seleccionar.",150,660);
  }
  if(mouseX>765 && mouseX <965 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(espartanos.name,150,500);
    text("Daño: 15 puntos.",150,580);
    text("Jugador 1: Elegido.",150,620);
    text("Jugador 2: Presiona la tecla V para seleccionar.",150,660);
  } 
  if(mouseX>990 && mouseX <1190 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(zombis.name,150,500);
    text("Daño: 9 puntos.",150,580);
    text("Jugador 1: Elegido.",150,620);
    text("Jugador 2: Presiona la tecla B para seleccionar.",150,660);
  }
  if (keyPressed) {
    if (key == 'z' || key == 'Z') {
      player2 = terracota.number;
    }
  } 
  if (keyPressed) {
    if (key == 'x' || key == 'X') {
      player2 = cascosA.number;
    }
  }
  if (keyPressed) {
    if (key == 'v' || key == 'V') {
      player2 = espartanos.number;
    }
  }
  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      player2 = zombis.number;
    }
  }
}

if(player1==4){
  image(card1,90,180);
  image(card2,315,180);
  image(card3,540,180);
  image(card5,990,180);

//cursor sobre el personaje despliega su información
  if(mouseX>90 && mouseX <290 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(terracota.name,150,500);
    text("Daño: 10 puntos.",150,580);
    text("Jugador 1: Elegido.",150,620);
    text("Jugador 2: Presiona la tecla Z para seleccionar.",150,660);
  }
  if(mouseX>315 && mouseX <510 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(cascosA.name,150,500);
    text("Daño: 7 puntos.",150,580);
    text("Jugador 1: Elegido.",150,620);
    text("Jugador 2: Presiona la tecla X para seleccionar.",150,660);
  }    
  if(mouseX>540 && mouseX <740 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(barbaros.name,150,500);
    text("Daño: 15 puntos.",150,580);
    text("Jugador 1: Elegido.",150,620);
    text("Jugador 2: Presiona la tecla C para seleccionar.",150,660);
  } 
  if(mouseX>990 && mouseX <1190 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(zombis.name,150,500);
    text("Daño: 9 puntos.",150,580);
    text("Jugador 1: Elegido.",150,620);
    text("Jugador 2: Presiona la tecla B para seleccionar.",150,660);
  }
  if (keyPressed) {
    if (key == 'z' || key == 'Z') {
      player2 = terracota.number;
    }
  } 
  if (keyPressed) {
    if (key == 'x' || key == 'X') {
      player2 = cascosA.number;
    }
  }
  if (keyPressed) {
    if (key == 'c' || key == 'C') {
      player2 = barbaros.number;
    }
  }
  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      player2 = zombis.number;
    }
  }
}

if(player1==5){
  image(card1,90,180);
  image(card2,315,180);
  image(card3,540,180);
  image(card4,765,180);

//cursor sobre el personaje despliega su información
  if(mouseX>90 && mouseX <290 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(terracota.name,150,500);
    text("Daño: 10 puntos.",150,580);
    text("Jugador 1: Elegido.",150,620);
    text("Jugador 2: Presiona la tecla Z para seleccionar.",150,660);
  }
  if(mouseX>315 && mouseX <510 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(cascosA.name,150,500);
    text("Daño: 7 puntos.",150,580);
    text("Jugador 1: Elegido.",150,620);
    text("Jugador 2: Presiona la tecla X para seleccionar.",150,660);
  } 
  if(mouseX>540 && mouseX <740 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(barbaros.name,150,500);
    text("Daño: 15 puntos.",150,580);
    text("Jugador 1: Elegido.",150,620);
    text("Jugador 2: Presiona la tecla C para seleccionar.",150,660);
  }
  if(mouseX>765 && mouseX <965 && mouseY>180 && mouseY <460){
    textAlign(LEFT);
    textSize(30);
    fill(0);
    text(espartanos.name,150,500);
    text("Daño: 15 puntos.",150,580);
    text("Jugador 1: Elegido.",150,620);
    text("Jugador 2: Presiona la tecla V para seleccionar.",150,660);
  }
  if (keyPressed) {
    if (key == 'z' || key == 'Z') {
      player2 = terracota.number;
    }
  } 
  if (keyPressed) {
    if (key == 'x' || key == 'X') {
      player2 = cascosA.number;
    }
  }
  if (keyPressed) {
    if (key == 'c' || key == 'C') {
      player2 = barbaros.number;
    }
  }
  if (keyPressed) {
    if (key == 'v' || key == 'V') {
      player2 = espartanos.number;
    }
  }
}

  if(player2 > 0){
    screen = 4;
  }
}
if(screen == 4){
  background(fondo2);
  
    text("Jugador 1 ataca con la tecla 1.",390,170);
    text("Jugador 2 ataca con la tecla 2.",799,170);
    
  if(player1==terracota.number){
    image(card1,320,200);
    atta1 = terracota.attack;
    hp1 = terracota.hp;
  }  
  if(player1==cascosA.number){
    image(card2,320,200);
    atta1 = cascosA.attack;
    hp1 = cascosA.hp;
  }
  if(player1==barbaros.number){
    image(card3,320,200);
    atta1 = barbaros.attack;
    hp1 = barbaros.hp;
  }
  if(player1==espartanos.number){
    image(card4,320,200);
    atta1 = espartanos.attack;
    hp1 = espartanos.hp;
  }
  if(player1==zombis.number){
    image(card5,320,200);
    atta1 = zombis.attack;
    hp1 = zombis.hp;
  }
  
  if(player2==terracota.number){
    image(card1,750,200);
    atta2 = terracota.attack;
    hp2 = terracota.hp;
  }
  if(player2==cascosA.number){
    image(card2,750,200);
    atta2 = cascosA.attack;
    hp2 = cascosA.hp;
  }
  if(player2==barbaros.number){
    image(card3,750,200);
    atta2 = barbaros.attack;
    hp2 = barbaros.hp;
  }
  if(player2==espartanos.number){
    image(card4,750,200);
    atta2 = espartanos.attack;
    hp2 = espartanos.hp;
  }
  if(player2==zombis.number){
    image(card5,750,200);
    atta2 = zombis.attack;
    hp2 = zombis.hp;
  }
  rect(320,600,hp1,40);
  rect(750,600,hp2,40);
  
  
  if(hp2<=0){
    screen=5;
  }
  if(hp1<=0){
    screen=6;
  }
  if(keyPressed){
    if(hp1>0 && hp2>0 && turn==1 && key == '1' && hp2==terracota.hp){
      hp2 = hp2-atta1;
      turn = turn +1;
      terracota.hp = hp2;
    }
  }
  if(keyPressed){
    if(hp1>0 && hp2>0 && turn==2 && key == '2' && hp1==terracota.hp){
      hp1 = hp1-atta2;
      turn = turn-1;
      terracota.hp = hp1;
    }
  }
  if(keyPressed){
    if(hp1>0 && hp2>0 && turn==1 && key == '1' && hp2==cascosA.hp){
      hp2 = hp2-atta1;
      turn = turn +1;
      cascosA.hp = hp2;
    }
  }
  if(keyPressed){
    if(hp1>0 && hp2>0 && turn==2 && key == '2' && hp1==cascosA.hp){
      hp1 = hp1-atta2;
      turn = turn-1;
      cascosA.hp = hp1;
    }
  }
  if(keyPressed){
    if(hp1>0 && hp2>0 && turn==1 && key == '1' && hp2==barbaros.hp){
      hp2 = hp2-atta1;
      turn = turn +1;
      barbaros.hp = hp2;
    }
  }
  if(keyPressed){
    if(hp1>0 && hp2>0 && turn==2 && key == '2' && hp1==barbaros.hp){
      hp1 = hp1-atta2;
      turn = turn-1;
      barbaros.hp = hp1;
    }
  }
  if(keyPressed){
    if(hp1>0 && hp2>0 && turn==1 && key == '1' && hp2==espartanos.hp){
      hp2 = hp2-atta1;
      turn = turn +1;
      espartanos.hp = hp2;
    }
  }
  if(keyPressed){
    if(hp1>0 && hp2>0 && turn==2 && key == '2' && hp1==espartanos.hp){
      hp1 = hp1-atta2;
      turn = turn-1;
      espartanos.hp = hp1;
    }
  }
  if(keyPressed){
    if(hp1>0 && hp2>0 && turn==1 && key == '1' && hp2==zombis.hp){
      hp2 = hp2-atta1;
      turn = turn +1;
      zombis.hp = hp2;
    }
  }
  if(keyPressed){
    if(hp1>0 && hp2>0 && turn==2 && key == '2' && hp1==zombis.hp){
      hp1 = hp1-atta2;
      turn = turn-1;
      zombis.hp = hp1;
    }
  }
}

  if (screen==5){
  textAlign(CENTER);
  fill(0,80,30);
  textSize(80);
  text("Jugador 1 es el ganador.",640,360);
  textSize(40);
  text("Presiona el botón para continuar.",640,440);
  fill(100,0,0);
  rect(560,480,160,80);  
  if(mouseX>560 && mouseX <560+160 && mouseY>480 && mouseY <480+80){
    fill(255,0,0);
    rect(560,480,160,80);
  }
  if(mousePressed){
    if(mouseX>560 && mouseX <560+160 && mouseY>480 && mouseY <480+80){
      screen = 1;
      player1 = 0;
      player2 = 0;
    }
  }
}
  
  if (screen==6){
  textAlign(CENTER);
  fill(0,80,30);
  textSize(80);
  text("Jugador 2 es el ganador.",640,360);
  textSize(40);
  text("Presiona el botón para continuar.",640,440);
  fill(100,0,0);
  rect(560,480,160,80);
  if(mouseX>560 && mouseX <560+160 && mouseY>480 && mouseY <480+80){
    fill(255,0,0);
    rect(560,480,160,80);
  }
  if(mousePressed){
    if(mouseX>560 && mouseX <560+160 && mouseY>480 && mouseY <480+80){
      screen = 1;
      player1 = 0;
      player2 = 0;
    }
  }
}
}

class Army {
  String name;
  int attack;
  int hp;
  int number;
  PGraphics shield;

  Army(String name_, int attack_, int hp_, int number_, PGraphics shield_){
    name = name_;
    attack = attack_;
    hp = hp_;
    number = number_;
    shield = shield_;
  }
}