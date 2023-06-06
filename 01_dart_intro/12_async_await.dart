void main() async {
  print('main');

  try {
    final value = await httpGet('xd.com');
    print(value);
  } catch (err) {
    print('Tenemos un error $err');
  }

  print('end');
}

Future<String> httpGet(String url) async {
  await Future.delayed(Duration(seconds: 1));
  throw 'Error en la peticion';
  //return 'Tenemos un valor de la peticion';
}
