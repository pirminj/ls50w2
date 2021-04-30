// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'settings_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SettingsModel _$SettingsModelFromJson(Map<String, dynamic> json) {
  return _SettingsModel.fromJson(json);
}

/// @nodoc
class _$SettingsModelTearOff {
  const _$SettingsModelTearOff();

  _SettingsModel call(
      {required String name,
      required ModelColor modelColor,
      required String host,
      required List<SpeakerSource> showSources,
      String selectedEqProfile = 'None',
      Map<String, EqualizerProfile> equalizerProfiles = const {}}) {
    return _SettingsModel(
      name: name,
      modelColor: modelColor,
      host: host,
      showSources: showSources,
      selectedEqProfile: selectedEqProfile,
      equalizerProfiles: equalizerProfiles,
    );
  }

  SettingsModel fromJson(Map<String, Object> json) {
    return SettingsModel.fromJson(json);
  }
}

/// @nodoc
const $SettingsModel = _$SettingsModelTearOff();

/// @nodoc
mixin _$SettingsModel {
  String get name => throw _privateConstructorUsedError;
  ModelColor get modelColor => throw _privateConstructorUsedError;
  String get host => throw _privateConstructorUsedError;
  List<SpeakerSource> get showSources => throw _privateConstructorUsedError;
  String get selectedEqProfile => throw _privateConstructorUsedError;
  Map<String, EqualizerProfile> get equalizerProfiles =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsModelCopyWith<SettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsModelCopyWith<$Res> {
  factory $SettingsModelCopyWith(
          SettingsModel value, $Res Function(SettingsModel) then) =
      _$SettingsModelCopyWithImpl<$Res>;
  $Res call(
      {String name,
      ModelColor modelColor,
      String host,
      List<SpeakerSource> showSources,
      String selectedEqProfile,
      Map<String, EqualizerProfile> equalizerProfiles});
}

/// @nodoc
class _$SettingsModelCopyWithImpl<$Res>
    implements $SettingsModelCopyWith<$Res> {
  _$SettingsModelCopyWithImpl(this._value, this._then);

  final SettingsModel _value;
  // ignore: unused_field
  final $Res Function(SettingsModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? modelColor = freezed,
    Object? host = freezed,
    Object? showSources = freezed,
    Object? selectedEqProfile = freezed,
    Object? equalizerProfiles = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      modelColor: modelColor == freezed
          ? _value.modelColor
          : modelColor // ignore: cast_nullable_to_non_nullable
              as ModelColor,
      host: host == freezed
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      showSources: showSources == freezed
          ? _value.showSources
          : showSources // ignore: cast_nullable_to_non_nullable
              as List<SpeakerSource>,
      selectedEqProfile: selectedEqProfile == freezed
          ? _value.selectedEqProfile
          : selectedEqProfile // ignore: cast_nullable_to_non_nullable
              as String,
      equalizerProfiles: equalizerProfiles == freezed
          ? _value.equalizerProfiles
          : equalizerProfiles // ignore: cast_nullable_to_non_nullable
              as Map<String, EqualizerProfile>,
    ));
  }
}

/// @nodoc
abstract class _$SettingsModelCopyWith<$Res>
    implements $SettingsModelCopyWith<$Res> {
  factory _$SettingsModelCopyWith(
          _SettingsModel value, $Res Function(_SettingsModel) then) =
      __$SettingsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      ModelColor modelColor,
      String host,
      List<SpeakerSource> showSources,
      String selectedEqProfile,
      Map<String, EqualizerProfile> equalizerProfiles});
}

