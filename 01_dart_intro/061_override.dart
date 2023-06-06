void main() {
  final Hero ironMan = Hero(name: 'IronMan', power: 'Vuela');
  print(ironMan);
  print(ironMan.name);
  print(ironMan.power);
}

class Hero {
  //? opcional
  String name;
  String power;

  Hero({required this.name, this.power = 'NULO'});

  //INICIALIZACION CONTROLADA
  //Hero(String pName, String pPower)
  //  : name = pName,
  //power = pPower;

  @override
  toString() {
    return '$name - $power';
  }
}
