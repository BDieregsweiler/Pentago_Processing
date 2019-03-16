class dreiMalDrei {
  int[][] dmd;

  dreiMalDrei() {
    dmd = new int[3][3];
  }


  void reset() {
    for ( int i = 0; i < 3; i++ ) {
      for ( int j = 0; j < 3; j++ ) {
        dmd[i][j] = 0;
      }
    }
  }


  void update(int mainX, int mainY, int pScale, String mode) {



    fill(120, 120, 120);
    rect(mainX, mainY, pScale, pScale);

    pushMatrix();
    translate(mainX-pScale/2, mainY-pScale/2);

    if ( mode == "placing mode" ) {

      System.out.println("placing");
      System.out.println(".....");
      System.out.println(mouseX);

      for ( int i = 0; i < 3; i ++ ) {
        for ( int j = 0; j < 3; j ++ ) {

          //die coordinaten der Ellipsen:
          //x = ((i+1)*(pScale/16))+((i+0.5)*(pScale/4))
          //y = ((j+1)*(pScale/16))+((j+0.5)*(pScale/4))
          //Durchmesser = pScale/4


          //die Farbe wird festgelegt
          if ( dmd[i][j] == 0 && mouseX < (mainX-pScale/2)+(((i+1)*(pScale/16))+((i+0.5)*(pScale/4))+pScale/8)
            && mouseX > (mainX-pScale/2)+(((i+1)*(pScale/16))+((i+0.5)*(pScale/4))-pScale/8) 
            && mouseY < (mainY-pScale/2)+(((j+1)*(pScale/16))+((j+0.5)*(pScale/4))+pScale/8)
            && mouseY > (mainY-pScale/2)+(((j+1)*(pScale/16))+((j+0.5)*(pScale/4))-pScale/8)) {
            fill(50, 50, 50);

            if ( mousePressed ) {
              dmd[i][j] = aktSpieler.getN();
              aktSpieler.steinGesetzt = true;
            }
          } else if ( dmd[i][j] == 0 ) {
            fill(0);
          } else if ( dmd[i][j] == 1 ) {
            fill(red1, green1, blue1);
          } else if ( dmd[i][j] == 2 ) {
            fill(red2, green2, blue2);
          }

          ellipse(((i+1)*(pScale/16))+((i+0.5)*(pScale/4)), ((j+1)*(pScale/16))+((j+0.5)*(pScale/4)), pScale/4, pScale/4);
        }
      }
      //ELSE
    } else if ( mode == "rotate mode" ) {

      System.out.println("rotate");

      for ( int i = 0; i < 3; i ++ ) {
        for ( int j = 0; j < 3; j ++ ) {

          //die coordinaten der Ellipsen:
          //x = ((i+1)*(pScale/16))+((i+0.5)*(pScale/4))
          //y = ((j+1)*(pScale/16))+((j+0.5)*(pScale/4))
          //Durchmesser = pScale/4

          //die Farbe wird festgelegt
          if ( dmd[i][j] == 0 ) {
            fill(0);
          } else if ( dmd[i][j] == 1 ) {
            fill(red1, green1, blue1);
          } else if ( dmd[i][j] == 2 ) {
            fill(red2, green2, blue2);
          }

          ellipse(((i+1)*(pScale/16))+((i+0.5)*(pScale/4)), ((j+1)*(pScale/16))+((j+0.5)*(pScale/4)), pScale/4, pScale/4);
        }
      }

      if ( mouseX < mainX+pScale/2 && mouseX > mainX-pScale/2 && mouseY < mainY+pScale/2 && mouseY > mainY-pScale/2 ) {

        popMatrix();
        fill(70, 0, 20, 100);
        rect(mainX, mainY, pScale, pScale);
        pushMatrix();
        translate(mainX-pScale/2, mainY-pScale/2);

        if ( keyPressed ) {
          if ( keyCode == RIGHT ) {
            rotateCw();
            aktSpieler.dmdGedreht = true;
            keyCode = 0;
          } else if ( keyCode == LEFT ) {
            rotateCcw();
            aktSpieler.dmdGedreht = true;
            keyCode = 0;
          }
        }
      }
    }
    popMatrix();
  } 



  void stzeStein(int x, int y, int aktSpieler) {
    dmd[x][y] = aktSpieler;
  }

  void rotateCw() {
    int tmp = dmd[0][0];
    dmd[0][0] = dmd[0][2];
    dmd[0][2] = dmd[2][2];
    dmd[2][2] = dmd[2][0];
    dmd[2][0] = tmp;

    tmp = dmd[1][0];
    dmd[1][0] = dmd[0][1];
    dmd[0][1] = dmd[1][2];
    dmd[1][2] = dmd[2][1];
    dmd[2][1] = tmp;
  }

  void rotateCcw() {
    rotateCw();
    rotateCw();
    rotateCw();
  }

  int getWert(int x, int y) {
    return dmd[x][y];
  }
}
