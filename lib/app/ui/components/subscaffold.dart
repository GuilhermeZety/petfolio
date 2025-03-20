import 'package:flutter/material.dart';
import 'package:petfolio/app/core/common/extensions/context_extension.dart';

class SubScaffold extends StatefulWidget {
  const SubScaffold({super.key, this.bottom, this.readOnly = false, required this.body, this.top, this.safeArea = true});

  final Widget? top;
  final Widget? bottom;
  final Widget body;
  final bool readOnly;
  final bool safeArea;

  @override
  State<SubScaffold> createState() => _SubScaffoldState();
}

class _SubScaffoldState extends State<SubScaffold> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: widget.safeArea,
      bottom: widget.safeArea,
      child: Stack(
        children: [
          Positioned.fill(child: widget.body),
          if (widget.readOnly) Positioned.fill(child: Container(color: Colors.black26)),
          if (widget.bottom != null) Positioned(bottom: 0, left: 0, right: 0, child: SafeArea(child: widget.bottom ?? const SizedBox())),
          if (widget.top != null) SizedBox(width: context.width, height: context.height, child: SafeArea(child: widget.top ?? const SizedBox())),
        ],
      ),
    );
  }
}
