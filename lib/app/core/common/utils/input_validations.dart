import 'package:intl/intl.dart';
import 'package:petfolio/app/core/common/utils/datetime_utils.dart';

class InputValidations {
  static String? simpleInputValidation(String? value, {int? minLengh}) {
    if (value == null || value.isEmpty) {
      return 'Preencha este campo';
    }
    if (minLengh != null && value.length < minLengh) {
      return 'Preencha com no mínimo $minLengh caracteres';
    }
    return null;
  }

  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return 'Preencha este campo';
    }
    return null;
  }

  static String? numberValidation(String? value, {num? minValue, num? maxValue}) {
    if (value == null || value.isEmpty) {
      return 'Preencha este campo';
    }
    if (minValue != null && num.parse(value) < minValue) {
      return 'O valor deve ser MAIOR que $minValue';
    }
    if (maxValue != null && num.parse(value) > maxValue) {
      return 'O valor deve ser MENOR que $maxValue';
    }
    return null;
  }

  static String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Insira o seu Email';
    }
    if (value.length < 10) {
      return 'Insira todo o Email';
    }
    if (value.contains('@') && value.contains('.com')) {
      return null;
    }
    return 'Email inválido';
  }

  static String? dateValidation(
    String? value, {
    DateTime? minDate,
    DateTime? maxDate,
  }) {
    //dd/MM/yyyy
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    int? day;
    int? month;
    int? year;

    if (value.length >= 2) {
      day = int.parse(value.substring(0, 2));

      if (day < 1 || day > 31) {
        return 'Dia inválido';
      }
    }
    if (value.length >= 5) {
      month = int.parse(value.substring(3, 5));

      if (month < 1 || month > 12) {
        return 'Mês inválido';
      }
    }
    if (value.length >= 10) {
      year = int.parse(value.substring(6, 10));

      if (year < 1900 || year > 2100) {
        return 'Ano inválido';
      }
    }
    if (value.length < 10 || value.length > 10) {
      return 'Insira uma data completa';
    }

    var date = DateTime(year!, month!, day!);

    if (minDate != null && date.isBefore(minDate)) {
      return 'Insira uma data depois de ${DateFormat('dd/MM/yyyy').format(minDate)}';
    }
    if (maxDate != null && date.isAfter(maxDate)) {
      return 'Insira uma data antes de ${DateFormat('dd/MM/yyyy').format(maxDate)}';
    }

    return null;
  }

  // min and max == hh:mm
  static String? hourValidation(String? value, {String? minDate, String? maxDate}) {
    //hh:mm
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    int? hour;
    int? minute;

    if (value.length >= 2) {
      hour = int.parse(value.substring(0, 2));

      if (hour < 0 || hour > 23) {
        return 'Hora inválida';
      }
    }

    if (value.length >= 5) {
      minute = int.parse(value.substring(3, 5));

      if (minute < 0 || minute > 59) {
        return 'Minuto inválido';
      }
    }

    if (value.length < 5 || value.length > 5) {
      return 'Insira uma hora completa';
    }

    var date = DateTime(0, 0, 0, hour!, minute!);

    if (minDate != null) {
      var thisdate = DateTimeUtils.getDateFromHour(minDate);
      if (thisdate == null) {
        return 'Insira uma hora minima válida';
      }
      if (thisdate.isAfter(date)) {
        return 'Insira no mínimo $minDate';
      }
    }

    if (maxDate != null) {
      var thisdate = DateTimeUtils.getDateFromHour(maxDate);
      if (thisdate == null) {
        return 'Insira uma data maxima válida';
      }
      if (thisdate.isBefore(date)) {
        return 'Insira no máximo  $maxDate';
      }
    }
    return null;
  }
}
