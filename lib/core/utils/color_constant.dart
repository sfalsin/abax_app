import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color blueA400 = fromHex('#2f6eed');

  static Color gray4006c = fromHex('#6cc7c5c8');

  static Color lightBlue700 = fromHex('#008ad1');

  static Color lightGreen200 = fromHex('#d7e1b3');

  static Color gray1006c = fromHex('#6cf4f2f5');

  static Color black9003f = fromHex('#3f000000');

  static Color green400 = fromHex('#44b47e');

  static Color black900 = fromHex('#000000');

  static Color gray804 = fromHex('#38393a');

  static Color purple400 = fromHex('#a155b9');

  static Color gray600 = fromHex('#828282');

  static Color gray402 = fromHex('#b1b0b2');

  static Color gray403 = fromHex('#c1c1c1');

  static Color gray400 = fromHex('#c7c5c8');

  static Color blue900 = fromHex('#165baa');

  static Color gray301 = fromHex('#dddcde');

  static Color gray401 = fromHex('#bdbdbd');

  static Color gray500 = fromHex('#9b9a9c');

  static Color gray901 = fromHex('#242424');

  static Color gray802 = fromHex('#454545');

  static Color gray803 = fromHex('#4f4f4f');

  static Color gray800 = fromHex('#494950');

  static Color blue500 = fromHex('#2e9bff');

  static Color gray900 = fromHex('#101820');

  static Color lime900 = fromHex('#7a9a01');

  static Color gray801 = fromHex('#39383a');

  static Color gray101 = fromHex('#f4f2f5');

  static Color gray200 = fromHex('#ebebeb');

  static Color gray201 = fromHex('#efefef');

  static Color gray300 = fromHex('#dadada');

  static Color gray102 = fromHex('#f6f6f6');

  static Color gray100 = fromHex('#f5f5f5');

  static Color whiteA70000 = fromHex('#00ffffff');

  static Color whiteA700Db = fromHex('#dbffffff');

  static Color bluegray400 = fromHex('#868588');

  static Color lightGreen50 = fromHex('#f2f5e6');

  static Color blue300 = fromHex('#63aafc');

  static Color black90019 = fromHex('#19000000');

  static Color whiteA700 = fromHex('#ffffff');

  static Color gray50019 = fromHex('#19adadad');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
