
import 'dart:ui';

class ColorData{
  Color colorCode;
  bool selected;

  ColorData(Color color, bool isSelected)
      : this.colorCode = color,
        this.selected = isSelected;
}