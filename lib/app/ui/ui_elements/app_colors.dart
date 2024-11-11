import 'package:flutter/material.dart';

//Gradient Colors
// const color1 = Color.fromRGBO(42, 40, 36, 1);
// const color2 = Color.fromRGBO(117, 116, 112, 1);
// const color3 = Color.fromRGBO(136, 133, 118, 1);
// const color4 = Color.fromRGBO(97, 93, 82, 1);

const color1 = Color.fromRGBO(63, 5, 5, 1);
const color2 = Color.fromRGBO(194, 195, 223, 1);
const color3 = Color.fromRGBO(187, 25, 25, 1);
const color4 = Color.fromRGBO(88, 38, 38, 1);

class MyColors {
  MyColors();

  final paletteColor1 = const Color.fromARGB(255, 73, 2, 2);
  final paletteColor2 = const Color.fromRGBO(223, 215, 194, 1);
  final paletteColor3 = const Color.fromARGB(255, 199, 8, 8);
  final paletteColor4 = const Color.fromARGB(255, 201, 110, 110);

  final titleColor = const Color.fromARGB(255, 223, 221, 210);
  final whiteColor = const Color.fromARGB(255, 223, 221, 210);
  final gold = const Color.fromARGB(255, 202, 174, 16);

  final iconColor = const Color.fromARGB(255, 44, 123, 175);

  final alertColor = const Color.fromARGB(255, 170, 11, 11);
  final sucessMessageColor = const Color.fromARGB(255, 5, 87, 25);
  final dialogWidgetColor = const Color.fromARGB(255, 3, 5, 109);

  List<Color> colorsPalette1 = [
    const Color.fromRGBO(42, 40, 36, 0),
    const Color.fromRGBO(223, 215, 194, 0),
    const Color.fromRGBO(247, 219, 76, 0),
    const Color.fromRGBO(97, 93, 82, 0),
  ];

  final gradientColors2 = [color1, color3, color4];

  gradientHomePage() {
    return LinearGradient(
      colors: gradientColors2,
      tileMode: TileMode.decal,
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    );
  }

  gradientHomePageTitle() {
    return LinearGradient(
      colors: gradientColors2,
      tileMode: TileMode.mirror,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  List<Color> buttonColors = [
    const Color.fromARGB(255, 7, 5, 83),
    const Color.fromARGB(255, 23, 16, 126),
    const Color.fromARGB(255, 50, 19, 187),
    const Color.fromARGB(255, 7, 5, 83),
  ];

  gradientButton() {
    return LinearGradient(
      colors: buttonColors,
      tileMode: TileMode.decal,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  final gradientColors = [color1, color2, color3, color4];
  gradientAuth() {
    return const LinearGradient(
      colors: [color1, color2, color3, color4],
      tileMode: TileMode.decal,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
