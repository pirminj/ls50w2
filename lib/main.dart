import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ls50w2/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'settings/settings.dart';
import 'common_widgets/json_text_page.dart';
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

  final contentPadding =
      const EdgeInsets.symmetric(horizontal: 24, vertical: 12);

  @override
  Widget build(BuildContext context) {
    final trailingIcon = Icon(Icons.arrow_forward_ios, size: 20);
    return RefreshIndicator(
      onRefresh: () {
        context.refresh(playerDataProvider);
        context.refresh(firmwareUpdateProvider);
        return context.read(Speaker.provider.notifier).refresh();
      },
      backgroundColor: Theme.of(context).accentColor,
      color: Theme.of(context).primaryColor,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: TurnOnOffButton(),
          ),
          SourceSelection(),
          SizedBox(height: 32),
          ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings_applications),
            contentPadding: contentPadding,
            trailing: trailingIcon,
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => SettingsPage(),
              ),
            ),
          ),
          ListTile(
            title: Text('Player details'),
            leading: Icon(Icons.play_circle_fill),
            contentPadding: contentPadding,
            trailing: trailingIcon,
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => PlayerDataPage(),
              ),
            ),
          ),
          ListTile(
            title: Text('Firmware update'),
            leading: Icon(Icons.update),
            contentPadding: contentPadding,
            trailing: trailingIcon,
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => FirmwareUpdatePage(),
              ),
            ),
          ),
        ],
      ),
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
      asyncJsonData: useProvider(firmwareUpdateProvider),
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
      asyncJsonData: useProvider(playerDataProvider),
    );
  }
}
