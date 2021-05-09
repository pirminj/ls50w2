import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kef_ls50w2_client/kef_ls50w2_client.dart';
import 'package:ls50w2/dsp/dsp.dart';
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
        selectedEqProfile: 'None',
        equalizerProfiles: {
          'None': EqualizerProfile(name: 'None'),
        },
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

  void updateOnOffButtonVisibility(bool show) {
    state = state.copyWith(showOnOffButton: show);
    _saveSettings();
  }

  void selectEqProfile(String profileName) {
    state = state.copyWith(selectedEqProfile: profileName);
    _saveSettings();
  }

  void addEqProfile(String name, EqualizerProfile profile) {
    state = state.copyWith(
      selectedEqProfile: name,
      equalizerProfiles: state.equalizerProfiles..addAll({name: profile}),
    );
    _saveSettings();
  }

  void deleteEQProfile(String name) {
    if (name == 'None') return;
    state = state.copyWith(
      equalizerProfiles: state.equalizerProfiles..remove(name),
      selectedEqProfile: 'None',
    );
    _saveSettings();
  }

  void updateCurrentEQProfile(
    EqualizerProfile Function(EqualizerProfile) update,
  ) {
    state = state.copyWith(
      equalizerProfiles: state.equalizerProfiles
        ..update(
          state.selectedEqProfile,
          update,
        ),
    );
    _saveSettings();
  }

  void updateEQProfile(EqualizerProfile profile) {
    state = state.copyWith(
      equalizerProfiles: state.equalizerProfiles
        ..addAll({state.selectedEqProfile: profile}),
    );
    _saveSettings();
  }

  EqualizerProfile get currentEqProfile =>
      state.equalizerProfiles[state.selectedEqProfile]!;

  Map<String, EqualizerProfile> get equalizerProfiles =>
      state.equalizerProfiles;

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
    _sharedPreferences.clear();
    state = defaultSettings();
  }
}
