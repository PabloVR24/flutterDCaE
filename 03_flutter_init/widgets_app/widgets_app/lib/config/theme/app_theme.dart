import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.pink
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.isDarkMode = false, this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected Color must be greater than 0'),
        assert(selectedColor < colorList.length,
            'Selected Color must be less than ${colorList.length}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: true));

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode);
}