/// @nodoc
class __$SettingsModelCopyWithImpl<$Res>
    extends _$SettingsModelCopyWithImpl<$Res>
    implements _$SettingsModelCopyWith<$Res> {
  __$SettingsModelCopyWithImpl(
      _SettingsModel _value, $Res Function(_SettingsModel) _then)
      : super(_value, (v) => _then(v as _SettingsModel));

  @override
  _SettingsModel get _value => super._value as _SettingsModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? modelColor = freezed,
    Object? host = freezed,
    Object? showSources = freezed,
    Object? selectedEqProfile = freezed,
    Object? equalizerProfiles = freezed,
  }) {
    return _then(_SettingsModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      modelColor: modelColor == freezed
          ? _value.modelColor
          : modelColor // ignore: cast_nullable_to_non_nullable
              as ModelColor,
      host: host == freezed
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      showSources: showSources == freezed
          ? _value.showSources
          : showSources // ignore: cast_nullable_to_non_nullable
              as List<SpeakerSource>,
      selectedEqProfile: selectedEqProfile == freezed
          ? _value.selectedEqProfile
          : selectedEqProfile // ignore: cast_nullable_to_non_nullable
              as String,
      equalizerProfiles: equalizerProfiles == freezed
          ? _value.equalizerProfiles
          : equalizerProfiles // ignore: cast_nullable_to_non_nullable
              as Map<String, EqualizerProfile>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SettingsModel implements _SettingsModel {
  _$_SettingsModel(
      {required this.name,
      required this.modelColor,
      required this.host,
      required this.showSources,
      this.selectedEqProfile = 'None',
      this.equalizerProfiles = const {}});

  factory _$_SettingsModel.fromJson(Map<String, dynamic> json) =>
      _$_$_SettingsModelFromJson(json);

  @override
  final String name;
  @override
  final ModelColor modelColor;
  @override
  final String host;
  @override
  final List<SpeakerSource> showSources;
  @JsonKey(defaultValue: 'None')
  @override
  final String selectedEqProfile;
  @JsonKey(defaultValue: const {})
  @override
  final Map<String, EqualizerProfile> equalizerProfiles;

  @override
  String toString() {
    return 'SettingsModel(name: $name, modelColor: $modelColor, host: $host, showSources: $showSources, selectedEqProfile: $selectedEqProfile, equalizerProfiles: $equalizerProfiles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SettingsModel &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.modelColor, modelColor) ||
                const DeepCollectionEquality()
                    .equals(other.modelColor, modelColor)) &&
            (identical(other.host, host) ||
                const DeepCollectionEquality().equals(other.host, host)) &&
            (identical(other.showSources, showSources) ||
                const DeepCollectionEquality()
                    .equals(other.showSources, showSources)) &&
            (identical(other.selectedEqProfile, selectedEqProfile) ||
                const DeepCollectionEquality()
                    .equals(other.selectedEqProfile, selectedEqProfile)) &&
            (identical(other.equalizerProfiles, equalizerProfiles) ||
                const DeepCollectionEquality()
                    .equals(other.equalizerProfiles, equalizerProfiles)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(modelColor) ^
      const DeepCollectionEquality().hash(host) ^
      const DeepCollectionEquality().hash(showSources) ^
      const DeepCollectionEquality().hash(selectedEqProfile) ^
      const DeepCollectionEquality().hash(equalizerProfiles);

  @JsonKey(ignore: true)
  @override
  _$SettingsModelCopyWith<_SettingsModel> get copyWith =>
      __$SettingsModelCopyWithImpl<_SettingsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SettingsModelToJson(this);
  }
}

abstract class _SettingsModel implements SettingsModel {
  factory _SettingsModel(
      {required String name,
      required ModelColor modelColor,
      required String host,
      required List<SpeakerSource> showSources,
      String selectedEqProfile,
      Map<String, EqualizerProfile> equalizerProfiles}) = _$_SettingsModel;

  factory _SettingsModel.fromJson(Map<String, dynamic> json) =
      _$_SettingsModel.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  ModelColor get modelColor => throw _privateConstructorUsedError;
  @override
  String get host => throw _privateConstructorUsedError;
  @override
  List<SpeakerSource> get showSources => throw _privateConstructorUsedError;
  @override
  String get selectedEqProfile => throw _privateConstructorUsedError;
  @override
  Map<String, EqualizerProfile> get equalizerProfiles =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SettingsModelCopyWith<_SettingsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
