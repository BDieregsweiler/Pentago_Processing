int scale = 400;

int red1 = 200;
int green1 = 0;
int blue1 = 0;

int red2 = 0;
int green2 = 0;
int blue2 = 200;

int gewinnerInt = 0;

Spielfeld myFeld;
Spieler spieler1, spieler2;
Spieler aktSpieler;


void setup() {
  size(displayWidth, displayHeight);
  rectMode(CENTER);

  myFeld = new Spielfeld();
  spieler1 = new Spieler(1);
  spieler2 = new Spieler(2);
  aktSpieler = spieler1;
}

void draw() {
  updateHintergrund();

  aktSpielerMachZug();

  //kleine Verzögerung, sodass das Programm nicht über sich selbst "stolpert" (manchmal wird sonst der falsche Spieler als gewinner ausgegeben
  delay(50);

  gewinnerEvent();

  switchSpieler();

  updatescale();
  
  menue();
  
  reset();
}
