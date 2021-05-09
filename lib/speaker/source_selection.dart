import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kef_ls50w2_client/kef_ls50w2_client.dart';
import 'package:ls50w2/dsp/equalizer_profile_notifier.dart';

import '../common_widgets/elevated_card.dart';
import '../settings/settings.dart';
import 'speaker_status_notifier.dart';

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

    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: sourcesToShow.length * 150),
        child: ElevatedCard(
          child: GridView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
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
        ),
      ),
    );
  }
}

class SourceSelectButton extends HookWidget {
  const SourceSelectButton({
    Key? key,
    required this.source,
    required this.iconData,
  }) : super(key: key);

  final SpeakerSource source;
  final IconData iconData;

  static double radius = 42.0;

  @override
  Widget build(BuildContext context) {
    final speakerValue = useProvider(Speaker.provider);
    final notifier = useProvider(Speaker.provider.notifier);
    final selectedColor = Colors.white;
    final unselectedColor =
        Theme.of(context).primaryIconTheme.color!.withOpacity(0.4);

    return speakerValue.when(
      data: (speaker) {
        final bool isCurrent = speaker.source == source;
        final Color color = isCurrent ? selectedColor : unselectedColor;
        return buildButton(
          color: color,
          onPressed: () async {
            if (isCurrent) return;
            notifier.selectSource(source);
            context.read(Settings.provider).equalizerProfiles.forEach(
              (name, profile) {
                if (profile.autoSwitch == source) {
                  context
                      .read(EQProfileNotifier.provider.notifier)
                      .selectProfile(name);
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text('Switched to EQ Profile $name'),
                        padding: const EdgeInsets.symmetric(horizontal: 42),
                        width: 800,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                }
              },
            );
          },
        );
      },
      loading: () => buildButton(color: unselectedColor),
      error: (error, stackTrace) => buildButton(color: unselectedColor),
    );
  }

  Widget buildButton({
    required Color color,
    void Function()? onPressed,
  }) {
    return Center(
      child: Container(
        height: radius * 2,
        width: radius * 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 4, color: color),
        ),
        child: IconButton(
          tooltip: source.name,
          iconSize: 32,
          splashRadius: radius,
          color: color,
          icon: Icon(iconData),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
