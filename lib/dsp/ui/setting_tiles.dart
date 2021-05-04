import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kef_ls50w2_client/kef_ls50w2_client.dart';

import '../equalizer_profile_notifier.dart';

class TrebleTrimTile extends HookWidget {
  const TrebleTrimTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trebleTrim = useProvider(
      EQProfileNotifier.provider.select((profile) => profile.trebbleTrim),
    );
    final value = useState(trebleTrim);
    return Column(
      children: [
        ListTile(
          title: Text('Treble trim'),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8, right: 8),
          child: Column(
            children: [
              Slider(
                value: value.value,
                min: -3,
                max: 3,
                label: '$value dB',
                divisions: 24,
                onChangeEnd: (value) {
                  context
                      .read(EQProfileNotifier.provider.notifier)
                      .updateTrebleTrim(value);
                },
                onChanged: (trim) {
                  value.value = trim;
                },
              ),
              Row(
                children: [
                  SizedBox(width: 16),
                  Text('-3 dB'),
                  Spacer(),
                  Text('0 dB'),
                  Spacer(),
                  Text('3 dB'),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class PhaseCorrectionTile extends HookWidget {
  const PhaseCorrectionTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doPhaseCorrection = useProvider(
      EQProfileNotifier.provider.select((value) => value.phaseCorrection),
    );
    return SwitchListTile(
      title: Text('Phase correction'),
      value: doPhaseCorrection,
      onChanged: (value) => context
          .read(EQProfileNotifier.provider.notifier)
          .updatePhaseCorrection(value),
    );
  }
}

class BassExtensionTile extends HookWidget {
  const BassExtensionTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bassExtension = useProvider(
      EQProfileNotifier.provider.select((value) => value.bassExtension),
    );
    final theme = Theme.of(context);
    return Column(
      children: [
        ListTile(
          title: Text('Bass extension'),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ToggleButtons(
            selectedColor: theme.colorScheme.onSecondary,
            fillColor: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(32),
            children: [
              buildButton('Less'),
              buildButton('Standard'),
              buildButton('More'),
            ],
            isSelected:
                BassExtension.values.map((e) => e == bassExtension).toList(),
            onPressed: (index) {
              context
                  .read(EQProfileNotifier.provider.notifier)
                  .updateBassExtension(BassExtension.values[index]);
            },
          ),
        ),
      ],
    );
  }

  Container buildButton(String option) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      child: Text(option),
    );
  }
}

class DeskModeTile extends HookWidget {
  const DeskModeTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deskMode = useProvider(
      EQProfileNotifier.provider.select((value) => value.deskMode),
    );
    final _active = useState(deskMode == null);
    return Column(
      children: [
        SwitchListTile(
          title: Text('Desk mode'),
          value: _active.value,
          onChanged: (value) => _active.value = value,
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: _active.value
              ? Slider(
                  onChanged: (value) => {},
                  value: 0,
                )
              : SizedBox.shrink(),
        ),
      ],
    );
  }
}

class WallModeTile extends HookWidget {
  const WallModeTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deskMode = useProvider(
      EQProfileNotifier.provider.select((value) => value.wallMode),
    );
    final _active = useState(deskMode == null);
    return Column(
      children: [
        SwitchListTile(
          title: Text('Wall mode'),
          value: _active.value,
          onChanged: (value) => _active.value = value,
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: _active.value
              ? Slider(
                  onChanged: (value) => {},
                  value: 0,
                )
              : SizedBox.shrink(),
        ),
      ],
    );
  }
}
