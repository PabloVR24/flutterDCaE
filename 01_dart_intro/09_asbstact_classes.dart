void main() {
 // final windPlant = EnergyPlant();
}

//Enumerador
enum PlantType { nuclear, wind, water }

abstract class EnergyPlant {
  double energyLeft;
  PlantType type;

  EnergyPlant({required this.energyLeft, required this.type});

  //Para implements
  void consumeEnergy(double amount);
}
