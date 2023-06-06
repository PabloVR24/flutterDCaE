void main() {
  final windPlant = WindPlant(initialEnergy: 5);
  print('wind: ${chargePhone(windPlant)}');
}

double chargePhone(EnergyPlant plant){
  if(plant.energyLeft <10){
    throw Exception('Not enough energy');
  }
  return plant.energyLeft -10;
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

// extends e implements

// extends es heredar
class WindPlant extends EnergyPlant {
  WindPlant({required double initialEnergy})
      //Super es para el contructor de la clase que estamos heredando
      : super(energyLeft: initialEnergy, type: PlantType.wind);

  @override
  //Para la implementacion del void de la clase heredada, tiene que estar al pie de todo, nombre, propiedades, mayus minus
  void consumeEnergy(double amount) {
    energyLeft -= amount;
  }
}