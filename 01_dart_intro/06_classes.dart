void main() {
  final Hero ironMan = Hero('IronMan', 'VuelaALV');
  print(ironMan);
  print(ironMan.name);
  print(ironMan.power);
}

class Hero {
  //? opcional
  String name;
  String power;

  Hero(this.name, this.power);

  //INICIALIZACION CONTROLADA
  //Hero(String pName, String pPower)
  //  : name = pName,
  //power = pPower;
}
