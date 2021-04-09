// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speaker_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SpeakerStatusModel _$_$_SpeakerStatusModelFromJson(
    Map<String, dynamic> json) {
  return _$_SpeakerStatusModel(
    status: _$enumDecode(_$SpeakerStatusEnumMap, json['status']),
    source: _$enumDecode(_$SpeakerSourceEnumMap, json['source']),
  );
}

Map<String, dynamic> _$_$_SpeakerStatusModelToJson(
        _$_SpeakerStatusModel instance) =>
    <String, dynamic>{
      'status': _$SpeakerStatusEnumMap[instance.status],
      'source': _$SpeakerSourceEnumMap[instance.source],
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

const _$SpeakerStatusEnumMap = {
  SpeakerStatus.standby: 'standby',
  SpeakerStatus.powerOn: 'powerOn',
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
