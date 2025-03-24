import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:petfolio/app/core/common/errors/failures.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/theme/app_colors.dart';
import 'package:petfolio/app/core/common/theme/app_fonts.dart';
import 'package:petfolio/app/core/common/utils/toasting.dart';
import 'package:petfolio/app/ui/components/loader.dart';

// Custom buttons are created by extending the MaterialButton class.
class Button extends StatefulWidget {
  final Future<void> Function()? onPressed;
  final Widget child;
  final FocusNode? focusNode;
  final VoidCallback? onLongPress;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsets padding;
  final bool secondary;
  final bool disabled;
  final double? width;

  const Button({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.focusNode,
    this.onLongPress,
    this.disabled = false,
    this.backgroundColor,
    this.foregroundColor = AppColors.white,
    this.padding = const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
  }) : secondary = false;

  const Button.secondary({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.focusNode,
    this.onLongPress,
    this.disabled = false,
    this.backgroundColor,
    this.foregroundColor,
    this.padding = const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
  }) : secondary = true;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isLoading = false;
  late Future<void> Function() action;

  @override
  void initState() {
    action = () async {
      if (!mounted) return;
      if (widget.disabled) return;
      try {
        if (widget.onPressed == null) return;

        isLoading = true;
        if (!mounted) return;
        setState(() {});

        // vibrate(FeedbackType.light);
        await widget.onPressed!();

        isLoading = false;
        if (!mounted) return;
        setState(() {});
      } catch (err, stt) {
        log(err.toString(), error: err, stackTrace: stt, name: 'Erro no button');
        if (!mounted) return;
        if (err is TypeError) {
          Toasting.error(context, title: 'Erro: $err', stackTrace: err.stackTrace);
          return;
        }
        if (err is Failure) {
          Toasting.error(context, title: 'Erro: $err', stackTrace: err.stackTrace);
          return;
        }
        if (err is Exception) {
          Toasting.error(context, title: 'Erro: $err');
          return;
        }
        Toasting.error(context, title: 'Erro: $err');
      }
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: (widget.backgroundColor ??
              (widget.secondary
                  ? context.colorScheme.primaryContainer
                  : AppColors.primary))
          .changeOpacity(widget.disabled ? 0.6 : 1),
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        onTap: action,
        borderRadius: BorderRadius.circular(100),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: widget.width,
          padding: widget.padding,
          child: DefaultTextStyle(
            style: TextStyle(
              fontFamily: AppFonts.defaultFont,
              color:
                  widget.foregroundColor ??
                  (context.isDark ? AppColors.grey_300 : AppColors.primary),
              fontSize: 16,
              fontWeight: AppFonts.bold,
              letterSpacing: 0.3,
            ),
            child: Center(
              child:
                  isLoading
                      ? Loader(
                        size: widget.child.runtimeType == Row ? 24 : 16,
                        inverted: true,
                      )
                      : widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
