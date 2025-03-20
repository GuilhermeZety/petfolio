// ignore_for_file: use_build_context_synchronously

import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/core/common/theme/app_fonts.dart';

class InputDate extends StatelessWidget {
  final String? label;
  final TextEditingController controller;
  final String? Function(String?)? validation;
  final AutovalidateMode autovalidateMode;
  final List<TextInputFormatter>? formatter;
  final String? hint;
  final int? minLines;
  final int? maxLines;
  final bool readOnly;
  final bool showError;
  final Function(String?)? onChange;
  final Function()? onTap;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final bool hour;
  final DateTime? selectedDate;

  const InputDate(
    this.controller, {
    super.key,
    this.label,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.formatter,
    this.hint,
    this.minLines,
    this.maxLines,
    this.readOnly = false,
    this.showError = true,
    this.onChange,
    this.onTap,
    this.focusNode,
    this.prefixIcon,
    this.selectedDate,
  }) : hour = false;

  const InputDate.hour(
    this.controller, {
    super.key,
    this.label,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.formatter,
    this.hint,
    this.minLines,
    this.maxLines,
    this.readOnly = false,
    this.showError = true,
    this.onChange,
    this.onTap,
    this.focusNode,
    this.prefixIcon,
    this.selectedDate,
  }) : hour = true;

  @override
  Widget build(BuildContext context) {
    IconButton suffixIcon() {
      return IconButton(
        icon: Icon(hour ? Icons.access_time_rounded : Icons.calendar_month_rounded, color: AppColors.primaryDark),
        onPressed: () async {
          FocusScope.of(context).unfocus();
          if (hour) {
            TimeOfDay? selectedHour;
            if (controller.text.length >= 5) {
              selectedHour = TimeOfDay(hour: int.parse(controller.text.substring(0, 2)), minute: int.parse(controller.text.substring(3, 5)));
            }
            await showTimePicker(context: context, initialTime: selectedHour ?? TimeOfDay(hour: TimeOfDay.now().hour, minute: 0)).then((value) {
              if (value != null) {
                controller.text = value.format(context);
              }
              FocusScope.of(context).unfocus();
            });
            return;
          }
          showDatePicker(
            context: context,
            initialDate: selectedDate ?? DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  primaryColor: AppColors.primaryDark,
                  buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
                  colorScheme: ColorScheme.light(primary: AppColors.primaryDark, secondary: AppColors.primaryDark),
                ),
                child: child ?? const SizedBox(),
              );
            },
          ).then((value) {
            if (value != null) {
              controller.text = DateFormat('dd/MM/yyyy').format(value);
              FocusScope.of(context).unfocus();
            }
          });
        },
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text.rich(
            TextSpan(text: label!, children: [if (validation != null) TextSpan(text: ' *', style: TextStyle(color: context.colorScheme.error))]),
            style: TextStyle(fontWeight: AppFonts.bold, color: context.textTheme.titleMedium?.color, fontSize: 15),
          ),
        TextFormField(
          key: key,
          controller: controller,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          onChanged: onChange,
          autovalidateMode: autovalidateMode,
          validator:
              validation ??
              (value) {
                if (value == null) {
                  return 'Campo obrigatório';
                }
                if (hour) {
                  if (value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  if (value.length < 5) {
                    return 'Hora inválida';
                  }
                } else {
                  if (value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  if (value.length < 10) {
                    return 'Data inválida';
                  }
                }
                return null;
              },
          inputFormatters: [
            ...formatter ?? [],
            FilteringTextInputFormatter.allow(RegExp(r'[0-9/]')),
            hour ? TextInputMask(mask: ['99:99']) : TextInputMask(mask: ['99/99/9999']),
          ],
          keyboardType: TextInputType.datetime,
          readOnly: readOnly,
          focusNode: focusNode,
          style: TextStyle(color: AppColors.primaryDark, fontSize: 18),
          decoration: InputDecoration(
            // label: label,
            filled: true,
            fillColor: context.colorScheme.primaryContainer,
            suffixIcon: suffixIcon(),
            prefixIcon: prefixIcon,
            hintText: hint,
          ),
        ),
      ],
    );
  }
}
