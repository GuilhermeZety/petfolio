import 'package:flutter/material.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';

Future<T?> showCustomDialog<T>(
  BuildContext context, {
  required Widget child,
  bool isDismissible = true,
  bool isScrollControlled = true,
  bool enableDrag = true,
  double elevation = 0,
  double? maxHeight,
}) async {
  return showModalBottomSheet<T>(
    context: context,
    backgroundColor: Colors.transparent,
    constraints: BoxConstraints(maxHeight: maxHeight ?? (context.height * 0.90), minHeight: context.height * 0.4),
    isDismissible: isDismissible,
    isScrollControlled: isScrollControlled,
    enableDrag: enableDrag,
    elevation: elevation,
    builder: (context) => child,
  );
}
