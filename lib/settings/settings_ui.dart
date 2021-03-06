import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kef_ls50w2_client/kef_ls50w2_client.dart';

import '../common_widgets/details_page.dart';
import '../common_widgets/text_field_dialog.dart';
import '../utils.dart';
import 'settings.dart';
import 'settings_model.dart';

class SettingsPage extends HookWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetailsPage(
      title: 'Details',
      child: ScrollView(
        children: [
          ListTile(
            title: Text(
              'Speaker',
              style: Theme.of(context).textTheme.headline6,
            ),
            dense: true,
          ),
          SpeakerNameSettingsTile(),
          HostSettingsTile(),
          Divider(),
          ModelColorSelection(),
          Divider(),
          VisibleSourcesSelection(),
          OnOffButtonVisibilityTile(),
          Divider(),
          Container(
            constraints: BoxConstraints.expand(height: 72),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton(
              child: Text(
                'Reset app settings',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () =>
                  context.read(Settings.provider.notifier).resetSettings(),
            ),
          )
        ],
      ),
    );
  }
}

class ScrollView extends HookWidget {
  const ScrollView({
    Key? key,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = useScrollController();
    return Scrollbar(
      controller: scrollController,
      isAlwaysShown: isDesktop,
      child: Container(
        alignment: Alignment.center,
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView(
            controller: scrollController,
            children: children,
          ),
        ),
      ),
    );
  }
}

class VisibleSourcesSelection extends HookWidget {
  const VisibleSourcesSelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sources = useProvider(Settings.provider).showSources;
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            'Input Sources',
            style: theme.textTheme.headline6,
          ),
          subtitle: Text(
            'Change the order by selecting the sources in the order you like',
          ),
          dense: true,
        ),
        // skip the standby source
        ...SpeakerSource.values.skip(1).map(
              (source) => CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: _settingsListTileContentPadding,
                activeColor: theme.accentColor,
                title: Text(source.name),
                value: sources.contains(source),
                onChanged: (_) => context
                    .read(Settings.provider.notifier)
                    .toggleVisibleSource(source),
              ),
            )
      ],
    );
  }
}

class ModelColorSelection extends HookWidget {
  const ModelColorSelection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedModelColor = useProvider(
      Settings.provider.select((value) => value.modelColor),
    );
    final notifier = useProvider(Settings.provider.notifier);
    return Column(
      children: [
        ListTile(
          title: Text(
            'Model color',
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text('This will also change the app theme'),
          dense: true,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Theme.of(context).accentColor,
                width: 2,
              ),
            ),
            child: Column(
              children: [
                ...ModelColor.values.map(
                  (ModelColor modelColor) => InkWell(
                    onTap: () => notifier.updateModelColor(modelColor),
                    child: Container(
                      color: modelColor == selectedModelColor
                          ? Theme.of(context).accentColor
                          : null,
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            child: AspectRatio(
                              aspectRatio: 1.6,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      modelColor.dualFrontPhoto,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              modelColor.name,
                              style: GoogleFonts.lato(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class HostSettingsTile extends HookWidget {
  const HostSettingsTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String host = useProvider(
      Settings.provider.select((settings) => settings.host),
    );
    return ListTile(
      title: Text(host),
      contentPadding: _settingsListTileContentPadding,
      subtitle: Text('Speaker IP Address (Host)'),
      trailing: Icon(Icons.edit),
      onTap: () => _edit(context, host),
    );
  }

  void _edit(BuildContext context, String host) async {
    final String? editedHost = await showDialog(
      context: context,
      builder: (context) => TextFieldDialog(
        initial: host,
        validator: (value) {
          final exp = RegExp(
            r"^(?!0)(?!.*\.$)((1?\d?\d|25[0-5]|2[0-4]\d)(\.|$)){4}$",
            caseSensitive: false,
            multiLine: false,
          );
          if (!exp.hasMatch(value!)) return 'Enter a valid IP Address';
          return null;
        },
      ),
    );
    if (editedHost != null && editedHost != host) {
      context.read(Settings.provider.notifier).updateHost(editedHost);
    }
  }
}

final _settingsListTileContentPadding = const EdgeInsets.symmetric(
  horizontal: 24,
);

class SpeakerNameSettingsTile extends HookWidget {
  const SpeakerNameSettingsTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String name = useProvider(
      Settings.provider.select((settings) => settings.name),
    );
    return ListTile(
      title: Text(name),
      contentPadding: _settingsListTileContentPadding,
      subtitle: Text('Name'),
      trailing: Icon(Icons.edit),
      onTap: () => _edit(context, name),
    );
  }

  void _edit(BuildContext context, String name) async {
    final String? edited = await showDialog(
      context: context,
      builder: (context) => TextFieldDialog(initial: name),
    );
    if (edited != null && edited != name) {
      context.read(Settings.provider.notifier).updateName(edited);
    }
  }
}

class OnOffButtonVisibilityTile extends HookWidget {
  const OnOffButtonVisibilityTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final show = useProvider(
      Settings.provider.select((settings) => settings.showOnOffButton),
    );
    return SwitchListTile(
      title: Text('Show On/Off button on main page'),
      value: show,
      onChanged: (value) => context
          .read(Settings.provider.notifier)
          .updateOnOffButtonVisibility(value),
    );
  }
}
