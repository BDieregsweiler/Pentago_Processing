class Spielfeld {
  dreiMalDrei[][] feld;
  int[][] prueffeld;

  Spielfeld() {
    prueffeld = new int[6][6];
    feld = new dreiMalDrei[2][2];

    feld[0][0] = new dreiMalDrei();
    feld[1][0] = new dreiMalDrei();
    feld[1][1] = new dreiMalDrei();
    feld[0][1] = new dreiMalDrei();
  }
  
  void resette(){
    feld[0][0].reset();
    feld[1][0].reset();
    feld[1][1].reset();
    feld[0][1].reset();
  }

  void update(String command) {
    fill(0);
    rect(displayWidth/2, displayHeight/2, scale*2+100, scale*2+100);

    feld[0][0].update((int) displayWidth/2-scale/2, (int) displayHeight/2-scale/2, scale, command);
    feld[1][0].update((int) displayWidth/2+scale/2, (int) displayHeight/2-scale/2, scale, command);
    feld[1][1].update((int) displayWidth/2+scale/2, (int) displayHeight/2+scale/2, scale, command);
    feld[0][1].update((int) displayWidth/2-scale/2, (int) displayHeight/2+scale/2, scale, command);
  } 

  /*  void update(){
   feld[0][0].update((int) displayWidth/2-scale/2, (int) displayHeight/2-scale/2, scale);
   feld[1][0].update((int) displayWidth/2+scale/2, (int) displayHeight/2-scale/2, scale);
   feld[1][1].update((int) displayWidth/2+scale/2, (int) displayHeight/2+scale/2, scale);
   feld[0][1].update((int) displayWidth/2-scale/2, (int) displayHeight/2+scale/2, scale);
   } */



  boolean sindFuenfFolgende()
  {
    int a = 0;
    int b = 0;

    prueffeld[a*3+0][b*3+0] = feld[a][b].getWert(0, 0);
    prueffeld[a*3+1][b*3+0] = feld[a][b].getWert(1, 0);
    prueffeld[a*3+2][b*3+0] = feld[a][b].getWert(2, 0);
    prueffeld[a*3+0][b*3+1] = feld[a][b].getWert(0, 1);
    prueffeld[a*3+1][b*3+1] = feld[a][b].getWert(1, 1);
    prueffeld[a*3+2][b*3+1] = feld[a][b].getWert(2, 1);
    prueffeld[a*3+0][b*3+2] = feld[a][b].getWert(0, 2);
    prueffeld[a*3+1][b*3+2] = feld[a][b].getWert(1, 2);
    prueffeld[a*3+2][b*3+2] = feld[a][b].getWert(2, 2);

    a++;

    prueffeld[a*3+0][b*3+0] = feld[a][b].getWert(0, 0);
    prueffeld[a*3+1][b*3+0] = feld[a][b].getWert(1, 0);
    prueffeld[a*3+2][b*3+0] = feld[a][b].getWert(2, 0);
    prueffeld[a*3+0][b*3+1] = feld[a][b].getWert(0, 1);
    prueffeld[a*3+1][b*3+1] = feld[a][b].getWert(1, 1);
    prueffeld[a*3+2][b*3+1] = feld[a][b].getWert(2, 1);
    prueffeld[a*3+0][b*3+2] = feld[a][b].getWert(0, 2);
    prueffeld[a*3+1][b*3+2] = feld[a][b].getWert(1, 2);
    prueffeld[a*3+2][b*3+2] = feld[a][b].getWert(2, 2);

    b++;

    prueffeld[a*3+0][b*3+0] = feld[a][b].getWert(0, 0);
    prueffeld[a*3+1][b*3+0] = feld[a][b].getWert(1, 0);
    prueffeld[a*3+2][b*3+0] = feld[a][b].getWert(2, 0);
    prueffeld[a*3+0][b*3+1] = feld[a][b].getWert(0, 1);
    prueffeld[a*3+1][b*3+1] = feld[a][b].getWert(1, 1);
    prueffeld[a*3+2][b*3+1] = feld[a][b].getWert(2, 1);
    prueffeld[a*3+0][b*3+2] = feld[a][b].getWert(0, 2);
    prueffeld[a*3+1][b*3+2] = feld[a][b].getWert(1, 2);
    prueffeld[a*3+2][b*3+2] = feld[a][b].getWert(2, 2);

    a--;

    prueffeld[a*3+0][b*3+0] = feld[a][b].getWert(0, 0);
    prueffeld[a*3+1][b*3+0] = feld[a][b].getWert(1, 0);
    prueffeld[a*3+2][b*3+0] = feld[a][b].getWert(2, 0);
    prueffeld[a*3+0][b*3+1] = feld[a][b].getWert(0, 1);
    prueffeld[a*3+1][b*3+1] = feld[a][b].getWert(1, 1);
    prueffeld[a*3+2][b*3+1] = feld[a][b].getWert(2, 1);
    prueffeld[a*3+0][b*3+2] = feld[a][b].getWert(0, 2);
    prueffeld[a*3+1][b*3+2] = feld[a][b].getWert(1, 2);
    prueffeld[a*3+2][b*3+2] = feld[a][b].getWert(2, 2);

    if ( fuenfSenkrecht() || fuenfWaagrecht() || fuenfDiagAufsteigend() || fuenfDiagAbsteigend() ) {
      return true;
    } else {
      return false;
    }
  }

  private boolean fuenfSenkrecht()
  {
    for ( int i = 0; i < 6; i++ ) {
      for ( int j = 0; j < 2; j++ ) {
        int probeWert = prueffeld[i][j];
        if ( probeWert != 0 ) {
          if ( prueffeld[i][j+1] == probeWert && prueffeld[i][j+2] == probeWert && prueffeld[i][j+3] == probeWert && prueffeld[i][j+4] == probeWert ) {
            return true;
          }
        }
      }
    }

    return false;
  }

  private boolean fuenfWaagrecht()
  {
    for ( int i = 0; i < 2; i++ ) {
      for ( int j = 0; j < 6; j++ ) {
        int probeWert = prueffeld[i][j];
        if ( probeWert != 0 ) {
          if ( prueffeld[i+1][j] == probeWert && prueffeld[i+2][j] == probeWert && prueffeld[i+3][j] == probeWert && prueffeld[i+4][j] == probeWert ) {
            return true;
          }
        }
      }
    }

    return false;
  }

  private boolean fuenfDiagAufsteigend()
  {
    for ( int i = 0; i < 2; i++ ) {
      for ( int j = 4; j < 6; j++ ) {
        int probeWert = prueffeld[i][j];
        if ( probeWert != 0 ) {
          if ( prueffeld[i+1][j-1] == probeWert && prueffeld[i+2][j-2] == probeWert && prueffeld[i+3][j-3] == probeWert && prueffeld[i+4][j-4] == probeWert ) {
            return true;
          }
        }
      }
    }

    return false;
  }

  private boolean fuenfDiagAbsteigend()
  {
    for ( int i = 0; i < 2; i++ ) {
      for ( int j = 0; j < 2; j++ ) {
        int probeWert = prueffeld[i][j];
        if ( probeWert != 0 ) {
          if ( prueffeld[i+1][j+1] == probeWert && prueffeld[i+2][j+2] == probeWert && prueffeld[i+3][j+3] == probeWert && prueffeld[i+4][j+4] == probeWert ) {
            return true;
          }
        }
      }
    }

    return false;
  }
}
