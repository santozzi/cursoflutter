import 'package:flutter/material.dart';

const Color _customColor = Color(0xFFff0000);
const List<Color> _colorThemes = [
  _customColor,
  Colors.green,
  Colors.brown,
  Colors.orange,
  Colors.blue,
  Colors.white,
  Colors.yellow
];

class AppTheme {
  final int selectedColor;
  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,
            'debe ser mayor que 0 y menor que ${_colorThemes.length}');
  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: _colorThemes[selectedColor],
        brightness: Brightness.light);
  }
}
