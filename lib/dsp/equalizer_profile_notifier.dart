import 'package:flutter/foundation.dart';
import 'package:kef_ls50w2_client/kef_ls50w2_client.dart';
import 'dsp.dart';
import 'equalizer_profile.dart';
import '../providers.dart';
import '../settings/settings.dart';
import 'package:riverpod/riverpod.dart';

class EQProfileNotifier extends StateNotifier<EqualizerProfile> {
  EQProfileNotifier(
    EqualizerProfile profile,
    this.settings,
    this.client,
  ) : super(profile);

  final Settings settings;
  final KefClient client;

  late EqualizerProfile currentlyOnSpeaker;

  static final provider =
      StateNotifierProvider<EQProfileNotifier, EqualizerProfile>(
    (ref) {
      final settingsNotifier = ref.watch(Settings.provider.notifier);
      var profile = settingsNotifier.currentEqProfile;
      return EQProfileNotifier(
        profile,
        settingsNotifier,
        ref.watch(clientProvider),
      );
    },
    name: 'EQProfileNotifier',
  );

  Future<EqualizerProfile> fetchCurrentEQProfile(String name) async {
    return EqualizerProfile(
      name: name,
      deskMode: await client.deskMode.get(),
      deskModeValue: await client.deskModeSetting.get(),
      wallMode: await client.wallMode.get(),
      trebleTrim: await client.trebleTrim.get(),
      wallModeValue: await client.wallModeSetting.get(),
      phaseCorrection: await client.phaseCorrection.get(),
      bassExtension: await client.bassExtension.get(),
    );
  }

  addProfile(String name) async {
    final newProfile = kIsWeb
        ? EqualizerProfile(name: name)
        : await fetchCurrentEQProfile(name);
    settings.addEqProfile(name, newProfile);
    state = newProfile;
  }

  selectProfile(String name) {
    if (name == state.name) return;
    final profile = settings.equalizerProfiles[name];
    if (profile == null) {
      throw StateError('EQ Profile $name not found');
    }
    settings.selectEqProfile(name);
    _applyProfile(profile);
    state = profile;
  }

  deleteCurrentProfile() {
    settings.deleteEQProfile(state.name);
    selectProfile('None');
  }

  _applyProfile(EqualizerProfile profile) {
    client.wallMode.set(profile.wallMode);
    client.wallModeSetting.set(profile.wallModeValue);
    client.deskMode.set(profile.deskMode);
    client.deskModeSetting.set(profile.deskModeValue);
    client.trebleTrim.set(profile.trebleTrim);
    client.phaseCorrection.set(profile.phaseCorrection);
    client.bassExtension.set(profile.bassExtension);
  }

  linkWithSource(SpeakerSource? source) {
    state = state.copyWith(autoSwitch: source);
    settings.updateEQProfile(state);
  }

  void updateDeskMode(bool deskMode) {
    client.deskMode.set(deskMode);
    state = state.copyWith(deskMode: deskMode);
    settings.updateEQProfile(state);
  }

  void updateDeskModeValue(int deskModeValue) {
    client.deskModeSetting.set(deskModeValue);
    state = state.copyWith(deskModeValue: deskModeValue);
    settings.updateEQProfile(state);
  }

  void updateWallMode(bool wallMode) {
    client.wallMode.set(wallMode);
    state = state.copyWith(wallMode: wallMode);
    settings.updateEQProfile(state);
  }

  void updateWallModeValue(int wallModeValue) {
    client.wallModeSetting.set(wallModeValue.toInt());
    state = state.copyWith(wallModeValue: wallModeValue);
    settings.updateEQProfile(state);
  }

  void updateTrebleTrim(int trebleTrim) {
    client.trebleTrim.set(trebleTrim);
    state = state.copyWith(trebleTrim: trebleTrim);
    settings.updateEQProfile(state);
  }

  void updatePhaseCorrection(bool value) {
    client.phaseCorrection.set(value);
    state = state.copyWith(phaseCorrection: value);
    settings.updateEQProfile(state);
  }

  void updateBassExtension(BassExtension bassExtension) {
    client.bassExtension.set(bassExtension);
    state = state.copyWith(bassExtension: bassExtension);
    settings.updateEQProfile(state);
  }

  void updateSubwooferCount(SubwooferCount subwooferCount) {
    // client.su.set(); TODO: implement
    state = state.copyWith(subwooferCount: subwooferCount);
    settings.updateEQProfile(state);
  }

  void updateSubwooferChannel(SubwooferChannel subwooferChannel) {
    // client.su.set(); TODO: implement
    state = state.copyWith(subwooferChannel: subwooferChannel);
    settings.updateEQProfile(state);
  }
}
