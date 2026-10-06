import 'dart:ffi';

class Dadu {
  int land = 10;
  void landUse() {
    print("Tmr Dadur land chilo  $land");
  }
}

class Baba extends Dadu {
  int land = 20;
  void landUse() {
    print("Tmr babr land chilo  $land");
  }
}

class Ami extends Baba {
  int land = Baba().land + Dadu().land;
 void landUse() {
    print("Tmr Land Ache  $land");
  }
}


