import 'dart:ui';

enum KagiColors {
  sourceBlue(Color.fromARGB(255, 0, 64, 229)),
  blue(Color.fromARGB(255, 66, 102, 197,)),
  yellow(Color.fromARGB(255, 255, 179, 25)),
  fuchsia(Color.fromARGB(255, 206, 58, 182)),
  lightGrayBackground(Color.fromARGB(255, 239, 239, 239)),
  lightGray(Color.fromARGB(255, 209, 212, 219)),
  gray(Color.fromARGB(255, 98, 98, 98)),
  red(Color.fromARGB(255, 220, 38, 38)),
  // Colors introduced in frame 1630 of the design doc
  orange(Color.fromARGB(255, 185, 101, 28)),
  tanGreen(Color.fromARGB(255, 101, 111, 0)),
  green(Color.fromARGB(255, 0, 111, 5)),
  blueGreen(Color.fromARGB(255, 0, 130, 166)),
  purple(Color.fromARGB(255, 114, 50, 219)),
  darkOrchid(Color.fromARGB(255, 153, 50, 184)),
  magenta(Color.fromARGB(255, 190, 18, 133));

  static const categoryColors = [
    red,
    orange,
    tanGreen,
    green,
    blueGreen,
    purple,
    darkOrchid,
    magenta
  ];

  final Color color;

  const KagiColors(this.color);
}
