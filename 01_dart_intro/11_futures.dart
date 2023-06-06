void main() {
  print('main');
  httpGet('xd.com').then((value) {
    print(value);
  }).catchError((e) {
    print('Error $e');
  });
  print('end');
}

Future<String> httpGet(String url) {
  return Future.delayed(Duration(seconds: 1), () {
    throw 'Error en la peticion HTTP';
    //return 'Respuesta HTTP';
  });
}
