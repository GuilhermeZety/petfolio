import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';
import 'package:petfolio/app/core/common/theme/app_fonts.dart';
import 'package:toastification/toastification.dart';

class Toasting {
  static void error(
    BuildContext context, {
    required String? title,
    String? description,
    Duration? duration = const Duration(seconds: 8),
    bool? showProgressBar = false,
    Alignment? location = Alignment.topCenter,
    ToastificationStyle? style = ToastificationStyle.flat,
    StackTrace? stackTrace,
  }) {
    // vibrate(FeedbackType.error);
    Toastification().show(
      context: context,
      type: ToastificationType.error,
      style: style,
      borderSide: BorderSide(color: context.colorScheme.tertiaryContainer),
      title: Text(
        title ?? 'Ocorreu um erro!',
        style: const TextStyle(fontWeight: AppFonts.bold),
      ),
      description: description != null ? Text(description) : null,
      alignment: location,
      autoCloseDuration: duration,
      showProgressBar: showProgressBar,
      dragToClose: true,
      backgroundColor: context.colorScheme.secondaryContainer,
      foregroundColor: context.textTheme.bodyLarge?.color,

      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  static void success(
    BuildContext context, {
    required String? title,
    String? description,
    Duration? duration = const Duration(seconds: 4),
    bool? showProgressBar = false,
    Alignment? location = Alignment.topCenter,
    ToastificationStyle? style = ToastificationStyle.flat,
    StackTrace? stackTrace,
  }) {
    // vibrate(FeedbackType.success);
    Toastification().show(
      context: context,
      type: ToastificationType.success,
      style: style,
      title: Text(
        title ?? 'Sucesso!',
        style: const TextStyle(fontWeight: AppFonts.bold),
      ),
      description: description != null ? Text(description) : null,
      alignment: location,
      autoCloseDuration: duration,
      showProgressBar: showProgressBar,
      dragToClose: true,
      backgroundColor: context.colorScheme.secondaryContainer,
      borderSide: BorderSide(color: context.colorScheme.tertiaryContainer),
      foregroundColor: context.textTheme.bodyLarge?.color,
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  static void noConnection(
    BuildContext context, {
    String? message,
    Duration? duration,
  }) {
    // vibrate(FeedbackType.error);
    error(
      context,
      title: 'Sem conexão com a internet!',
      description: message,
      duration: 3.seconds,
    );
  }

  static void warning(
    BuildContext context, {
    required String? title,
    String? description,
    Duration? duration = const Duration(seconds: 4),
    bool? showProgressBar = false,
    Alignment? location = Alignment.topCenter,
    ToastificationStyle? style = ToastificationStyle.flat,
    StackTrace? stackTrace,
  }) {
    // vibrate(FeedbackType.warning);
    Toastification().show(
      context: context,
      type: ToastificationType.warning,
      style: style,
      title: Text(
        title ?? 'Aconteceu algo inesperado!',
        style: const TextStyle(fontWeight: AppFonts.bold),
      ),
      description: description != null ? Text(description) : null,
      alignment: location,
      autoCloseDuration: duration,
      showProgressBar: showProgressBar,
      dragToClose: true,
      backgroundColor: context.colorScheme.secondaryContainer,
      borderSide: BorderSide(color: context.colorScheme.tertiaryContainer),
      foregroundColor: context.textTheme.bodyLarge?.color,
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
