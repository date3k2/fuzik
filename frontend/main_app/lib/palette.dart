import 'package:flutter/cupertino.dart';

sealed class Palette {
  Color get color;
}

enum PalettePrimary implements Palette {

  navy(Color(0xFF222D39)),
  yellow15(Color(0xFFFFFEB8)),
  yellowLight(Color(0xFFFFFD89)),
  yellow(Color(0xFFFFFF00)),
  yellowDark(Color(0xFFCCC80E)),
  yellowExtraDark(Color(0xFF807D09)),
  white(Color(0xFFFFFFFF)),
  navyDark(Color(0xFF131920)),
  cherry(Color(0xFFFF9999)),
  mint(Color(0xFF99FFAA)),
  gray(Color(0xFF333333)),
  grayLight(Color(0xFFCCCCCC));

  const PalettePrimary(this.color);

  @override
  final Color color;
}