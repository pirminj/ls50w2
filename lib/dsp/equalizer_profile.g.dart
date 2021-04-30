// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equalizer_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EqualizerProfile _$_$_EqualizerProfileFromJson(Map<String, dynamic> json) {
  return _$_EqualizerProfile(
    deskMode: (json['deskMode'] as num?)?.toDouble(),
    wallMode: (json['wallMode'] as num?)?.toDouble(),
    trebbleTrim: (json['trebbleTrim'] as num?)?.toDouble() ?? 0.0,
    phaseCorrection: json['phaseCorrection'] as bool? ?? true,
    bassExtension:
        _$enumDecodeNullable(_$BassExtensionEnumMap, json['bassExtension']) ??
            BassExtension.standard,
    subwooferCount:
        _$enumDecodeNullable(_$SubwooferCountEnumMap, json['subwooferCount']) ??
            SubwooferCount.none,
    subwooferChannel: _$enumDecodeNullable(
            _$SubwooferChannelEnumMap, json['subwooferChannel']) ??
        SubwooferChannel.mono,
    highpassFrequency: (json['highpassFrequency'] as num?)?.toDouble(),
    lowpassFrequency: (json['lowpassFrequency'] as num?)?.toDouble(),
    subGain: (json['subGain'] as num?)?.toDouble() ?? 0.0,
    subPolarity: json['subPolarity'] as bool? ?? false,
    autoSwitch:
        _$enumDecodeNullable(_$SpeakerSourceEnumMap, json['autoSwitch']),
  );
}

Map<String, dynamic> _$_$_EqualizerProfileToJson(_$_EqualizerProfile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('deskMode', instance.deskMode);
  writeNotNull('wallMode', instance.wallMode);
  val['trebbleTrim'] = instance.trebbleTrim;
  val['phaseCorrection'] = instance.phaseCorrection;
  val['bassExtension'] = _$BassExtensionEnumMap[instance.bassExtension];
  val['subwooferCount'] = _$SubwooferCountEnumMap[instance.subwooferCount];
  val['subwooferChannel'] =
      _$SubwooferChannelEnumMap[instance.subwooferChannel];
  writeNotNull('highpassFrequency', instance.highpassFrequency);
  writeNotNull('lowpassFrequency', instance.lowpassFrequency);
  val['subGain'] = instance.subGain;
  val['subPolarity'] = instance.subPolarity;
  writeNotNull('autoSwitch', _$SpeakerSourceEnumMap[instance.autoSwitch]);
  return val;
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$BassExtensionEnumMap = {
  BassExtension.less: 'less',
  BassExtension.standard: 'standard',
  BassExtension.extra: 'extra',
};

const _$SubwooferCountEnumMap = {
  SubwooferCount.none: 'none',
  SubwooferCount.one: 'one',
  SubwooferCount.two: 'two',
};

const _$SubwooferChannelEnumMap = {
  SubwooferChannel.mono: 'mono',
  SubwooferChannel.stereo: 'stereo',
};

const _$SpeakerSourceEnumMap = {
  SpeakerSource.standby: 'standby',
  SpeakerSource.wifi: 'wifi',
  SpeakerSource.bluetooth: 'bluetooth',
  SpeakerSource.tv: 'tv',
  SpeakerSource.optic: 'optic',
  SpeakerSource.coaxial: 'coaxial',
  SpeakerSource.analog: 'analog',
};
