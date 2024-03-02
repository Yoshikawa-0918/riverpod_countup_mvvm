// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'count_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CountData _$CountDataFromJson(Map<String, dynamic> json) {
  return _CountData.fromJson(json);
}

/// @nodoc
mixin _$CountData {
  int get count => throw _privateConstructorUsedError;
  int get countUp => throw _privateConstructorUsedError;
  int get countDown => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountDataCopyWith<CountData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountDataCopyWith<$Res> {
  factory $CountDataCopyWith(CountData value, $Res Function(CountData) then) =
      _$CountDataCopyWithImpl<$Res, CountData>;
  @useResult
  $Res call({int count, int countUp, int countDown});
}

/// @nodoc
class _$CountDataCopyWithImpl<$Res, $Val extends CountData>
    implements $CountDataCopyWith<$Res> {
  _$CountDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? countUp = null,
    Object? countDown = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      countUp: null == countUp
          ? _value.countUp
          : countUp // ignore: cast_nullable_to_non_nullable
              as int,
      countDown: null == countDown
          ? _value.countDown
          : countDown // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountDataImplCopyWith<$Res>
    implements $CountDataCopyWith<$Res> {
  factory _$$CountDataImplCopyWith(
          _$CountDataImpl value, $Res Function(_$CountDataImpl) then) =
      __$$CountDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, int countUp, int countDown});
}

/// @nodoc
class __$$CountDataImplCopyWithImpl<$Res>
    extends _$CountDataCopyWithImpl<$Res, _$CountDataImpl>
    implements _$$CountDataImplCopyWith<$Res> {
  __$$CountDataImplCopyWithImpl(
      _$CountDataImpl _value, $Res Function(_$CountDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? countUp = null,
    Object? countDown = null,
  }) {
    return _then(_$CountDataImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      countUp: null == countUp
          ? _value.countUp
          : countUp // ignore: cast_nullable_to_non_nullable
              as int,
      countDown: null == countDown
          ? _value.countDown
          : countDown // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountDataImpl implements _CountData {
  const _$CountDataImpl(
      {required this.count, required this.countUp, required this.countDown});

  factory _$CountDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountDataImplFromJson(json);

  @override
  final int count;
  @override
  final int countUp;
  @override
  final int countDown;

  @override
  String toString() {
    return 'CountData(count: $count, countUp: $countUp, countDown: $countDown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountDataImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.countUp, countUp) || other.countUp == countUp) &&
            (identical(other.countDown, countDown) ||
                other.countDown == countDown));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, countUp, countDown);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountDataImplCopyWith<_$CountDataImpl> get copyWith =>
      __$$CountDataImplCopyWithImpl<_$CountDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountDataImplToJson(
      this,
    );
  }
}

abstract class _CountData implements CountData {
  const factory _CountData(
      {required final int count,
      required final int countUp,
      required final int countDown}) = _$CountDataImpl;

  factory _CountData.fromJson(Map<String, dynamic> json) =
      _$CountDataImpl.fromJson;

  @override
  int get count;
  @override
  int get countUp;
  @override
  int get countDown;
  @override
  @JsonKey(ignore: true)
  _$$CountDataImplCopyWith<_$CountDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
