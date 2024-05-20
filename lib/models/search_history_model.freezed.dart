// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchHistory _$SearchHistoryFromJson(Map<String, dynamic> json) {
  return _SearchHistory.fromJson(json);
}

/// @nodoc
mixin _$SearchHistory {
  String get query => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get updatedAt => throw _privateConstructorUsedError;
  bool get favorite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchHistoryCopyWith<SearchHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchHistoryCopyWith<$Res> {
  factory $SearchHistoryCopyWith(
          SearchHistory value, $Res Function(SearchHistory) then) =
      _$SearchHistoryCopyWithImpl<$Res, SearchHistory>;
  @useResult
  $Res call(
      {String query,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt,
      bool favorite});
}

/// @nodoc
class _$SearchHistoryCopyWithImpl<$Res, $Val extends SearchHistory>
    implements $SearchHistoryCopyWith<$Res> {
  _$SearchHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? favorite = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchHistoryImplCopyWith<$Res>
    implements $SearchHistoryCopyWith<$Res> {
  factory _$$SearchHistoryImplCopyWith(
          _$SearchHistoryImpl value, $Res Function(_$SearchHistoryImpl) then) =
      __$$SearchHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String query,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt,
      bool favorite});
}

/// @nodoc
class __$$SearchHistoryImplCopyWithImpl<$Res>
    extends _$SearchHistoryCopyWithImpl<$Res, _$SearchHistoryImpl>
    implements _$$SearchHistoryImplCopyWith<$Res> {
  __$$SearchHistoryImplCopyWithImpl(
      _$SearchHistoryImpl _value, $Res Function(_$SearchHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? favorite = null,
  }) {
    return _then(_$SearchHistoryImpl(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchHistoryImpl implements _SearchHistory {
  const _$SearchHistoryImpl(
      {required this.query,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt,
      this.favorite = false});

  factory _$SearchHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchHistoryImplFromJson(json);

  @override
  final String query;
  @override
  @TimestampConverter()
  final Timestamp createdAt;
  @override
  @TimestampConverter()
  final Timestamp updatedAt;
  @override
  @JsonKey()
  final bool favorite;

  @override
  String toString() {
    return 'SearchHistory(query: $query, createdAt: $createdAt, updatedAt: $updatedAt, favorite: $favorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchHistoryImpl &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, query, createdAt, updatedAt, favorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchHistoryImplCopyWith<_$SearchHistoryImpl> get copyWith =>
      __$$SearchHistoryImplCopyWithImpl<_$SearchHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchHistoryImplToJson(
      this,
    );
  }
}

abstract class _SearchHistory implements SearchHistory {
  const factory _SearchHistory(
      {required final String query,
      @TimestampConverter() required final Timestamp createdAt,
      @TimestampConverter() required final Timestamp updatedAt,
      final bool favorite}) = _$SearchHistoryImpl;

  factory _SearchHistory.fromJson(Map<String, dynamic> json) =
      _$SearchHistoryImpl.fromJson;

  @override
  String get query;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @TimestampConverter()
  Timestamp get updatedAt;
  @override
  bool get favorite;
  @override
  @JsonKey(ignore: true)
  _$$SearchHistoryImplCopyWith<_$SearchHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
