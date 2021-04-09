// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'speaker_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SpeakerStatusModel _$SpeakerStatusModelFromJson(Map<String, dynamic> json) {
  return _SpeakerStatusModel.fromJson(json);
}

/// @nodoc
class _$SpeakerStatusModelTearOff {
  const _$SpeakerStatusModelTearOff();

  _SpeakerStatusModel call(
      {required SpeakerStatus status, required SpeakerSource source}) {
    return _SpeakerStatusModel(
      status: status,
      source: source,
    );
  }

  SpeakerStatusModel fromJson(Map<String, Object> json) {
    return SpeakerStatusModel.fromJson(json);
  }
}

/// @nodoc
const $SpeakerStatusModel = _$SpeakerStatusModelTearOff();

/// @nodoc
mixin _$SpeakerStatusModel {
  SpeakerStatus get status => throw _privateConstructorUsedError;
  SpeakerSource get source => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpeakerStatusModelCopyWith<SpeakerStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpeakerStatusModelCopyWith<$Res> {
  factory $SpeakerStatusModelCopyWith(
          SpeakerStatusModel value, $Res Function(SpeakerStatusModel) then) =
      _$SpeakerStatusModelCopyWithImpl<$Res>;
  $Res call({SpeakerStatus status, SpeakerSource source});
}

/// @nodoc
class _$SpeakerStatusModelCopyWithImpl<$Res>
    implements $SpeakerStatusModelCopyWith<$Res> {
  _$SpeakerStatusModelCopyWithImpl(this._value, this._then);

  final SpeakerStatusModel _value;
  // ignore: unused_field
  final $Res Function(SpeakerStatusModel) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? source = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SpeakerStatus,
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as SpeakerSource,
    ));
  }
}

/// @nodoc
abstract class _$SpeakerStatusModelCopyWith<$Res>
    implements $SpeakerStatusModelCopyWith<$Res> {
  factory _$SpeakerStatusModelCopyWith(
          _SpeakerStatusModel value, $Res Function(_SpeakerStatusModel) then) =
      __$SpeakerStatusModelCopyWithImpl<$Res>;
  @override
  $Res call({SpeakerStatus status, SpeakerSource source});
}

/// @nodoc
class __$SpeakerStatusModelCopyWithImpl<$Res>
    extends _$SpeakerStatusModelCopyWithImpl<$Res>
    implements _$SpeakerStatusModelCopyWith<$Res> {
  __$SpeakerStatusModelCopyWithImpl(
      _SpeakerStatusModel _value, $Res Function(_SpeakerStatusModel) _then)
      : super(_value, (v) => _then(v as _SpeakerStatusModel));

  @override
  _SpeakerStatusModel get _value => super._value as _SpeakerStatusModel;

  @override
  $Res call({
    Object? status = freezed,
    Object? source = freezed,
  }) {
    return _then(_SpeakerStatusModel(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SpeakerStatus,
      source: source == freezed
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as SpeakerSource,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SpeakerStatusModel implements _SpeakerStatusModel {
  _$_SpeakerStatusModel({required this.status, required this.source});

  factory _$_SpeakerStatusModel.fromJson(Map<String, dynamic> json) =>
      _$_$_SpeakerStatusModelFromJson(json);

  @override
  final SpeakerStatus status;
  @override
  final SpeakerSource source;

  @override
  String toString() {
    return 'SpeakerStatusModel(status: $status, source: $source)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SpeakerStatusModel &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.source, source) ||
                const DeepCollectionEquality().equals(other.source, source)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(source);

  @JsonKey(ignore: true)
  @override
  _$SpeakerStatusModelCopyWith<_SpeakerStatusModel> get copyWith =>
      __$SpeakerStatusModelCopyWithImpl<_SpeakerStatusModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SpeakerStatusModelToJson(this);
  }
}

abstract class _SpeakerStatusModel implements SpeakerStatusModel {
  factory _SpeakerStatusModel(
      {required SpeakerStatus status,
      required SpeakerSource source}) = _$_SpeakerStatusModel;

  factory _SpeakerStatusModel.fromJson(Map<String, dynamic> json) =
      _$_SpeakerStatusModel.fromJson;

  @override
  SpeakerStatus get status => throw _privateConstructorUsedError;
  @override
  SpeakerSource get source => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SpeakerStatusModelCopyWith<_SpeakerStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}
