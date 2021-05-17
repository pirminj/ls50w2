// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'equalizer_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EqualizerProfile _$EqualizerProfileFromJson(Map<String, dynamic> json) {
  return _EqualizerProfile.fromJson(json);
}

/// @nodoc
class _$EqualizerProfileTearOff {
  const _$EqualizerProfileTearOff();

  _EqualizerProfile call(
      {required String name,
      bool deskMode = false,
      int deskModeValue = 10,
      bool wallMode = false,
      int wallModeValue = 10,
      int trebleTrim = 8,
      bool phaseCorrection = true,
      BassExtension bassExtension = BassExtension.standard,
      SubwooferCount subwooferCount = SubwooferCount.none,
      SubwooferChannel subwooferChannel = SubwooferChannel.mono,
      double? highpassFrequency = null,
      double? lowpassFrequency = null,
      double subGain = 0.0,
      bool subPolarity = false,
      SpeakerSource? autoSwitch = null}) {
    return _EqualizerProfile(
      name: name,
      deskMode: deskMode,
      deskModeValue: deskModeValue,
      wallMode: wallMode,
      wallModeValue: wallModeValue,
      trebleTrim: trebleTrim,
      phaseCorrection: phaseCorrection,
      bassExtension: bassExtension,
      subwooferCount: subwooferCount,
      subwooferChannel: subwooferChannel,
      highpassFrequency: highpassFrequency,
      lowpassFrequency: lowpassFrequency,
      subGain: subGain,
      subPolarity: subPolarity,
      autoSwitch: autoSwitch,
    );
  }

  EqualizerProfile fromJson(Map<String, Object> json) {
    return EqualizerProfile.fromJson(json);
  }
}

/// @nodoc
const $EqualizerProfile = _$EqualizerProfileTearOff();

/// @nodoc
mixin _$EqualizerProfile {
  String get name => throw _privateConstructorUsedError; // speaker
  bool get deskMode => throw _privateConstructorUsedError;
  int get deskModeValue => throw _privateConstructorUsedError;
  bool get wallMode => throw _privateConstructorUsedError;
  int get wallModeValue => throw _privateConstructorUsedError;
  int get trebleTrim => throw _privateConstructorUsedError;
  bool get phaseCorrection => throw _privateConstructorUsedError;
  BassExtension get bassExtension =>
      throw _privateConstructorUsedError; // Subwoofer out
  SubwooferCount get subwooferCount => throw _privateConstructorUsedError;
  SubwooferChannel get subwooferChannel => throw _privateConstructorUsedError;
  double? get highpassFrequency => throw _privateConstructorUsedError;
  double? get lowpassFrequency => throw _privateConstructorUsedError;
  double get subGain => throw _privateConstructorUsedError;
  bool get subPolarity => throw _privateConstructorUsedError; // custom
  SpeakerSource? get autoSwitch => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EqualizerProfileCopyWith<EqualizerProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EqualizerProfileCopyWith<$Res> {
  factory $EqualizerProfileCopyWith(
          EqualizerProfile value, $Res Function(EqualizerProfile) then) =
      _$EqualizerProfileCopyWithImpl<$Res>;
  $Res call(
      {String name,
      bool deskMode,
      int deskModeValue,
      bool wallMode,
      int wallModeValue,
      int trebleTrim,
      bool phaseCorrection,
      BassExtension bassExtension,
      SubwooferCount subwooferCount,
      SubwooferChannel subwooferChannel,
      double? highpassFrequency,
      double? lowpassFrequency,
      double subGain,
      bool subPolarity,
      SpeakerSource? autoSwitch});
}

/// @nodoc
class _$EqualizerProfileCopyWithImpl<$Res>
    implements $EqualizerProfileCopyWith<$Res> {
  _$EqualizerProfileCopyWithImpl(this._value, this._then);

  final EqualizerProfile _value;
  // ignore: unused_field
  final $Res Function(EqualizerProfile) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? deskMode = freezed,
    Object? deskModeValue = freezed,
    Object? wallMode = freezed,
    Object? wallModeValue = freezed,
    Object? trebleTrim = freezed,
    Object? phaseCorrection = freezed,
    Object? bassExtension = freezed,
    Object? subwooferCount = freezed,
    Object? subwooferChannel = freezed,
    Object? highpassFrequency = freezed,
    Object? lowpassFrequency = freezed,
    Object? subGain = freezed,
    Object? subPolarity = freezed,
    Object? autoSwitch = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      deskMode: deskMode == freezed
          ? _value.deskMode
          : deskMode // ignore: cast_nullable_to_non_nullable
              as bool,
      deskModeValue: deskModeValue == freezed
          ? _value.deskModeValue
          : deskModeValue // ignore: cast_nullable_to_non_nullable
              as int,
      wallMode: wallMode == freezed
          ? _value.wallMode
          : wallMode // ignore: cast_nullable_to_non_nullable
              as bool,
      wallModeValue: wallModeValue == freezed
          ? _value.wallModeValue
          : wallModeValue // ignore: cast_nullable_to_non_nullable
              as int,
      trebleTrim: trebleTrim == freezed
          ? _value.trebleTrim
          : trebleTrim // ignore: cast_nullable_to_non_nullable
              as int,
      phaseCorrection: phaseCorrection == freezed
          ? _value.phaseCorrection
          : phaseCorrection // ignore: cast_nullable_to_non_nullable
              as bool,
      bassExtension: bassExtension == freezed
          ? _value.bassExtension
          : bassExtension // ignore: cast_nullable_to_non_nullable
              as BassExtension,
      subwooferCount: subwooferCount == freezed
          ? _value.subwooferCount
          : subwooferCount // ignore: cast_nullable_to_non_nullable
              as SubwooferCount,
      subwooferChannel: subwooferChannel == freezed
          ? _value.subwooferChannel
          : subwooferChannel // ignore: cast_nullable_to_non_nullable
              as SubwooferChannel,
      highpassFrequency: highpassFrequency == freezed
          ? _value.highpassFrequency
          : highpassFrequency // ignore: cast_nullable_to_non_nullable
              as double?,
      lowpassFrequency: lowpassFrequency == freezed
          ? _value.lowpassFrequency
          : lowpassFrequency // ignore: cast_nullable_to_non_nullable
              as double?,
      subGain: subGain == freezed
          ? _value.subGain
          : subGain // ignore: cast_nullable_to_non_nullable
              as double,
      subPolarity: subPolarity == freezed
          ? _value.subPolarity
          : subPolarity // ignore: cast_nullable_to_non_nullable
              as bool,
      autoSwitch: autoSwitch == freezed
          ? _value.autoSwitch
          : autoSwitch // ignore: cast_nullable_to_non_nullable
              as SpeakerSource?,
    ));
  }
}

