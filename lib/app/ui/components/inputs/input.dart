import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/extensions/widget/widget_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/core/common/theme/app_fonts.dart';

class Input extends StatefulWidget {
  final String? label;
  final TextInputType keyboard;
  final TextEditingController controller;
  final String? Function(String?)? validation;
  final AutovalidateMode autovalidateMode;
  final List<TextInputFormatter>? formatter;
  final String? hint;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool readOnly;
  final bool showError;
  final Function(String?)? onChange;
  final Function(String?)? onSubmitted;
  final Function()? onTap;
  final FocusNode? focusNode;
  final IconData? prefixIcon;
  final Color? fillColor;

  final bool isSearch;
  final void Function(String? value)? searchAction;

  const Input(
    this.controller, {
    super.key,
    this.label,
    this.keyboard = TextInputType.text,
    this.formatter,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.hint,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.readOnly = false,
    this.showError = true,
    this.onTap,
    this.onChange,
    this.focusNode,
    this.onSubmitted,
    this.prefixIcon,
    this.fillColor,
  }) : isSearch = false,
       searchAction = null;

  const Input.numeric(
    this.controller, {
    super.key,
    this.label,
    this.keyboard = TextInputType.number,
    this.formatter,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.hint,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.readOnly = false,
    this.showError = true,
    this.onTap,
    this.onChange,
    this.focusNode,
    this.prefixIcon,
    this.onSubmitted,
    this.fillColor,
  }) : isSearch = false,
       searchAction = null;

  const Input.email(
    this.controller, {
    super.key,
    this.label,
    this.keyboard = TextInputType.emailAddress,
    this.formatter,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.hint,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.readOnly = false,
    this.showError = true,
    this.onTap,
    this.onChange,
    this.focusNode,
    this.prefixIcon,
    this.onSubmitted,
    this.fillColor,
  }) : isSearch = false,
       searchAction = null;

  const Input.password(
    this.controller, {
    super.key,
    this.label,
    this.keyboard = TextInputType.visiblePassword,
    this.formatter,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.hint,
    this.minLines,
    this.maxLines,
    this.readOnly = false,
    this.showError = true,
    this.onTap,
    this.onChange,
    this.focusNode,
    this.prefixIcon,
    this.maxLength,
    this.onSubmitted,
    this.fillColor,
  }) : isSearch = false,
       searchAction = null;

  const Input.search(
    this.controller, {
    super.key,
    this.label,
    this.keyboard = TextInputType.text,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.hint = 'Busca',
    this.minLines,
    this.maxLines,
    this.readOnly = false,
    this.onTap,
    this.onChange,
    this.focusNode,
    this.searchAction,
    this.prefixIcon,
    this.maxLength,
    this.onSubmitted,
    this.fillColor,
  }) : showError = false,
       validation = null,
       formatter = null,
       isSearch = true;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool visible = false;
  final StreamController<String> streamController = StreamController<String>();

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  Stream<String> get textStream {
    widget.controller.addListener(() {
      // Atualiza a Stream com o novo valor
      streamController.add(widget.controller.text);
    });

    return streamController.stream;
  }

  @override
  Widget build(BuildContext context) {
    Widget? suffix;
    IconData? prefix = widget.prefixIcon;

    if (widget.keyboard == TextInputType.visiblePassword) {
      suffix =
          widget.keyboard == TextInputType.visiblePassword
              ? IconButton(color: AppColors.grey_500.changeOpacity(0.8), icon: Icon(visible ? Icons.visibility : Icons.visibility_off), onPressed: () => setState(() => visible = !visible))
              : null;
    } else if (widget.isSearch) {
      prefix = Icons.search;
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[
          Text.rich(
            TextSpan(text: widget.label!, children: [if (widget.validation != null) TextSpan(text: ' *', style: TextStyle(color: context.colorScheme.error))]),
            style: TextStyle(fontWeight: AppFonts.bold, color: context.textTheme.titleMedium?.color, fontSize: 15),
          ),
          const Gap(5),
        ],
        TextFormField(
          key: widget.key,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          canRequestFocus: !widget.readOnly,
          onFieldSubmitted: widget.onSubmitted,
          controller: widget.controller,
          autovalidateMode: widget.autovalidateMode,
          validator: widget.validation,
          inputFormatters: widget.formatter,
          keyboardType: widget.keyboard,
          minLines: widget.minLines,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines ?? 1,
          readOnly: widget.readOnly,
          obscureText: widget.keyboard == TextInputType.visiblePassword ? !visible : false,
          onChanged: (value) {
            if (widget.onChange != null) {
              widget.onChange!(value);
            }

            if (widget.searchAction != null) {
              widget.searchAction!(value);
            }
          },
          onTap: widget.onTap,
          focusNode: widget.focusNode ?? (widget.readOnly ? FocusNode(canRequestFocus: false) : null),
          style: TextStyle(color: context.textTheme.titleLarge?.color, fontSize: 16, fontWeight: AppFonts.normal),
          decoration: InputDecoration(
            counterText: '',
            filled: true,
            fillColor: widget.fillColor ?? context.colorScheme.primaryContainer,
            suffixIcon: suffix,
            errorMaxLines: 2,
            hintText: widget.hint,
            prefixIconConstraints: const BoxConstraints(minWidth: 55, minHeight: 55),
            prefixIcon: prefix != null ? SizedBox(width: 53, child: Icon(prefix, color: AppColors.grey_500)) : null,
          ),
        ),
        if (widget.maxLength != null)
          StreamBuilder(
            stream: textStream,
            builder:
                (_, snapshot) => Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [Text('${snapshot.data?.length ?? 0}/${widget.maxLength}', style: const TextStyle(color: AppColors.grey_600, fontSize: 12, fontWeight: AppFonts.bold))],
                ).pTop(4).pRight(8),
          ),
      ],
    );
  }
}
