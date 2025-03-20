import 'package:petfolio/app/core/common/extensions/double_extension.dart';

class NumberUtils {
  static int? onlyNumbers(String number) => int.tryParse(number.replaceAll(RegExp(r'[^0-9]'), ''));

  static String buildCurrencyValue(double value) => value == 0 ? 'ZERO' : 'R\$ ${value.roundToPrecision(2)}';
}

double? treatDouble(value) {
  if (value == null) return null;
  return double.tryParse(value.toString());
}
