import 'package:flutter/material.dart';

class LimitedWidthContainer extends StatelessWidget {
  const LimitedWidthContainer({
    Key? key,
    required this.child,
    this.maxWidth = 900.0,
  }) : super(key: key);

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
