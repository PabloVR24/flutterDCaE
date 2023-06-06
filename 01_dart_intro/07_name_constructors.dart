void main() {
  final Map<String, dynamic> rawJson = {
    'name': 'TS',
    'power': 'money',
    'isAlive': true
  };

  final ironman = Hero.jsonRaw(rawJson);
  //final ironman = Hero(isAlive: true, power: 'money', name: 'Tony Stark');
  print(ironman);
}

class Hero {
  String name;
  String power;
  bool isAlive;

  Hero({required this.name, required this.power, required this.isAlive});

  Hero.jsonRaw(Map<String, dynamic> json)
      : name = json['name'] ?? 'Name not found',
        power = json['power'] ?? 'Power not found',
        isAlive = json['isAlive'] ?? 'isAlive not found';

  @override
  String toString() {
    return '$name, $power, isAlive: ${isAlive ? 'Yes' : 'No:('}';
  }
}
