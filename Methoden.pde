void updateHintergrund() {
  if ( aktSpieler.getN() == 1 ) {
    background(red1, green1, blue1);
  } else if ( aktSpieler.getN() == 2 ) {
    background(red2, green2, blue2);
  }
}

void aktSpielerMachZug() {
  //solange der aktuelle Spieler noch keinen Stein Platziert hat:
  if ( !aktSpieler.steinGesetzt ) {
    myFeld.update("placing mode");
  }

  //solange der aktuelle Spieler noch nicht ein Feld gedreht hat:
  if ( aktSpieler.steinGesetzt && !aktSpieler.dmdGedreht ) {
    myFeld.update("rotate mode");
  }
}

void gewinnerEvent() {
  if ( myFeld.sindFuenfFolgende() ) {
    
    textAlign(CENTER);
    
    fill(0);
    textSize(300);
    text("Gewinner:", displayWidth/2, displayHeight/3);
    if ( gewinnerInt == 0 ) {
      gewinnerInt =  aktSpieler.getN();
    }
    text("Spieler" + gewinnerInt, displayWidth/2, (displayHeight/3)*2);
    
    fill(255);
    textSize(290);
    text("Gewinner:", displayWidth/2, displayHeight/3);
    if ( gewinnerInt == 0 ) {
      gewinnerInt =  aktSpieler.getN();
    }
    text("Spieler" + gewinnerInt, displayWidth/2, (displayHeight/3)*2);
  }
}

void switchSpieler() {
  if ( aktSpieler.steinGesetzt && aktSpieler.dmdGedreht ) {     
    if ( aktSpieler == spieler1 ) {
      aktSpieler.resetteBooleanWerte(); 
      aktSpieler = spieler2;
    } else if ( aktSpieler == spieler2 ) {
      aktSpieler.resetteBooleanWerte();
      aktSpieler = spieler1;
    }
  }
}

void updatescale() {
  if (keyPressed) {
    if (keyCode == UP) {
      scale += 20;
    } else if (keyCode == DOWN) {
      scale -= 20;
    }
  }
}

void reset(){
   if ( mouseX>displayWidth/2-100 && mouseX<displayWidth/2+100
         && mouseY>displayHeight-75-25 && mouseY<displayHeight-75+25 ) {
           fill(80, 80, 80);
           if ( mousePressed ) {
              myFeld.resette(); 
           }
         } else {
            fill(0); 
         }
         
         rect(displayWidth/2, displayHeight-75, 200, 50);
         fill(255);
         textSize(40);
         text("RESET", displayWidth/2, displayHeight-132+75);
}

void menue() {
  menue1();
  menue2();
}

