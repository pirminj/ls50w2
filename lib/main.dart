import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kef_ls50w2_client/kef_ls50w2_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'settings/settings.dart';
import 'speaker/player_details.dart';
import 'speaker/source_selection.dart';
import 'speaker/speaker_status_notifier.dart';
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
      home: MainScreen(),
    );
  }
}

final clientProvider = Provider<KefClient>((ref) {
  final String host = ref.watch(hostProvider).state;
  return KefClient(host);
});

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends HookWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read(Speaker.provider.notifier).refresh(),
      child: ListView(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => SettingsPage(),
                ));
              },
              icon: Icon(Icons.settings),
              tooltip: 'Settings',
            ),
          ),
          TurnOnOffButton(),
          PlayerDetails(),
          SourceSelection()
        ],
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

  static double radius = 36.0;

  @override
  Widget build(BuildContext context) {
    final speakerValue = useProvider(Speaker.provider);
    final notifier = useProvider(Speaker.provider.notifier);
    final selectedColor = Theme.of(context).accentColor;
    final unselectedColor = Theme.of(context).primaryIconTheme.color!;

    return speakerValue.when(
      data: (speaker) {
        final bool isCurrent = speaker.source == source;
        final Color color = isCurrent ? selectedColor : unselectedColor;
        return buildButton(
          color: color,
          onPressed: () async {
            if (isCurrent) return;
            notifier.selectSource(source);
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
          border: Border.all(width: 3, color: color),
        ),
        child: IconButton(
          iconSize: 32,
          splashRadius: radius,
          color: color,
          icon: Icon(iconData),
          // tooltip: source.name().toUpperCase(),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

class TurnOnOffButton extends HookWidget {
  const TurnOnOffButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final speakerValue = useProvider(Speaker.provider);

    return speakerValue.when(
      data: (speaker) {
        switch (speaker.status) {
          case SpeakerStatus.standby:
            return buildIconButton(
              onPressed: () => context.read(Speaker.provider.notifier).turnOn(),
            );
          case SpeakerStatus.powerOn:
            return buildIconButton(
              color: Theme.of(context).accentColor,
              onPressed: () =>
                  context.read(Speaker.provider.notifier).turnOff(),
            );
        }
      },
      loading: () => buildIconButton(),
      error: (error, stackTrace) => buildIconButton(),
    );
  }

  Widget buildIconButton({Color? color, void Function()? onPressed}) {
    return IconButton(
      icon: Icon(
        Icons.power_settings_new,
        color: color,
      ),
      iconSize: 60,
      onPressed: onPressed,
    );
  }
}
