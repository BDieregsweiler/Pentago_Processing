class Spieler{
 int n;
 boolean steinGesetzt;
 boolean dmdGedreht;
 
 Spieler(int z){
   n = z;
   steinGesetzt = false;
   dmdGedreht = false;
 }
 
 void resetteBooleanWerte(){
   steinGesetzt = false;
   dmdGedreht = false;
 }
 
 int getN(){
   return n;
 }
}