/// @nodoc
abstract class _$EqualizerProfileCopyWith<$Res>
    implements $EqualizerProfileCopyWith<$Res> {
  factory _$EqualizerProfileCopyWith(
          _EqualizerProfile value, $Res Function(_EqualizerProfile) then) =
      __$EqualizerProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      bool deskMode,
      int deskModeValue,
      bool wallMode,
      int wallModeValue,
      int trebleTrim,
      bool phaseCorrection,
      BassExtension bassExtension,
      SubwooferCount subwooferCount,
      SubwooferChannel subwooferChannel,
      double? highpassFrequency,
      double? lowpassFrequency,
      double subGain,
      bool subPolarity,
      SpeakerSource? autoSwitch});
}

/// @nodoc
class __$EqualizerProfileCopyWithImpl<$Res>
    extends _$EqualizerProfileCopyWithImpl<$Res>
    implements _$EqualizerProfileCopyWith<$Res> {
  __$EqualizerProfileCopyWithImpl(
      _EqualizerProfile _value, $Res Function(_EqualizerProfile) _then)
      : super(_value, (v) => _then(v as _EqualizerProfile));

  @override
  _EqualizerProfile get _value => super._value as _EqualizerProfile;

  @override
  $Res call({
    Object? name = freezed,
    Object? deskMode = freezed,
    Object? deskModeValue = freezed,
    Object? wallMode = freezed,
    Object? wallModeValue = freezed,
    Object? trebleTrim = freezed,
    Object? phaseCorrection = freezed,
    Object? bassExtension = freezed,
    Object? subwooferCount = freezed,
    Object? subwooferChannel = freezed,
    Object? highpassFrequency = freezed,
    Object? lowpassFrequency = freezed,
    Object? subGain = freezed,
    Object? subPolarity = freezed,
    Object? autoSwitch = freezed,
  }) {
    return _then(_EqualizerProfile(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      deskMode: deskMode == freezed
          ? _value.deskMode
          : deskMode // ignore: cast_nullable_to_non_nullable
              as bool,
      deskModeValue: deskModeValue == freezed
          ? _value.deskModeValue
          : deskModeValue // ignore: cast_nullable_to_non_nullable
              as int,
      wallMode: wallMode == freezed
          ? _value.wallMode
          : wallMode // ignore: cast_nullable_to_non_nullable
              as bool,
      wallModeValue: wallModeValue == freezed
          ? _value.wallModeValue
          : wallModeValue // ignore: cast_nullable_to_non_nullable
              as int,
      trebleTrim: trebleTrim == freezed
          ? _value.trebleTrim
          : trebleTrim // ignore: cast_nullable_to_non_nullable
              as int,
      phaseCorrection: phaseCorrection == freezed
          ? _value.phaseCorrection
          : phaseCorrection // ignore: cast_nullable_to_non_nullable
              as bool,
      bassExtension: bassExtension == freezed
          ? _value.bassExtension
          : bassExtension // ignore: cast_nullable_to_non_nullable
              as BassExtension,
      subwooferCount: subwooferCount == freezed
          ? _value.subwooferCount
          : subwooferCount // ignore: cast_nullable_to_non_nullable
              as SubwooferCount,
      subwooferChannel: subwooferChannel == freezed
          ? _value.subwooferChannel
          : subwooferChannel // ignore: cast_nullable_to_non_nullable
              as SubwooferChannel,
      highpassFrequency: highpassFrequency == freezed
          ? _value.highpassFrequency
          : highpassFrequency // ignore: cast_nullable_to_non_nullable
              as double?,
      lowpassFrequency: lowpassFrequency == freezed
          ? _value.lowpassFrequency
          : lowpassFrequency // ignore: cast_nullable_to_non_nullable
              as double?,
      subGain: subGain == freezed
          ? _value.subGain
          : subGain // ignore: cast_nullable_to_non_nullable
              as double,
      subPolarity: subPolarity == freezed
          ? _value.subPolarity
          : subPolarity // ignore: cast_nullable_to_non_nullable
              as bool,
      autoSwitch: autoSwitch == freezed
          ? _value.autoSwitch
          : autoSwitch // ignore: cast_nullable_to_non_nullable
              as SpeakerSource?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_EqualizerProfile implements _EqualizerProfile {
  _$_EqualizerProfile(
      {required this.name,
      this.deskMode = false,
      this.deskModeValue = 10,
      this.wallMode = false,
      this.wallModeValue = 10,
      this.trebleTrim = 8,
      this.phaseCorrection = true,
      this.bassExtension = BassExtension.standard,
      this.subwooferCount = SubwooferCount.none,
      this.subwooferChannel = SubwooferChannel.mono,
      this.highpassFrequency = null,
      this.lowpassFrequency = null,
      this.subGain = 0.0,
      this.subPolarity = false,
      this.autoSwitch = null});

  factory _$_EqualizerProfile.fromJson(Map<String, dynamic> json) =>
      _$_$_EqualizerProfileFromJson(json);

  @override
  final String name;
  @JsonKey(defaultValue: false)
  @override // speaker
  final bool deskMode;
  @JsonKey(defaultValue: 10)
  @override
  final int deskModeValue;
  @JsonKey(defaultValue: false)
  @override
  final bool wallMode;
  @JsonKey(defaultValue: 10)
  @override
  final int wallModeValue;
  @JsonKey(defaultValue: 8)
  @override
  final int trebleTrim;
  @JsonKey(defaultValue: true)
  @override
  final bool phaseCorrection;
  @JsonKey(defaultValue: BassExtension.standard)
  @override
  final BassExtension bassExtension;
  @JsonKey(defaultValue: SubwooferCount.none)
  @override // Subwoofer out
  final SubwooferCount subwooferCount;
  @JsonKey(defaultValue: SubwooferChannel.mono)
  @override
  final SubwooferChannel subwooferChannel;
  @JsonKey(defaultValue: null)
  @override
  final double? highpassFrequency;
  @JsonKey(defaultValue: null)
  @override
  final double? lowpassFrequency;
  @JsonKey(defaultValue: 0.0)
  @override
  final double subGain;
  @JsonKey(defaultValue: false)
  @override
  final bool subPolarity;
  @JsonKey(defaultValue: null)
  @override // custom
  final SpeakerSource? autoSwitch;

  @override
  String toString() {
    return 'EqualizerProfile(name: $name, deskMode: $deskMode, deskModeValue: $deskModeValue, wallMode: $wallMode, wallModeValue: $wallModeValue, trebleTrim: $trebleTrim, phaseCorrection: $phaseCorrection, bassExtension: $bassExtension, subwooferCount: $subwooferCount, subwooferChannel: $subwooferChannel, highpassFrequency: $highpassFrequency, lowpassFrequency: $lowpassFrequency, subGain: $subGain, subPolarity: $subPolarity, autoSwitch: $autoSwitch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EqualizerProfile &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.deskMode, deskMode) ||
                const DeepCollectionEquality()
                    .equals(other.deskMode, deskMode)) &&
            (identical(other.deskModeValue, deskModeValue) ||
                const DeepCollectionEquality()
                    .equals(other.deskModeValue, deskModeValue)) &&
            (identical(other.wallMode, wallMode) ||
                const DeepCollectionEquality()
                    .equals(other.wallMode, wallMode)) &&
            (identical(other.wallModeValue, wallModeValue) ||
                const DeepCollectionEquality()
                    .equals(other.wallModeValue, wallModeValue)) &&
            (identical(other.trebleTrim, trebleTrim) ||
                const DeepCollectionEquality()
                    .equals(other.trebleTrim, trebleTrim)) &&
            (identical(other.phaseCorrection, phaseCorrection) ||
                const DeepCollectionEquality()
                    .equals(other.phaseCorrection, phaseCorrection)) &&
            (identical(other.bassExtension, bassExtension) ||
                const DeepCollectionEquality()
                    .equals(other.bassExtension, bassExtension)) &&
            (identical(other.subwooferCount, subwooferCount) ||
                const DeepCollectionEquality()
                    .equals(other.subwooferCount, subwooferCount)) &&
            (identical(other.subwooferChannel, subwooferChannel) ||
                const DeepCollectionEquality()
                    .equals(other.subwooferChannel, subwooferChannel)) &&
            (identical(other.highpassFrequency, highpassFrequency) ||
                const DeepCollectionEquality()
                    .equals(other.highpassFrequency, highpassFrequency)) &&
            (identical(other.lowpassFrequency, lowpassFrequency) ||
                const DeepCollectionEquality()
                    .equals(other.lowpassFrequency, lowpassFrequency)) &&
            (identical(other.subGain, subGain) ||
                const DeepCollectionEquality()
                    .equals(other.subGain, subGain)) &&
            (identical(other.subPolarity, subPolarity) ||
                const DeepCollectionEquality()
                    .equals(other.subPolarity, subPolarity)) &&
            (identical(other.autoSwitch, autoSwitch) ||
                const DeepCollectionEquality()
                    .equals(other.autoSwitch, autoSwitch)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(deskMode) ^
      const DeepCollectionEquality().hash(deskModeValue) ^
      const DeepCollectionEquality().hash(wallMode) ^
      const DeepCollectionEquality().hash(wallModeValue) ^
      const DeepCollectionEquality().hash(trebleTrim) ^
      const DeepCollectionEquality().hash(phaseCorrection) ^
      const DeepCollectionEquality().hash(bassExtension) ^
      const DeepCollectionEquality().hash(subwooferCount) ^
      const DeepCollectionEquality().hash(subwooferChannel) ^
      const DeepCollectionEquality().hash(highpassFrequency) ^
      const DeepCollectionEquality().hash(lowpassFrequency) ^
      const DeepCollectionEquality().hash(subGain) ^
      const DeepCollectionEquality().hash(subPolarity) ^
      const DeepCollectionEquality().hash(autoSwitch);

  @JsonKey(ignore: true)
  @override
  _$EqualizerProfileCopyWith<_EqualizerProfile> get copyWith =>
      __$EqualizerProfileCopyWithImpl<_EqualizerProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EqualizerProfileToJson(this);
  }
}

abstract class _EqualizerProfile implements EqualizerProfile {
  factory _EqualizerProfile(
      {required String name,
      bool deskMode,
      int deskModeValue,
      bool wallMode,
      int wallModeValue,
      int trebleTrim,
      bool phaseCorrection,
      BassExtension bassExtension,
      SubwooferCount subwooferCount,
      SubwooferChannel subwooferChannel,
      double? highpassFrequency,
      double? lowpassFrequency,
      double subGain,
      bool subPolarity,
      SpeakerSource? autoSwitch}) = _$_EqualizerProfile;

  factory _EqualizerProfile.fromJson(Map<String, dynamic> json) =
      _$_EqualizerProfile.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override // speaker
  bool get deskMode => throw _privateConstructorUsedError;
  @override
  int get deskModeValue => throw _privateConstructorUsedError;
  @override
  bool get wallMode => throw _privateConstructorUsedError;
  @override
  int get wallModeValue => throw _privateConstructorUsedError;
  @override
  int get trebleTrim => throw _privateConstructorUsedError;
  @override
  bool get phaseCorrection => throw _privateConstructorUsedError;
  @override
  BassExtension get bassExtension => throw _privateConstructorUsedError;
  @override // Subwoofer out
  SubwooferCount get subwooferCount => throw _privateConstructorUsedError;
  @override
  SubwooferChannel get subwooferChannel => throw _privateConstructorUsedError;
  @override
  double? get highpassFrequency => throw _privateConstructorUsedError;
  @override
  double? get lowpassFrequency => throw _privateConstructorUsedError;
  @override
  double get subGain => throw _privateConstructorUsedError;
  @override
  bool get subPolarity => throw _privateConstructorUsedError;
  @override // custom
  SpeakerSource? get autoSwitch => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EqualizerProfileCopyWith<_EqualizerProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
