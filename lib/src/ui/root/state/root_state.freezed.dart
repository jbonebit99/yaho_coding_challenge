// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'root_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RootState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<User> users, UserResponse? response) data,
    required TResult Function() loading,
    required TResult Function(List<User> users, UserResponse? response)
        loadMore,
    required TResult Function(Exception error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<User> users, UserResponse? response)? data,
    TResult? Function()? loading,
    TResult? Function(List<User> users, UserResponse? response)? loadMore,
    TResult? Function(Exception error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<User> users, UserResponse? response)? data,
    TResult Function()? loading,
    TResult Function(List<User> users, UserResponse? response)? loadMore,
    TResult Function(Exception error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RootStateData value) data,
    required TResult Function(RootStateLoading value) loading,
    required TResult Function(RootStateLoadMore value) loadMore,
    required TResult Function(RootStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RootStateData value)? data,
    TResult? Function(RootStateLoading value)? loading,
    TResult? Function(RootStateLoadMore value)? loadMore,
    TResult? Function(RootStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RootStateData value)? data,
    TResult Function(RootStateLoading value)? loading,
    TResult Function(RootStateLoadMore value)? loadMore,
    TResult Function(RootStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RootStateCopyWith<$Res> {
  factory $RootStateCopyWith(RootState value, $Res Function(RootState) then) =
      _$RootStateCopyWithImpl<$Res, RootState>;
}

/// @nodoc
class _$RootStateCopyWithImpl<$Res, $Val extends RootState>
    implements $RootStateCopyWith<$Res> {
  _$RootStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RootStateDataCopyWith<$Res> {
  factory _$$RootStateDataCopyWith(
          _$RootStateData value, $Res Function(_$RootStateData) then) =
      __$$RootStateDataCopyWithImpl<$Res>;
  @useResult
  $Res call({List<User> users, UserResponse? response});

  $UserResponseCopyWith<$Res>? get response;
}

/// @nodoc
class __$$RootStateDataCopyWithImpl<$Res>
    extends _$RootStateCopyWithImpl<$Res, _$RootStateData>
    implements _$$RootStateDataCopyWith<$Res> {
  __$$RootStateDataCopyWithImpl(
      _$RootStateData _value, $Res Function(_$RootStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? response = freezed,
  }) {
    return _then(_$RootStateData(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as UserResponse?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserResponseCopyWith<$Res>? get response {
    if (_value.response == null) {
      return null;
    }

    return $UserResponseCopyWith<$Res>(_value.response!, (value) {
      return _then(_value.copyWith(response: value));
    });
  }
}

/// @nodoc

class _$RootStateData implements RootStateData {
  const _$RootStateData({required final List<User> users, this.response})
      : _users = users;

  final List<User> _users;
  @override
  List<User> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  final UserResponse? response;

  @override
  String toString() {
    return 'RootState.data(users: $users, response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RootStateData &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_users), response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RootStateDataCopyWith<_$RootStateData> get copyWith =>
      __$$RootStateDataCopyWithImpl<_$RootStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<User> users, UserResponse? response) data,
    required TResult Function() loading,
    required TResult Function(List<User> users, UserResponse? response)
        loadMore,
    required TResult Function(Exception error) error,
  }) {
    return data(users, response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<User> users, UserResponse? response)? data,
    TResult? Function()? loading,
    TResult? Function(List<User> users, UserResponse? response)? loadMore,
    TResult? Function(Exception error)? error,
  }) {
    return data?.call(users, response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<User> users, UserResponse? response)? data,
    TResult Function()? loading,
    TResult Function(List<User> users, UserResponse? response)? loadMore,
    TResult Function(Exception error)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(users, response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RootStateData value) data,
    required TResult Function(RootStateLoading value) loading,
    required TResult Function(RootStateLoadMore value) loadMore,
    required TResult Function(RootStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RootStateData value)? data,
    TResult? Function(RootStateLoading value)? loading,
    TResult? Function(RootStateLoadMore value)? loadMore,
    TResult? Function(RootStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RootStateData value)? data,
    TResult Function(RootStateLoading value)? loading,
    TResult Function(RootStateLoadMore value)? loadMore,
    TResult Function(RootStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class RootStateData implements RootState {
  const factory RootStateData(
      {required final List<User> users,
      final UserResponse? response}) = _$RootStateData;

  List<User> get users;
  UserResponse? get response;
  @JsonKey(ignore: true)
  _$$RootStateDataCopyWith<_$RootStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RootStateLoadingCopyWith<$Res> {
  factory _$$RootStateLoadingCopyWith(
          _$RootStateLoading value, $Res Function(_$RootStateLoading) then) =
      __$$RootStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RootStateLoadingCopyWithImpl<$Res>
    extends _$RootStateCopyWithImpl<$Res, _$RootStateLoading>
    implements _$$RootStateLoadingCopyWith<$Res> {
  __$$RootStateLoadingCopyWithImpl(
      _$RootStateLoading _value, $Res Function(_$RootStateLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RootStateLoading implements RootStateLoading {
  const _$RootStateLoading();

  @override
  String toString() {
    return 'RootState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RootStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<User> users, UserResponse? response) data,
    required TResult Function() loading,
    required TResult Function(List<User> users, UserResponse? response)
        loadMore,
    required TResult Function(Exception error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<User> users, UserResponse? response)? data,
    TResult? Function()? loading,
    TResult? Function(List<User> users, UserResponse? response)? loadMore,
    TResult? Function(Exception error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<User> users, UserResponse? response)? data,
    TResult Function()? loading,
    TResult Function(List<User> users, UserResponse? response)? loadMore,
    TResult Function(Exception error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RootStateData value) data,
    required TResult Function(RootStateLoading value) loading,
    required TResult Function(RootStateLoadMore value) loadMore,
    required TResult Function(RootStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RootStateData value)? data,
    TResult? Function(RootStateLoading value)? loading,
    TResult? Function(RootStateLoadMore value)? loadMore,
    TResult? Function(RootStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RootStateData value)? data,
    TResult Function(RootStateLoading value)? loading,
    TResult Function(RootStateLoadMore value)? loadMore,
    TResult Function(RootStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RootStateLoading implements RootState {
  const factory RootStateLoading() = _$RootStateLoading;
}

/// @nodoc
abstract class _$$RootStateLoadMoreCopyWith<$Res> {
  factory _$$RootStateLoadMoreCopyWith(
          _$RootStateLoadMore value, $Res Function(_$RootStateLoadMore) then) =
      __$$RootStateLoadMoreCopyWithImpl<$Res>;
  @useResult
  $Res call({List<User> users, UserResponse? response});

  $UserResponseCopyWith<$Res>? get response;
}

/// @nodoc
class __$$RootStateLoadMoreCopyWithImpl<$Res>
    extends _$RootStateCopyWithImpl<$Res, _$RootStateLoadMore>
    implements _$$RootStateLoadMoreCopyWith<$Res> {
  __$$RootStateLoadMoreCopyWithImpl(
      _$RootStateLoadMore _value, $Res Function(_$RootStateLoadMore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
    Object? response = freezed,
  }) {
    return _then(_$RootStateLoadMore(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as UserResponse?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserResponseCopyWith<$Res>? get response {
    if (_value.response == null) {
      return null;
    }

    return $UserResponseCopyWith<$Res>(_value.response!, (value) {
      return _then(_value.copyWith(response: value));
    });
  }
}

/// @nodoc

class _$RootStateLoadMore implements RootStateLoadMore {
  const _$RootStateLoadMore({required final List<User> users, this.response})
      : _users = users;

  final List<User> _users;
  @override
  List<User> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  final UserResponse? response;

  @override
  String toString() {
    return 'RootState.loadMore(users: $users, response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RootStateLoadMore &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_users), response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RootStateLoadMoreCopyWith<_$RootStateLoadMore> get copyWith =>
      __$$RootStateLoadMoreCopyWithImpl<_$RootStateLoadMore>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<User> users, UserResponse? response) data,
    required TResult Function() loading,
    required TResult Function(List<User> users, UserResponse? response)
        loadMore,
    required TResult Function(Exception error) error,
  }) {
    return loadMore(users, response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<User> users, UserResponse? response)? data,
    TResult? Function()? loading,
    TResult? Function(List<User> users, UserResponse? response)? loadMore,
    TResult? Function(Exception error)? error,
  }) {
    return loadMore?.call(users, response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<User> users, UserResponse? response)? data,
    TResult Function()? loading,
    TResult Function(List<User> users, UserResponse? response)? loadMore,
    TResult Function(Exception error)? error,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(users, response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RootStateData value) data,
    required TResult Function(RootStateLoading value) loading,
    required TResult Function(RootStateLoadMore value) loadMore,
    required TResult Function(RootStateError value) error,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RootStateData value)? data,
    TResult? Function(RootStateLoading value)? loading,
    TResult? Function(RootStateLoadMore value)? loadMore,
    TResult? Function(RootStateError value)? error,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RootStateData value)? data,
    TResult Function(RootStateLoading value)? loading,
    TResult Function(RootStateLoadMore value)? loadMore,
    TResult Function(RootStateError value)? error,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class RootStateLoadMore implements RootState {
  const factory RootStateLoadMore(
      {required final List<User> users,
      final UserResponse? response}) = _$RootStateLoadMore;

  List<User> get users;
  UserResponse? get response;
  @JsonKey(ignore: true)
  _$$RootStateLoadMoreCopyWith<_$RootStateLoadMore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RootStateErrorCopyWith<$Res> {
  factory _$$RootStateErrorCopyWith(
          _$RootStateError value, $Res Function(_$RootStateError) then) =
      __$$RootStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Exception error});
}

/// @nodoc
class __$$RootStateErrorCopyWithImpl<$Res>
    extends _$RootStateCopyWithImpl<$Res, _$RootStateError>
    implements _$$RootStateErrorCopyWith<$Res> {
  __$$RootStateErrorCopyWithImpl(
      _$RootStateError _value, $Res Function(_$RootStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$RootStateError(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$RootStateError implements RootStateError {
  const _$RootStateError({required this.error});

  @override
  final Exception error;

  @override
  String toString() {
    return 'RootState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RootStateError &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RootStateErrorCopyWith<_$RootStateError> get copyWith =>
      __$$RootStateErrorCopyWithImpl<_$RootStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<User> users, UserResponse? response) data,
    required TResult Function() loading,
    required TResult Function(List<User> users, UserResponse? response)
        loadMore,
    required TResult Function(Exception error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<User> users, UserResponse? response)? data,
    TResult? Function()? loading,
    TResult? Function(List<User> users, UserResponse? response)? loadMore,
    TResult? Function(Exception error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<User> users, UserResponse? response)? data,
    TResult Function()? loading,
    TResult Function(List<User> users, UserResponse? response)? loadMore,
    TResult Function(Exception error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RootStateData value) data,
    required TResult Function(RootStateLoading value) loading,
    required TResult Function(RootStateLoadMore value) loadMore,
    required TResult Function(RootStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RootStateData value)? data,
    TResult? Function(RootStateLoading value)? loading,
    TResult? Function(RootStateLoadMore value)? loadMore,
    TResult? Function(RootStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RootStateData value)? data,
    TResult Function(RootStateLoading value)? loading,
    TResult Function(RootStateLoadMore value)? loadMore,
    TResult Function(RootStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RootStateError implements RootState {
  const factory RootStateError({required final Exception error}) =
      _$RootStateError;

  Exception get error;
  @JsonKey(ignore: true)
  _$$RootStateErrorCopyWith<_$RootStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
