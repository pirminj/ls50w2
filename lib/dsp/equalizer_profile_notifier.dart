import 'package:kef_ls50w2_client/kef_ls50w2_client.dart';
import 'package:ls50w2/dsp/dsp.dart';
import 'package:ls50w2/dsp/equalizer_profile.dart';
import 'package:ls50w2/providers.dart';
import 'package:ls50w2/settings/settings.dart';
import 'package:riverpod/riverpod.dart';

class EQProfileNotifier extends StateNotifier<EqualizerProfile> {
  EQProfileNotifier(
    EqualizerProfile profile,
    this.settings,
    this.client,
  ) : super(profile) {
    _fetchProfile();
  }

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

  void _fetchProfile() async {
    currentlyOnSpeaker = EqualizerProfile(
      name: 'Passthrough',
      phaseCorrection: await client.phaseCorrection.get(),
      bassExtension: await client.bassExtension.get(),
    );
  }

  addProfile(String name) {
    final newProfile = EqualizerProfile(name: name);
    settings.addEqProfile(name, newProfile);
    _applyProfile(newProfile);
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
    // client.bassExtension.set(profile.bassExtension);
    // client.trebleTrim.set(profile.trebbleTrim);
    client.phaseCorrection.set(profile.phaseCorrection);
    client.bassExtension.set(profile.bassExtension);
  }

  linkWithSource(SpeakerSource? source) {
    state = state.copyWith(autoSwitch: source);
    settings.updateEQProfile(state);
  }

  void updateDeskMode(double? deskMode) {
    state = state.copyWith(deskMode: deskMode);
    settings.updateEQProfile(state);
  }

  void updateWallMode(double? wallMode) {
    state = state.copyWith(wallMode: wallMode);
    settings.updateEQProfile(state);
  }

  void updateTrebleTrim(double trim) {
    client.trebleTrim.set(8); // TODO conversion
    state = state.copyWith(trebbleTrim: trim);
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
