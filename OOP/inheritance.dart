class Vehical {
  void drive() {
    print("Every Vehicale can Drive");
  }
}

class car extends Vehical {
  void refillGas() {
    print(" Car Drive and refill Gas");
  }

  
}

class EvCar extends Vehical {
  void recharge() {
    print("Electric Vehicale Recharged");
  }
}
