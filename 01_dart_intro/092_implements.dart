void main() {
  final windPlant = WindPlant(initialEnergy: 15);
  final nuclearPlant = NuclearPlant(energyLeft: 1000);

  print('wind: ${chargePhone(windPlant)}');
  print('nuclear: ${chargePhone(nuclearPlant)}');
}

double chargePhone(EnergyPlant plant) {
  if (plant.energyLeft < 10) {
    throw Exception('Not enough energy');
  }
  return plant.energyLeft - 10;
}

//Enumerador
enum PlantType { nuclear, wind, water }

abstract class EnergyPlant {
  double energyLeft;
  final PlantType type;

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

//IMPLEMTENTS AQUI
//implements sirve para no mandar traer todo el objeto, solo alguna funcion
class NuclearPlant implements EnergyPlant {
  @override
  double energyLeft;
  @override
  final PlantType type = PlantType.nuclear;

  NuclearPlant({required this.energyLeft});

  @override
  void consumeEnergy(double amount) {
    energyLeft -= (amount * 0.5);
  }
}