void menue1() {
  int centerX = displayWidth/2-((int) 2.5*scale); 
  int centerY = (displayHeight/3)*2;

  textAlign(CENTER);

  fill(red1, green1, blue1, 180);
  rect(centerX, centerY, scale/2, scale);

  fill(255);
  textSize(scale/10);
  text("Spieler 1", centerX, centerY-scale*0.33);

  //==============================================================================================

  textSize(scale/25);
  text("red", centerX, centerY-scale*0.03);


  if ( mouseX < centerX-scale/8+(scale/30)/2 && mouseX > centerX-scale/8-(scale/30)/2
    && mouseY < centerY-scale*0.03+scale/30+(scale/30)/2 && mouseY > centerY-scale*0.03+scale/30-(scale/30)/2) {
    fill(100, 100, 100);

    if ( mousePressed && red1 >= 5) {
      red1 -= 5;
    }
  } else {
    fill(255);
  }
  rect(centerX-scale/8, centerY-scale*0.03+scale/30, scale/30, scale/30);  
  fill(0);
  textSize(scale/30);
  text("v", centerX-scale/8, centerY-scale*0.03+scale/30);


  if ( mouseX < centerX+scale/8+(scale/30)/2 && mouseX > centerX+scale/8-(scale/30)/2
    && mouseY < centerY-scale*0.03+scale/30+(scale/30)/2 && mouseY > centerY-scale*0.03+scale/30-(scale/30)/2) {
    fill(100, 100, 100);

    if ( mousePressed && red1 <= 250) {
      red1 += 5;
    }
  } else {
    fill(255);
  }
  rect(centerX+scale/8, centerY-scale*0.03+scale/30, scale/30, scale/30);
  fill(0);
  text("^", centerX+scale/8, centerY-scale*0.03+scale/30);

  text( red1, centerX, centerY-scale*0.03+scale/30);

  //==============================================================================================

  textSize(scale/25);
  fill(255);
  text("green", centerX, centerY+scale*0.13);


  if ( mouseX < centerX-scale/8+(scale/30)/2 && mouseX > centerX-scale/8-(scale/30)/2
    && mouseY < centerY+scale*0.13+scale/30+(scale/30)/2 && mouseY > centerY+scale*0.13+scale/30-(scale/30)/2) {
    fill(100, 100, 100);

    if ( mousePressed && green1 >= 5) {
      green1 -= 5;
    }
  } else {
    fill(255);
  }
  rect(centerX-scale/8, centerY+scale*0.13+scale/30, scale/30, scale/30);
  fill(0);
  textSize(scale/30);
  text("v", centerX-scale/8, centerY+scale*0.13+scale/30);

  if ( mouseX < centerX+scale/8+(scale/30)/2 && mouseX > centerX+scale/8-(scale/30)/2
    && mouseY < centerY+scale*0.13+scale/30+(scale/30)/2 && mouseY > centerY+scale*0.13+scale/30-(scale/30)/2) {
    fill(100, 100, 100);

    if ( mousePressed && green1 <= 250) {
      green1 += 5;
    }
  } else {
    fill(255);
  }
  rect(centerX+scale/8, centerY+scale*0.13+scale/30, scale/30, scale/30);
  fill(0);
  text("^", centerX+scale/8, centerY+scale*0.13+scale/30);

  text( green1, centerX, centerY+scale*0.13+scale/30);

  //==============================================================================================

  textSize(scale/25);
  fill(255);
  text("blue", centerX, centerY+scale*0.33);


  if ( mouseX < centerX-scale/8+(scale/30)/2 && mouseX > centerX-scale/8-(scale/30)/2
    && mouseY < centerY+scale*0.33+scale/30+(scale/30)/2 && mouseY > centerY+scale*0.33+scale/30-(scale/30)/2) {
    fill(100, 100, 100);

    if ( mousePressed && blue1 >= 5) {
      blue1 -= 5;
    }
  } else {
    fill(255);
  }
  rect(centerX-scale/8, centerY+scale*0.33+scale/30, scale/30, scale/30);
  fill(0);
  textSize(scale/30);
  text("v", centerX-scale/8, centerY+scale*0.33+scale/30);


  if ( mouseX < centerX+scale/8+(scale/30)/2 && mouseX > centerX+scale/8-(scale/30)/2
    && mouseY < centerY+scale*0.33+scale/30+(scale/30)/2 && mouseY > centerY+scale*0.33+scale/30-(scale/30)/2) {
    fill(100, 100, 100);

    if ( mousePressed && blue1 <= 250) {
      blue1 += 5;
    }
  } else {
    fill(255);
  }
  rect(centerX+scale/8, centerY+scale*0.33+scale/30, scale/30, scale/30);
  fill(0);
  text("^", centerX+scale/8, centerY+scale*0.33+scale/30);

  text( blue1, centerX, centerY+scale*0.33+scale/30);
}

