import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kef_ls50w2_client/kef_ls50w2_client.dart';

import '../settings/settings.dart';
import 'speaker_status_notifier.dart';

class TurnOnOffButton extends HookWidget {
  const TurnOnOffButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final speakerValue = useProvider(Speaker.provider);
    final shouldShow = useProvider(
      Settings.provider.select((value) => value.showOnOffButton),
    );

    if (!shouldShow) {
      return Container();
    }

    return speakerValue.when(
      data: (speaker) {
        switch (speaker.status) {
          case SpeakerStatus.standby:
            return buildIconButton(
              onPressed: () => context.read(Speaker.provider.notifier).turnOn(),
            );
          case SpeakerStatus.powerOn:
            return buildIconButton(
              iconTheme: Theme.of(context).accentIconTheme,
              onPressed: () =>
                  context.read(Speaker.provider.notifier).turnOff(),
            );
        }
      },
      loading: () => buildIconButton(),
      error: (error, stackTrace) => buildIconButton(),
    );
  }

  Widget buildIconButton(
      {IconThemeData? iconTheme, void Function()? onPressed}) {
    return Center(
      child: IconButton(
        icon: Icon(
          Icons.power_settings_new,
          color: iconTheme?.color,
        ),
        iconSize: 60,
        onPressed: onPressed,
      ),
    );
  }
}
