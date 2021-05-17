import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

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

class App extends HookWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: ScrollBehavior().copyWith(
        scrollbars: false,
        physics: BouncingScrollPhysics(),
      ),
      debugShowCheckedModeBanner: false,
      theme: useProvider(themeProvider),
      home: Scaffold(
        body: Layouter(),
      ),
    );
  }
}

class Layouter extends HookWidget {
  const Layouter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final details = useProvider(detailsProvider).state;
    final showDetail = details != null;
    return useProvider(detailsProvider).state != null
        ? Row(
            children: [
              Flexible(
                flex: showDetail ? 3 : 1,
                child: Main(),
              ),
              Flexible(
                flex: 5,
                child: details!.builder(context),
              ),
            ],
          )
        : Main();
  }
}

extension on Details {
  WidgetBuilder get builder {
    switch (this) {
      case Details.appSettings:
        return (context) => SettingsPage();
      case Details.dsp:
        return (context) => DSPPage();
      case Details.player:
        return (context) => PlayerDataPage();
      case Details.firmware:
        return (context) => FirmwareUpdatePage();
    }
  }
}

class Main extends StatelessWidget {
  const Main({
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SourceSelection(),
            ),
            SizedBox(height: 32),
            MainPageListTile(
              detail: Details.appSettings,
              label: 'App settings',
              leadingIcon: Icons.settings_applications,
            ),
            MainPageListTile(
              detail: Details.dsp,
              label: 'Digital Signal Processing',
              leadingIcon: Icons.signal_cellular_alt,
              maxWidth: 1200,
            ),
            MainPageListTile(
              detail: Details.player,
              label: 'Player details',
              leadingIcon: Icons.play_circle_fill,
            ),
            MainPageListTile(
              detail: Details.firmware,
              label: 'Firmware update info',
              leadingIcon: Icons.update,
            ),
            LimitedWidthContainer(
              child: AboutListTile(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 60,
                  ),
                  child: Text('About this app'),
                ),
                applicationName: 'LS50W2 control (unofficial)',
                applicationVersion: '0.1',
                aboutBoxChildren: [
                  ListTile(
                    title: Text('@standingsound'),
                    onTap: () async {
                      final url = 'https://twitter.com/standingsound';
                      if (await canLaunch(url)) launch(url);
                    },
                  ),
                ],
                dense: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainPageListTile extends HookWidget {
  const MainPageListTile({
    Key? key,
    required this.label,
    required this.leadingIcon,
    required this.detail,
    this.maxWidth = 800,
  }) : super(key: key);

  final String label;
  final IconData leadingIcon;
  final Details detail;
  final double maxWidth;

  final contentPadding = const EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 12,
  );

  @override
  Widget build(BuildContext context) {
    final trailingIcon = Icon(Icons.arrow_forward_ios, size: 20);
    final isLargeScreen = MediaQuery.of(context).size.width > 1000;

    return LimitedWidthContainer(
      child: ListTile(
        title: Text(label),
        leading: Icon(leadingIcon, size: 32),
        contentPadding: contentPadding,
        trailing: isLargeScreen ? null : trailingIcon,
        onTap: isLargeScreen
            ? () => context.read(detailsProvider).state = detail
            : () => Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => ProviderScope(
                      overrides: [
                        isLargeScreenProvider.overrideWithValue(false)
                      ],
                      child: detail.builder(context),
                    ),
                  ),
                ),
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
