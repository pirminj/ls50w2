import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kef_ls50w2_client/kef_ls50w2_client.dart';

import '../common_widgets/text_field_dialog.dart';
import '../settings/settings.dart';
import '../utils.dart';
import 'equalizer_profile.dart';

class DSPPage extends HookWidget {
  const DSPPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final equalizerProfiles = useProvider(
        Settings.provider.select((value) => value.equalizerProfiles));
    final selectedEqProfile = useProvider(
        Settings.provider.select((value) => value.selectedEqProfile));
    final notifier = useProvider(Settings.provider.notifier);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: !isDesktop,
        title: Text('Equalizer Settings'),
      ),
      body: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(16),
            child: DropdownButton<String>(
              value: selectedEqProfile,
              onChanged: (profileName) =>
                  notifier.selectEqProfile(profileName!),
              isExpanded: true,
              items: [
                DropdownMenuItem(
                  child: Text('None'),
                  value: 'None',
                ),
                ...equalizerProfiles.keys.map(
                  (name) => DropdownMenuItem(
                    child: Text(name),
                    value: name,
                  ),
                ),
              ],
            ),
          ),
          if (selectedEqProfile == 'None')
            Expanded(
              child: NoneEQProfile(),
            )
          else
            Expanded(
              child: ListView(
                children: [
                  EQProfileInputSourceMappingListTile(),
                  Divider(),
                  TrebbleTrimSlider(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class EQProfileInputSourceMappingListTile extends HookWidget {
  const EQProfileInputSourceMappingListTile({
    Key? key,
  }) : super(key: key);

  static final _provider =
      Provider((ref) => ref.watch(_eqProfileProvider).autoSwitch);

  @override
  Widget build(BuildContext context) {
    final notifier = useProvider(Settings.provider.notifier);
    final profiles = useProvider(
        Settings.provider.select((value) => value.equalizerProfiles));
    final takenSources = profiles.values.map((e) => e.autoSwitch).toSet();
    final source = useProvider(_provider);
    final isActive = source != null;
    return SwitchListTile(
      title: isActive
          ? Text('Automatically selected for source: ${source!.name()}')
          : Text('Automatically use this profile for an input source?'),
      value: isActive,
      onChanged: (value) async {
        if (value) {
          final source = await showDialog<SpeakerSource>(
            context: context,
            builder: (context) => SimpleDialog(
              children: SpeakerSource.values
                  .skip(1)
                  .where((element) => !takenSources.contains(element))
                  .map(
                    (source) => SimpleDialogOption(
                      child: Text(source.name()),
                      onPressed: () => Navigator.of(context).pop(source),
                    ),
                  )
                  .toList(),
            ),
          );
          if (source != null)
            notifier.updateCurrentEQProfile(
              (profile) => profile.copyWith(autoSwitch: source),
            );
        } else
          notifier.updateCurrentEQProfile(
            (profile) => profile.copyWith(autoSwitch: null),
          );
      },
    );
  }
}

class NoneEQProfile extends StatelessWidget {
  const NoneEQProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text('Add profile'),
        onPressed: () async {
          final name = await showDialog<String>(
            context: context,
            builder: (context) => TextFieldDialog(
              title: Text('New EQ Profile'),
            ),
          );
          if (name == null) return;
          context.read(Settings.provider.notifier).addEqProfile(name);
        },
      ),
    );
  }
}

final _eqProfileProvider = Provider<EqualizerProfile>((ref) {
  final settings = ref.watch(Settings.provider);
  return settings.equalizerProfiles[settings.selectedEqProfile]!;
});

class TrebbleTrimSlider extends HookWidget {
  const TrebbleTrimSlider({
    Key? key,
  }) : super(key: key);

  static final _provider = StateProvider(
    (ref) => ref.watch(_eqProfileProvider).trebbleTrim,
  );

  @override
  Widget build(BuildContext context) {
    final value = useProvider(_provider).state;
    return AdaptiveSettingsTile(
      title: Text('Trebble trim'),
      content: Column(
        children: [
          Slider(
            value: value,
            min: -3,
            max: 3,
            label: '$value dB',
            divisions: 24,
            onChangeEnd: (value) {
              context.read(Settings.provider.notifier).updateCurrentEQProfile(
                    (profile) => profile.copyWith(trebbleTrim: value),
                  );
            },
            onChanged: (value) {
              context.read(_provider).state = value;
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
    );
  }
}

class AdaptiveSettingsTile extends StatelessWidget {
  const AdaptiveSettingsTile({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final Widget title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 500) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: title,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: content,
              ),
            ],
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: title,
                ),
                content,
              ],
            ),
          );
        }
      },
    );
  }
}
