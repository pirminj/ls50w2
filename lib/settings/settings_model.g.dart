// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingsModel _$_$_SettingsModelFromJson(Map<String, dynamic> json) {
  return _$_SettingsModel(
    name: json['name'] as String,
    modelColor: _$enumDecode(_$ModelColorEnumMap, json['modelColor']),
    host: json['host'] as String,
    showSources: (json['showSources'] as List<dynamic>)
        .map((e) => _$enumDecode(_$SpeakerSourceEnumMap, e))
        .toList(),
  );
}

Map<String, dynamic> _$_$_SettingsModelToJson(_$_SettingsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'modelColor': _$ModelColorEnumMap[instance.modelColor],
      'host': instance.host,
      'showSources':
          instance.showSources.map((e) => _$SpeakerSourceEnumMap[e]).toList(),
    };

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

const _$ModelColorEnumMap = {
  ModelColor.mineralWhite: 'mineralWhite',
  ModelColor.carbonBlack: 'carbonBlack',
  ModelColor.titaniumGrey: 'titaniumGrey',
  ModelColor.crimsonRed: 'crimsonRed',
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
