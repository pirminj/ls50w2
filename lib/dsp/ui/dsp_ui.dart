import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kef_ls50w2_client/kef_ls50w2_client.dart';
import 'package:ls50w2/common_widgets/border_container.dart';
import 'package:ls50w2/common_widgets/details_page.dart';
import 'package:ls50w2/dsp/equalizer_profile_notifier.dart';
import 'package:ls50w2/speaker/source_selection.dart';
import 'package:ls50w2/utils.dart';

import '../../common_widgets/text_field_dialog.dart';
import '../../settings/settings.dart';
import 'setting_tiles.dart';

class DSPPage extends StatelessWidget {
  const DSPPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailsPage(
      title: 'Equalizer Settings',
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(''),
                EQProfileSelectionDropdown(),
                AddEQProfileButton(),
                LinkWithSourceButton(),
                DeleteProfileButton(),
              ],
            ),
          ),
          EQProfileSettings(),
        ],
      ),
    );
  }
}

class DeleteProfileButton extends StatelessWidget {
  const DeleteProfileButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: isDesktop ? 24 : null,
      tooltip: 'Delete',
      onPressed: () => context
          .read(EQProfileNotifier.provider.notifier)
          .deleteCurrentProfile(),
      icon: Icon(Icons.delete),
    );
  }
}

class AddEQProfileButton extends StatelessWidget {
  const AddEQProfileButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: isDesktop ? 24 : null,
      tooltip: 'Add profile',
      icon: Icon(Icons.add),
      onPressed: () async {
        final name = await showDialog<String>(
          context: context,
          builder: (context) => TextFieldDialog(
            title: Text('New EQ Profile'),
          ),
        );
        if (name == null) return;
        context.read(EQProfileNotifier.provider.notifier).addProfile(name);
      },
    );
  }
}

class LinkWithSourceButton extends HookWidget {
  const LinkWithSourceButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifier = useProvider(EQProfileNotifier.provider.notifier);
    final profiles = useProvider(
        Settings.provider.select((value) => value.equalizerProfiles));
    final takenSources = Map.fromEntries(
      profiles.entries
          .where((entry) => entry.value.autoSwitch != null)
          .map((e) => MapEntry(e.value.autoSwitch!, e.key)),
    );

    final source = useProvider(
      EQProfileNotifier.provider.select((value) => value.autoSwitch),
    );
    final hasSource = source != null;

    return IconButton(
      tooltip: hasSource ? 'Linked to ${source!.name}' : 'Link with source',
      splashRadius: isDesktop ? 24 : null,
      icon: Icon(Icons.link),
      color: hasSource ? Theme.of(context).colorScheme.secondary : null,
      onPressed: () async {
        final source = await showDialog<String>(
          context: context,
          builder: (context) => SimpleDialog(
            title: Text('Select an input source to trigger this profile'),
            children: [
              SimpleDialogOption(
                child: Text('None'),
                onPressed: () => Navigator.of(context).pop('None'),
              ),
              ...SpeakerSource.values.skip(1).map(
                    (source) => SimpleDialogOption(
                      child: Row(
                        children: [
                          Icon(SourceSelection.icons[source]),
                          SizedBox(width: 8),
                          Text(source.name),
                          Spacer(),
                          if (takenSources.keys.contains(source))
                            Text('(${takenSources[source]})')
                        ],
                      ),
                      onPressed: () => Navigator.of(context).pop(source.name),
                    ),
                  )
            ],
          ),
        );
        if (source == 'None') {
          notifier.linkWithSource(null);
          return;
        }
        if (source != null) notifier.linkWithSource(toSpeakerSource(source));
      },
    );
  }
}

class EQProfileSelectionDropdown extends HookWidget {
  const EQProfileSelectionDropdown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final equalizerProfiles = useProvider(
      Settings.provider.select((value) => value.equalizerProfiles),
    );
    final selectedEqProfile = useProvider(EQProfileNotifier.provider);
    return SizedBox(
      width: 270,
      child: DropdownButton<String>(
        value: selectedEqProfile.name,
        onChanged: (profileName) => context
            .read(EQProfileNotifier.provider.notifier)
            .selectProfile(profileName!),
        isExpanded: true,
        items: [
          ...equalizerProfiles.values.map(
            (profile) => DropdownMenuItem(
              child: Row(
                children: [
                  Text(profile.name),
                  if (profile.autoSwitch != null)
                    Text(' (${profile.autoSwitch!.name})')
                ],
              ),
              value: profile.name,
            ),
          ),
        ],
      ),
    );
  }
}

class EQProfileSettings extends HookWidget {
  const EQProfileSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profile = useProvider(
      EQProfileNotifier.provider.select((value) => value.name),
    );
    return profile == 'None'
        ? Container()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SpeakerSettingsCard(),
                SubwooferSettingsCard(),
              ],
            ),
          );
  }
}

class SubwooferSettingsCard extends StatelessWidget {
  const SubwooferSettingsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      padding: const EdgeInsets.all(8),
      child: BorderContainer(
        child: Column(
          children: [
            ListTile(
              title: Text('Subwoofer channel'),
            )
          ],
        ),
      ),
    );
  }
}

class SpeakerSettingsCard extends StatelessWidget {
  const SpeakerSettingsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final divider = Divider(height: 0);
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      padding: const EdgeInsets.all(8),
      child: BorderContainer(
        child: Column(
          children: [
            DeskModeTile(),
            divider,
            WallModeTile(),
            divider,
            TrebleTrimTile(),
            divider,
            PhaseCorrectionTile(),
            divider,
            BassExtensionTile(),
          ],
        ),
      ),
    );
  }
}
