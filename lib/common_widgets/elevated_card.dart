import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ElevatedCard extends HookWidget {
  const ElevatedCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final interacting = useState(false);
    return Card(
      elevation: interacting.value ? 24 : 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(48),
      ),
      margin: const EdgeInsets.all(16),
      child: MouseRegion(
        onEnter: (event) => interacting.value = true,
        onExit: (event) => interacting.value = false,
        child: child,
      ),
    );
  }
}
