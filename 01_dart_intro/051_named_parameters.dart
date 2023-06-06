void main() {
// void para especificar que no retornaremos valor

  print(greetEveryonea());
  print('Suma Arrow: ${addTwoNumersa(10, 30)}');
  print('Suma Arrow: ${addTwoNumersOptional(10)}');
  print(greetPerson(name: 'Pablo', message: 'Que onda'));
}

String greetEveryonea() => 'Hello Everyone';
int addTwoNumersa(int a, int b) => a + b;

//Valor Opcional
int addTwoNumersOptional(int a, [int b = 0]) {
  //b = b ?? 0;
  return a + b;
}

String greetPerson({required String name, String message = 'Hola,'}) {
  return '$message $name';
}
