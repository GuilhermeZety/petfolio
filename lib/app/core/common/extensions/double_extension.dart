import 'dart:math';

extension RoundToPrecision on double {
  double roundToPrecision(int precisao) {
    final multiplicador = pow(10, precisao);
    return (this * multiplicador).round() / multiplicador;
  }
}

extension RoundToPrecisionWithNull on double? {
  double? roundToPrecision(int precisao) {
    if (this == null) return null;
    final multiplicador = pow(10, precisao);
    return (this! * multiplicador).round() / multiplicador;
  }
}
