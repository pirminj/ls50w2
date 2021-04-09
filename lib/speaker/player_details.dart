import 'package:flutter/material.dart';

import '../common_widgets/elevated_card.dart';

class PlayerDetails extends StatelessWidget {
  const PlayerDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Now playing'),
            Text(
              'Romeo and Juliet',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'DireStraits',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}
