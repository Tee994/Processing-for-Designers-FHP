float spieler_x;
float spieler_y;
float ball_x;
float ball_y;
float ball_geschw_x;
float ball_geschw_y;
float laenge;

int runde; 
void setup() {
  spieler_x = 20;
  spieler_y = 60;
  ball_x = 400;
  ball_y = 300;
  ball_geschw_x =-3;
  ball_geschw_y = 0;
  runde= 0;
  laenge= 140;
  
  size(800, 600);
  rectMode(CENTER);
}

void draw() {
  background(0);
  rect(spieler_x, spieler_y, 20, laenge);
  rect(ball_x, ball_y, 10, 10);
  if (runde  == 4) {
    laenge= 120;}
    
      if (runde  < 3) {
    laenge= 110;}
    
      if (runde  > 3) {
    laenge= 80;}
    
      if (runde > 6) {
    laenge= 50;}
    
  if (keyPressed) {
    if (keyCode == DOWN) {
      if (spieler_y < 550) {
        spieler_y = spieler_y + 5;
      }
    }
    if (keyCode == UP) {
      if (spieler_y > 50) {
        spieler_y = spieler_y - 5;
      }
    } 
    
  }
  ball_x = ball_x + ball_geschw_x;
  ball_y = ball_y + ball_geschw_y;
  if (ball_x < 30) {
    if (ball_y < (spieler_y + 55) && ball_y > (spieler_y -55)) {
      ball_geschw_x = (-ball_geschw_x) + 0.5;
      ball_geschw_y = ball_geschw_y - (spieler_y - ball_y) * 0.1;
      runde= runde + 1;
    } else {
      ball_x = 400;
      ball_y = 300;
      ball_geschw_x = -3;
      ball_geschw_y = 0;
      runde = 0;
    }
  }
  if (ball_y > 595 || ball_y < 5) {
    ball_geschw_y = - ball_geschw_y;
  }
  if (ball_x > 795) {
    ball_geschw_x = -ball_geschw_x;
  }
  text("Runde: " + runde, 700, 20);
}