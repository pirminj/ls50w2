import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'settings/settings.dart';
import 'speaker/firmware_data_page.dart';
import 'speaker/player_data_page.dart';
import 'speaker/source_selection.dart';
import 'speaker/speaker_status_notifier.dart';
import 'speaker/turn_on_off_button.dart';
import 'theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      observers: [
        Logger(),
      ],
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
        context.refresh(PlayerDataPage.futureProvider);
        context.refresh(FirmwareDataPage.futureProvider);
        return context.read(Speaker.provider.notifier).refresh();
      },
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
            contentPadding: const EdgeInsets.all(16),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => SettingsPage(),
              ),
            ),
          ),
          ListTile(
            title: Text('Player details'),
            contentPadding: const EdgeInsets.all(16),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => PlayerDataPage(),
              ),
            ),
          ),
          ListTile(
            title: Text('Firmware update'),
            contentPadding: const EdgeInsets.all(16),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => FirmwareDataPage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
