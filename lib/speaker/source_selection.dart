import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kef_ls50w2_client/kef_ls50w2_client.dart';

import '../common_widgets/elevated_card.dart';
import '../main.dart';
import '../settings/settings.dart';

class SourceSelection extends HookWidget {
  const SourceSelection({
    Key? key,
  }) : super(key: key);

  static Map<SpeakerSource, IconData> icons = {
    SpeakerSource.wifi: Icons.wifi,
    SpeakerSource.bluetooth: Icons.bluetooth,
    SpeakerSource.tv: Icons.tv,
    SpeakerSource.optic: Icons.remove_red_eye_outlined,
    SpeakerSource.coaxial: Icons.code,
    SpeakerSource.analog: Icons.linear_scale,
  };

  @override
  Widget build(BuildContext context) {
    final sourcesToShow = useProvider(Settings.provider).showSources;

    return ElevatedCard(
      child: GridView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        physics: NeverScrollableScrollPhysics(),
        children: [
          ...sourcesToShow.map(
            (source) => SourceSelectButton(
              source: source,
              iconData: icons[source] ?? Icons.ac_unit,
            ),
          ),
        ],
      ),
    );
  }
}
