import 'dart:ui';

final primaryDarkBlue = Color.fromRGBO(34, 49, 63, 1);
final primaryLightBlue = Color.fromRGBO(72, 178, 216, 1);
final primaryLightGrey = Color.fromRGBO(235, 235, 235, 1);

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    var newcolor = Color(int.parse(buffer.toString(), radix: 16));
    return newcolor;
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}