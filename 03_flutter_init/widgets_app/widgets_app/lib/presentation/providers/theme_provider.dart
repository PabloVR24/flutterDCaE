import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider((ref) => false);

//!Listado de Colores Inmutable
final colorListProvider = Provider((ref) => colorList);


//!Listado de Colores Inmutable
final selectedColorProvider= StateProvider((ref) => 0);