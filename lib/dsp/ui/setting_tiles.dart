import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kef_ls50w2_client/kef_ls50w2_client.dart';

import '../../common_widgets/single_selection_buttons.dart';
import '../../common_widgets/toggle_expansion_tile.dart';
import '../../common_widgets/value_slider.dart';
import '../equalizer_profile.dart';
import '../equalizer_profile_notifier.dart';

class TrebleTrimTile extends HookWidget {
  const TrebleTrimTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trebleTrim = useProvider(
      EQProfileNotifier.provider.select((profile) => profile.trebleTrim),
    );
    final value = useState(trebleTrim);
    return Column(
      children: [
        ListTile(
          title: Text('Treble trim'),
        ),
        ValueSlider(
          initialValue: trebleTrim,
          min: 0,
          max: 16,
          displayMin: -3,
          displayMax: 3,
          divisions: 12,
          onChange: (value) => context
              .read(EQProfileNotifier.provider.notifier)
              .updateTrebleTrim(value),
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
    return Column(
      children: [
        ListTile(
          title: Text('Bass extension'),
        ),
        SingleSelectionButtons<BassExtension>(
          selected: bassExtension,
          options: {
            BassExtension.less: 'Less',
            BassExtension.standard: 'Standard',
            BassExtension.extra: 'Extra',
          },
          onSelected: context
              .read(EQProfileNotifier.provider.notifier)
              .updateBassExtension,
        ),
      ],
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
    final value = useProvider(
      EQProfileNotifier.provider.select((value) => value.deskModeValue),
    );
    final notifier = useProvider(EQProfileNotifier.provider.notifier);
    return ToggleExpansionTile(
      title: Text('Desk mode'),
      isExpanded: deskMode,
      onCollapse: () => notifier.updateDeskMode(false),
      onExpand: () => notifier.updateDeskMode(true),
      builder: (context) => ValueSlider(
        initialValue: value,
        min: 0,
        max: 20,
        displayMin: -10,
        displayMax: 0,
        unit: 'dB',
        divisions: 20,
        onChange: notifier.updateDeskModeValue,
      ),
    );
  }
}

class WallModeTile extends HookWidget {
  const WallModeTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wallMode = useProvider(
      EQProfileNotifier.provider.select((profile) => profile.wallMode),
    );
    final value = useProvider(
      EQProfileNotifier.provider.select((profile) => profile.wallModeValue),
    );
    final notifier = useProvider(EQProfileNotifier.provider.notifier);
    return ToggleExpansionTile(
      title: Text('Wall mode'),
      isExpanded: wallMode,
      onCollapse: () => notifier.updateWallMode(false),
      onExpand: () => notifier.updateWallMode(true),
      builder: (context) => ValueSlider(
        initialValue: value,
        min: 0,
        max: 20,
        displayMin: -10,
        displayMax: 0,
        unit: 'dB',
        divisions: 20,
        onChange: notifier.updateWallModeValue,
      ),
    );
  }
}

class SubwooferCountTile extends HookWidget {
  const SubwooferCountTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('Select number of subwoofers'),
        ),
        SingleSelectionButtons<SubwooferCount>(
          selected: useProvider(
            EQProfileNotifier.provider.select((value) => value.subwooferCount),
          ),
          options: {
            SubwooferCount.none: 'None',
            SubwooferCount.one: 'One',
            SubwooferCount.two: 'Two',
          },
          onSelected: context
              .read(EQProfileNotifier.provider.notifier)
              .updateSubwooferCount,
        ),
      ],
    );
  }
}

class SubwooferChannelTile extends HookWidget {
  const SubwooferChannelTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('Subwoofer channel'),
        ),
        SingleSelectionButtons<SubwooferChannel>(
          selected: useProvider(
            EQProfileNotifier.provider
                .select((value) => value.subwooferChannel),
          ),
          options: {
            SubwooferChannel.mono: 'Mono',
            SubwooferChannel.stereo: 'Stereo',
          },
          onSelected: context
              .read(EQProfileNotifier.provider.notifier)
              .updateSubwooferChannel,
        ),
      ],
    );
  }
}
