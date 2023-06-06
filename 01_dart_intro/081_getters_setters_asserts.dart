void main() {
  final mySquare = Square(side: 10);

  print('area: ${mySquare.area}');
}

class Square {
  //Se usa _ para hacer una propiedad privada
  double _side;

  Square({required double side})
      //ASERCIONES AQUI
      : assert(side >= 0, 'side must be >= 0'),
        _side = side;

  double get area {
    return _side * _side;
  }

  set side(double value) {
    print('setting new value $value');
    if (value < 0) throw 'Value must be >= 0';

    _side = value;
  }

  double calculateArea() {
    return _side * _side;
  }
}
