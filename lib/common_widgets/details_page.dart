import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers.dart';
import '../utils.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.child, this.title = ''})
      : super(key: key);

  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        automaticallyImplyLeading: !isDesktop,
        actions: [
          if (isDesktop)
            IconButton(
              tooltip: 'Close',
              onPressed: () {
                var navigator = Navigator.of(context);
                if (navigator.canPop()) navigator.pop();
                context.read(detailsProvider).state = null;
              },
              icon: Icon(Icons.close),
            ),
        ],
      ),
      body: child,
    );
  }
}
