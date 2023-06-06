void main() {
  final numbers = [1, 2, 3, 4, 5, 5, 5, 6, 7, 8, 9, 9, 10];

  print('List original $numbers');
  print('Length ${numbers.length}');

  print('Index 0 ${numbers[0]}');
  print('First 0 ${numbers.first}');

  print('Reversed ${numbers.reversed}');

  //Iterable debido a que usa ( )
  final reversedNumbers = numbers.reversed;
  print('Iterable $reversedNumbers');

  //Reconvertir a List
  print('List ${reversedNumbers.toList()}');

  //Set no repite valores
  print('Set ${reversedNumbers.toSet()}');

  final numbersGreaterThan5 = numbers.where((int num) {
    return num > 5; //true
  });

  print('>5 $numbersGreaterThan5');

  print('>5set ${numbersGreaterThan5.toSet()}');
}
