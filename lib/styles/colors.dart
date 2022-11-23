import 'package:flutter/material.dart';

Color customColorViolet = fromHex('9053EB');
Color customColorBlack = Colors.black;
Color customColorWhite = Colors.white;
Color customColorGrey = fromHex('D0D0D0');

Map<int, Color> paletteOfShades =
{
  50:Color.fromRGBO(158,158,158, .1),
  100:Color.fromRGBO(158,158,158, .2),
  200:Color.fromRGBO(158,158,158, .3),
  300:Color.fromRGBO(158,158,158, .4),
  400:Color.fromRGBO(158,158,158, .5),
  500:Color.fromRGBO(158,158,158, .6),
  600:Color.fromRGBO(158,158,158, .7),
  700:Color.fromRGBO(158,158,158, .8),
  800:Color.fromRGBO(158,158,158, .9),
  900:Color.fromRGBO(158,158,158, 1),
};

MaterialColor customMaterialColorViolet = MaterialColor(0xFF9053EB, paletteOfShades);

int getCodeColor(String hexString) {
  final buffer = StringBuffer();

  int i = hexString.length;
  while (i < 8) {
    buffer.write('f');
    i++;
  }
  buffer.write(hexString.replaceFirst('#', ''));
  return int.parse(buffer.toString(), radix: 16);
}

Color fromHex(String hexString) {
  return Color(getCodeColor(hexString));
}

bool checkColor(String colorCheck) {
  try {
    Color hexColor = fromHex(colorCheck);
    return true;
  } catch (e) {
    return false;
  }
}