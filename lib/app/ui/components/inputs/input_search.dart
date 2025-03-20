import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/ui/components/loader.dart';
import 'package:petfolio/main.dart';

class InputSearch extends StatefulWidget {
  final String? label;
  final TextInputType keyboard;
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
  final Future<void> Function(String?) searchAction;
  final Function()? onTap;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final Color? fillColor;

  const InputSearch(
    this.controller, {
    super.key,
    this.label,
    required this.searchAction,
    this.keyboard = TextInputType.text,
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
    this.fillColor,
  });

  const InputSearch.numeric(
    this.controller, {
    super.key,
    this.label,
    required this.searchAction,
    this.keyboard = TextInputType.number,
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
    this.fillColor,
  });
  @override
  State<InputSearch> createState() => _InputSearchState();
}

class _InputSearchState extends State<InputSearch> {
  bool visible = false;

  Timer? searchTimer;

  void search() {
    searchTimer?.cancel();

    searchTimer = Timer(const Duration(milliseconds: 300), () async {
      await widget.searchAction(widget.controller.text);
      if (mounted) setState(() {});
    });

    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) ...[Text(widget.label!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14 * session.fontSize)), const Gap(5)],
        TextFormField(
          key: widget.key,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          controller: widget.controller,
          autovalidateMode: widget.autovalidateMode,
          validator: widget.validation,
          inputFormatters: widget.formatter,
          keyboardType: widget.keyboard,
          minLines: widget.minLines,
          maxLines: widget.maxLines ?? 1,
          readOnly: widget.readOnly,
          obscureText: widget.keyboard == TextInputType.visiblePassword ? !visible : false,
          onChanged: (value) {
            widget.onChange?.call(value);
            search();
          },
          onTap: widget.onTap,
          focusNode: widget.focusNode,
          style: TextStyle(color: context.textTheme.titleLarge?.color, fontSize: 15),
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.fillColor ?? context.colorScheme.secondaryContainer,
            errorMaxLines: 2,
            prefixIcon: widget.prefixIcon,
            hintStyle: context.theme.inputDecorationTheme.hintStyle?.copyWith(color: context.isDark ? widget.fillColor?.lighten(0.2) : widget.fillColor?.darken(0.3)),
            hintText: widget.hint,
            suffixIcon:
                searchTimer?.isActive == true
                    ? const Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [Loader(size: 20)])
                    : widget.controller.text.isNotEmpty
                    ? GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        widget.controller.clear();
                        widget.searchAction('');
                      },
                      child: Icon(Icons.cancel, color: context.textTheme.displayMedium?.color, size: 20),
                    )
                    : const SizedBox(),
            suffixIconColor: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
