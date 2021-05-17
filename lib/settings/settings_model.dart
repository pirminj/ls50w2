import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kef_ls50w2_client/kef_ls50w2_client.dart';
import '../dsp/equalizer_profile.dart';

part 'settings_model.freezed.dart';
part 'settings_model.g.dart';

@freezed
class SettingsModel with _$SettingsModel {
  factory SettingsModel({
    required String name,
    required ModelColor modelColor,
    required String host,
    required List<SpeakerSource> showSources,
    @Default(true) bool showOnOffButton,
    @Default('None') String selectedEqProfile,
    @Default({}) Map<String, EqualizerProfile> equalizerProfiles,
  }) = _SettingsModel;

  factory SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsModelFromJson(json);
}

enum ModelColor {
  mineralWhite,
  carbonBlack,
  titaniumGrey,
  crimsonRed,
}

extension ModelColorExtension on ModelColor {
  String get name {
    switch (this) {
      case ModelColor.mineralWhite:
        return 'Mineral White';
      case ModelColor.carbonBlack:
        return 'Carbon Black';
      case ModelColor.titaniumGrey:
        return 'Titanium Grey';
      case ModelColor.crimsonRed:
        return 'Crimson Red';
    }
  }

  static ModelColor fromString(String string) {
    return ModelColor.values.singleWhere(
      (modelColor) =>
          modelColor.toString().split('.').last[0] == string[0].toLowerCase(),
      orElse: () => throw StateError('no ModelColor match for $string'),
    );
  }

  String get dualFrontPhoto {
    switch (this) {
      case ModelColor.mineralWhite:
        return 'assets/product_photos/dual_front_white.png';
      case ModelColor.carbonBlack:
        return 'assets/product_photos/dual_front_black.png';
      case ModelColor.titaniumGrey:
        return 'assets/product_photos/dual_front_grey.png';
      case ModelColor.crimsonRed:
        return 'assets/product_photos/dual_front_red.png';
    }
  }
}