void menue2() {
  int centerX = displayWidth/2+((int) 2.5*scale); 
  int centerY = (displayHeight/3)*2;

  textAlign(CENTER);

  fill(red2, green2, blue2, 180);
  rect(centerX, centerY, scale/2, scale);

  fill(255);
  textSize(scale/10);
  text("Spieler 2", centerX, centerY-scale*0.33);

  //==============================================================================================

  textSize(scale/25);
  text("red", centerX, centerY-scale*0.03);


  if ( mouseX < centerX-scale/8+(scale/30)/2 && mouseX > centerX-scale/8-(scale/30)/2
    && mouseY < centerY-scale*0.03+scale/30+(scale/30)/2 && mouseY > centerY-scale*0.03+scale/30-(scale/30)/2) {
    fill(100, 100, 100);

    if ( mousePressed && red2 >= 5) {
      red2 -= 5;
    }
  } else {
    fill(255);
  }
  rect(centerX-scale/8, centerY-scale*0.03+scale/30, scale/30, scale/30);  
  fill(0);
  textSize(scale/30);
  text("v", centerX-scale/8, centerY-scale*0.03+scale/30);


  if ( mouseX < centerX+scale/8+(scale/30)/2 && mouseX > centerX+scale/8-(scale/30)/2
    && mouseY < centerY-scale*0.03+scale/30+(scale/30)/2 && mouseY > centerY-scale*0.03+scale/30-(scale/30)/2) {
    fill(100, 100, 100);

    if ( mousePressed && red2 <= 250) {
      red2 += 5;
    }
  } else {
    fill(255);
  }
  rect(centerX+scale/8, centerY-scale*0.03+scale/30, scale/30, scale/30);
  fill(0);
  text("^", centerX+scale/8, centerY-scale*0.03+scale/30);

  text( red2, centerX, centerY-scale*0.03+scale/30);

  //==============================================================================================

  textSize(scale/25);
  fill(255);
  text("green", centerX, centerY+scale*0.13);


  if ( mouseX < centerX-scale/8+(scale/30)/2 && mouseX > centerX-scale/8-(scale/30)/2
    && mouseY < centerY+scale*0.13+scale/30+(scale/30)/2 && mouseY > centerY+scale*0.13+scale/30-(scale/30)/2) {
    fill(100, 100, 100);

    if ( mousePressed && green2 >= 5) {
      green2 -= 5;
    }
  } else {
    fill(255);
  }
  rect(centerX-scale/8, centerY+scale*0.13+scale/30, scale/30, scale/30);
  fill(0);
  textSize(scale/30);
  text("v", centerX-scale/8, centerY+scale*0.13+scale/30);

  if ( mouseX < centerX+scale/8+(scale/30)/2 && mouseX > centerX+scale/8-(scale/30)/2
    && mouseY < centerY+scale*0.13+scale/30+(scale/30)/2 && mouseY > centerY+scale*0.13+scale/30-(scale/30)/2) {
    fill(100, 100, 100);

    if ( mousePressed && green2 <= 250) {
      green2 += 5;
    }
  } else {
    fill(255);
  }
  rect(centerX+scale/8, centerY+scale*0.13+scale/30, scale/30, scale/30);
  fill(0);
  text("^", centerX+scale/8, centerY+scale*0.13+scale/30);

  text( green2, centerX, centerY+scale*0.13+scale/30);

  //==============================================================================================

  textSize(scale/25);
  fill(255);
  text("blue", centerX, centerY+scale*0.33);


  if ( mouseX < centerX-scale/8+(scale/30)/2 && mouseX > centerX-scale/8-(scale/30)/2
    && mouseY < centerY+scale*0.33+scale/30+(scale/30)/2 && mouseY > centerY+scale*0.33+scale/30-(scale/30)/2) {
    fill(100, 100, 100);

    if ( mousePressed && blue2 >= 5) {
      blue2 -= 5;
    }
  } else {
    fill(255);
  }
  rect(centerX-scale/8, centerY+scale*0.33+scale/30, scale/30, scale/30);
  fill(0);
  textSize(scale/30);
  text("v", centerX-scale/8, centerY+scale*0.33+scale/30);


  if ( mouseX < centerX+scale/8+(scale/30)/2 && mouseX > centerX+scale/8-(scale/30)/2
    && mouseY < centerY+scale*0.33+scale/30+(scale/30)/2 && mouseY > centerY+scale*0.33+scale/30-(scale/30)/2) {
    fill(100, 100, 100);

    if ( mousePressed && blue2 <= 250) {
      blue2 += 5;
    }
  } else {
    fill(255);
  }
  rect(centerX+scale/8, centerY+scale*0.33+scale/30, scale/30, scale/30);
  fill(0);
  text("^", centerX+scale/8, centerY+scale*0.33+scale/30);

  text( blue2, centerX, centerY+scale*0.33+scale/30);
}
