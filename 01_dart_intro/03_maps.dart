void main() {
  final Map<String, dynamic> pokemon = {
    'name': 'Pikachu',
    'hp': 100,
    'isAlive': true,
    'abilities': <String>['impostor'],
    'sprites': {1: 'pkch.png', 2: 'pkch2.png'}
  };

  print(pokemon);
  print('name: ${pokemon['name']}');
  print('sprites: ${pokemon['sprites']}');

  print('front: ${pokemon['sprites'][1]}');
  print('back: ${pokemon['sprites'][2]}');
}
