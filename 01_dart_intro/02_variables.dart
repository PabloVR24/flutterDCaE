void main() {
  final String pokemon = 'Pikachu';
  final int hp = 100;
  final bool isAlive = true;

  final List<String> abilities = ['impostor'];
  final sprites = <String>['pkch.png', 'pkch1.png'];

  dynamic errorMessage = 'Hola';
  errorMessage = true;
  errorMessage = [1, 2, 3, 4, 5, 6, 7];
  errorMessage = {1, 2, 3, 4, 5, 6, 7};

  print("""
  $pokemon
  $hp
  $isAlive
  $abilities
  $sprites
  $errorMessage
  """);
}
