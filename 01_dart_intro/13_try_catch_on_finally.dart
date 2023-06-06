void main() async {
  print('main');

  try {
    final value = await httpGet('xd.com');
    print(value);
  }
  //on trabajar en el tipo de error que recibamos
  on Exception catch (err) {
    print('Tenemos una Exception $err');
  } catch (err) {
    print('ALGO SALIO MAL: $err');
  }
  //finally es ejecutar el comando dentro de la funcion finally si o si, haya sido exito o error
  finally {
    print('Fin del trycatch');
  }

  print('end');
}

Future<String> httpGet(String url) async {
  await Future.delayed(Duration(seconds: 1));
  throw Exception('No hay parametros en el URL');
  //throw 'Error en la peticion';
  //return 'Tenemos un valor de la peticion';
}
