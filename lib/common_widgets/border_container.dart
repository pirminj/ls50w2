import 'package:flutter/material.dart';

class BorderContainer extends StatelessWidget {
  const BorderContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.onSurface.withOpacity(0.4),
        ),
      ),
      child: child,
    );
  }
}
