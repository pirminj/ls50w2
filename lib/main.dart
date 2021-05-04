import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common_widgets/json_text_page.dart';
import 'common_widgets/limited_width_container.dart';
import 'dsp/dsp.dart';
import 'providers.dart';
import 'settings/settings.dart';
import 'speaker/source_selection.dart';
import 'speaker/speaker_status_notifier.dart';
import 'speaker/turn_on_off_button.dart';
import 'theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      observers: [Logger()],
      overrides: [
        Settings.provider.overrideWithValue(
          Settings.initialize(preferences),
        ),
      ],
      child: App(),
    ),
  );
}

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? newValue) {
    print("${provider.name ?? provider.runtimeType}: $newValue");
  }
}

class App extends HookWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: useProvider(themeProvider),
      home: Scaffold(
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        context.refresh(playerDataProvider);
        context.refresh(firmwareUpdateProvider);
        return context.read(Speaker.provider.notifier).refresh();
      },
      backgroundColor: Theme.of(context).accentColor,
      color: Theme.of(context).primaryColor,
      child: Scrollbar(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: TurnOnOffButton(),
            ),
            SourceSelection(),
            SizedBox(height: 32),
            StartPageListTile(
              label: 'App settings',
              leadingIcon: Icons.settings_applications,
              builder: (context) => SettingsPage(),
            ),
            StartPageListTile(
              label: 'Digital Signal Processing',
              leadingIcon: Icons.signal_cellular_alt,
              builder: (context) => DSPPage(),
              maxWidth: 1200,
            ),
            StartPageListTile(
              label: 'Player details',
              leadingIcon: Icons.play_circle_fill,
              builder: (context) => PlayerDataPage(),
            ),
            StartPageListTile(
              label: 'Firmware update info',
              leadingIcon: Icons.update,
              builder: (context) => FirmwareUpdatePage(),
            ),
          ],
        ),
      ),
    );
  }
}

class StartPageListTile extends StatelessWidget {
  const StartPageListTile({
    Key? key,
    required this.label,
    required this.leadingIcon,
    required this.builder,
    this.maxWidth = 800,
  }) : super(key: key);

  final String label;
  final IconData leadingIcon;
  final WidgetBuilder builder;
  final double maxWidth;

  final contentPadding = const EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 12,
  );

  @override
  Widget build(BuildContext context) {
    final trailingIcon = Icon(Icons.arrow_forward_ios, size: 20);
    return LimitedWidthContainer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool isLarge = constraints.maxWidth >= 900;
          final providerOverrides = [
            isLargeScreenProvider.overrideWithValue(isLarge)
          ];
          return ListTile(
            title: Text(label),
            leading: Icon(leadingIcon, size: 32),
            contentPadding: contentPadding,
            trailing: isLarge ? null : trailingIcon,
            onTap: isLarge
                ? () => showDialog(
                      context: context,
                      builder: (context) => ProviderScope(
                        overrides: providerOverrides,
                        child: LimitedWidthContainer(
                          maxWidth: maxWidth,
                          child: Dialog(
                            clipBehavior: Clip.antiAlias,
                            child: builder(context),
                          ),
                        ),
                      ),
                    )
                : () => Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => ProviderScope(
                          overrides: providerOverrides,
                          child: builder(context),
                        ),
                      ),
                    ),
          );
        },
      ),
    );
  }
}

class PlayerDataPage extends HookWidget {
  const PlayerDataPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return JsonTextPage(
      title: 'Player data',
      asyncJsonData: useProvider(playerDataProvider),
    );
  }
}

class FirmwareUpdatePage extends HookWidget {
  const FirmwareUpdatePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return JsonTextPage(
      title: 'Firmware update',
      asyncJsonData: useProvider(firmwareUpdateProvider),
    );
  }
}
