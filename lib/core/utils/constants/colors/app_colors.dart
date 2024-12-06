import 'package:flutter/material.dart';
import 'hex_color.dart';

class AppColors {
  AppColors._();

  static Color appWhite = HexColor('#FFFFFF');
  static Color appBlack = HexColor('#000000');
  static Color appGrey7070 = HexColor('#707070');
  static Color appGrey5c5c = HexColor('#5c5c5c');
  static Color appGrey8e8e = HexColor('#e8e8e8');
  static Color appGrey4646 = HexColor('#464646');
  static Color appGrey7f7f = HexColor('#f7f7f7');
  static Color appGrey3e3e = HexColor('#e3e3e3');
  static Color appGrey9e9e = HexColor('#9e9e9e');
  static Color appPaleYellow = HexColor('#d3b257');
  static Color appYellow = HexColor('#ffde82');
  static Color appRed0020 = HexColor('#b00020');
  static Color appRed44336 = HexColor('#F44336');
  static Color appGreyWhite = HexColor('#dbd4d4');
  static Color appGreen = HexColor('#4CAF50');
  static Color appBlueGreen = HexColor('#607D8B');
  static Color appOrange = HexColor('#FF9800');
  static Color appCyan = HexColor('#21B7CA');
  static Color appLightGrey = HexColor('#F7F7F7');
  static Color appLightBlueGrey = Colors.blueGrey[50]!;



  // COLORS WITH OPACITY
  static Color appWhite70Opacity = HexColor('#FFFFFF').withOpacity(0.70);
  static Color appBlack10Opacity = HexColor('#000000').withOpacity(0.1);
  static Color appBlack12Opacity = HexColor('#000000').withOpacity(0.12);
  static Color appBlack87Opacity = HexColor('#000000').withOpacity(0.87);
  static Color appBlack45Opacity = HexColor('#000000').withOpacity(0.45);
  static Color appBlack54Opacity = HexColor('#000000').withOpacity(0.54);
  static Color appBlack38Opacity = HexColor('#000000').withOpacity(0.38);
  static Color appGrey20Opacity = HexColor('#9e9e9e').withOpacity(0.20);

  // COLORS WITH SHADE
  static Color appGreyShade200 = HexColor('#EEEEEE');
  static Color appGreyShade300 = HexColor('#E0E0E0');
  static Color appGreyShade500 = HexColor('#9e9e9e');

  // TRANSPARENT COLOR
  static Color appTransparent = Colors.transparent;
}
