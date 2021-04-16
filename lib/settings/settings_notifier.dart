import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kef_ls50w2_client/kef_ls50w2_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'settings_model.dart';

class Settings extends StateNotifier<SettingsModel> {
  Settings(
    SettingsModel state,
    SharedPreferences sharedPreferences,
  )   : _sharedPreferences = sharedPreferences,
        super(state);

  SharedPreferences _sharedPreferences;

  /// Provide the SettingsModel notifier
  static final provider = StateNotifierProvider<Settings, SettingsModel>((_) {
    // This provider is overriden from the start of the app, so it should never
    // be created before.
    throw UnsupportedError('Provider not overriden!');
  });

  static SettingsModel defaultSettings() => SettingsModel(
        name: 'LS50 Wireless II',
        host: "192.168.0.149",
        modelColor: ModelColor.mineralWhite,
        showSources: List.from(SpeakerSource.values)
          ..remove(SpeakerSource.standby),
      );

  /// Initialize a settings notifier with from [sharedPreferences]
  static Settings initialize(SharedPreferences sharedPreferences) {
    if (!sharedPreferences.containsKey('settings')) {
      return Settings(defaultSettings(), sharedPreferences);
    }
    final String? settingsString = sharedPreferences.getString('settings');
    return settingsString == null
        ? Settings(
            defaultSettings(),
            sharedPreferences,
          )
        : Settings(
            SettingsModel.fromJson(jsonDecode(settingsString)),
            sharedPreferences,
          );
  }

  void updateModelColor(ModelColor modelColor) {
    if (modelColor == state.modelColor) return;
    state = state.copyWith(modelColor: modelColor);
    _saveSettings();
  }

  void updateName(String name) {
    state = state.copyWith(name: name);
    _saveSettings();
  }

  void updateHost(String host) {
    state = state.copyWith(host: host);
    _saveSettings();
  }

  void toggleVisibleSource(SpeakerSource source) {
    List<SpeakerSource> sources = state.showSources;
    if (sources.contains(source)) {
      state = state.copyWith(showSources: sources..remove(source));
    } else {
      state = state.copyWith(showSources: sources..add(source));
    }
    _saveSettings();
  }

  void updateSources(List<SpeakerSource> sources) {
    state = state.copyWith(showSources: sources);
    _saveSettings();
  }

  void _saveSettings() async {
    final success = await _sharedPreferences.setString(
      'settings',
      jsonEncode(state.toJson()),
    );
    if (!success) print('SharedPreferences not saved');
  }

  /// Reset SharedPreferences
  void resetSettings() {
    if (_sharedPreferences.containsKey('settings'))
      _sharedPreferences.remove('settings');
    state = defaultSettings();
  }
}