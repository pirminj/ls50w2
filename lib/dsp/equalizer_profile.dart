import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kef_ls50w2_client/kef_ls50w2_client.dart';

part 'equalizer_profile.freezed.dart';
part 'equalizer_profile.g.dart';

enum SubwooferCount { none, one, two }

enum SubwooferChannel { mono, stereo }

@freezed
class EqualizerProfile with _$EqualizerProfile {
  factory EqualizerProfile({
    required String name,
    // speaker
    @Default(null) double? deskMode,
    @Default(null) double? wallMode,
    @Default(0.0) double trebbleTrim,
    @Default(true) bool phaseCorrection,
    @Default(BassExtension.standard) BassExtension bassExtension,
    // Subwoofer out
    @Default(SubwooferCount.none) SubwooferCount subwooferCount,
    @Default(SubwooferChannel.mono) SubwooferChannel subwooferChannel,
    @Default(null) double? highpassFrequency,
    @Default(null) double? lowpassFrequency,
    @Default(0.0) double subGain,
    @Default(false) bool subPolarity,
    // custom
    @Default(null) SpeakerSource? autoSwitch,
  }) = _EqualizerProfile;

  factory EqualizerProfile.fromJson(Map<String, dynamic> json) =>
      _$EqualizerProfileFromJson(json);
}
