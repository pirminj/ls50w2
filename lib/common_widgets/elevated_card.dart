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
      // shadowColor: Theme.of(context).accentColor,
      elevation: interacting.value ? 0 : 16,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(48),
      ),
      margin: const EdgeInsets.all(16),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        excludeFromSemantics: true,
        onTap: () async {
          interacting.value = true;
          await Future.delayed(Duration(milliseconds: 200));
          interacting.value = false;
        },
        onTapDown: (_) => interacting.value = true,
        onTapUp: (_) => interacting.value = false,
        onTapCancel: () => interacting.value = false,
        child: child,
      ),
    );
  }
}
