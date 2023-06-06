void main() {
// void para especificar que no retornaremos valor

  print(greetEveryone());
  print(greetEveryonea());
  print('Suma: ${addTwoNumers(10, 20)}');
  print('Suma Arrow: ${addTwoNumersa(10, 30)}');
  print('Suma Arrow: ${addTwoNumersOptional(10)}');
}

//Agregar seguridad de type
String greetEveryone() {
  return 'Hello!';
}

//Funciones de fecha
String greetEveryonea() => 'Hello Everyone';
int addTwoNumersa(int a, int b) => a + b;

//Valores Obligatorios
int addTwoNumers(int a, int b) {
  return a + b;
}

//Valor Opcional
int addTwoNumersOptional(int a, [int b = 0]) {
  //b = b ?? 0;
  return a + b;
}
