// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppException {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInCanceled,
    required TResult Function() invalidGoogleIdToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? signInCanceled,
    TResult Function()? invalidGoogleIdToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInCanceled,
    TResult Function()? invalidGoogleIdToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInCanceled value) signInCanceled,
    required TResult Function(InvalidGoogleIdToken value) invalidGoogleIdToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInCanceled value)? signInCanceled,
    TResult Function(InvalidGoogleIdToken value)? invalidGoogleIdToken,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInCanceled value)? signInCanceled,
    TResult Function(InvalidGoogleIdToken value)? invalidGoogleIdToken,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppExceptionCopyWith<$Res> {
  factory $AppExceptionCopyWith(
          AppException value, $Res Function(AppException) then) =
      _$AppExceptionCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppExceptionCopyWithImpl<$Res> implements $AppExceptionCopyWith<$Res> {
  _$AppExceptionCopyWithImpl(this._value, this._then);

  final AppException _value;
  // ignore: unused_field
  final $Res Function(AppException) _then;
}

/// @nodoc
abstract class _$$SignInCanceledCopyWith<$Res> {
  factory _$$SignInCanceledCopyWith(
          _$SignInCanceled value, $Res Function(_$SignInCanceled) then) =
      __$$SignInCanceledCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInCanceledCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res>
    implements _$$SignInCanceledCopyWith<$Res> {
  __$$SignInCanceledCopyWithImpl(
      _$SignInCanceled _value, $Res Function(_$SignInCanceled) _then)
      : super(_value, (v) => _then(v as _$SignInCanceled));

  @override
  _$SignInCanceled get _value => super._value as _$SignInCanceled;
}

/// @nodoc

class _$SignInCanceled implements SignInCanceled {
  const _$SignInCanceled();

  @override
  String toString() {
    return 'AppException.signInCanceled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignInCanceled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInCanceled,
    required TResult Function() invalidGoogleIdToken,
  }) {
    return signInCanceled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? signInCanceled,
    TResult Function()? invalidGoogleIdToken,
  }) {
    return signInCanceled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInCanceled,
    TResult Function()? invalidGoogleIdToken,
    required TResult orElse(),
  }) {
    if (signInCanceled != null) {
      return signInCanceled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInCanceled value) signInCanceled,
    required TResult Function(InvalidGoogleIdToken value) invalidGoogleIdToken,
  }) {
    return signInCanceled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInCanceled value)? signInCanceled,
    TResult Function(InvalidGoogleIdToken value)? invalidGoogleIdToken,
  }) {
    return signInCanceled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInCanceled value)? signInCanceled,
    TResult Function(InvalidGoogleIdToken value)? invalidGoogleIdToken,
    required TResult orElse(),
  }) {
    if (signInCanceled != null) {
      return signInCanceled(this);
    }
    return orElse();
  }
}

abstract class SignInCanceled implements AppException {
  const factory SignInCanceled() = _$SignInCanceled;
}

/// @nodoc
abstract class _$$InvalidGoogleIdTokenCopyWith<$Res> {
  factory _$$InvalidGoogleIdTokenCopyWith(_$InvalidGoogleIdToken value,
          $Res Function(_$InvalidGoogleIdToken) then) =
      __$$InvalidGoogleIdTokenCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidGoogleIdTokenCopyWithImpl<$Res>
    extends _$AppExceptionCopyWithImpl<$Res>
    implements _$$InvalidGoogleIdTokenCopyWith<$Res> {
  __$$InvalidGoogleIdTokenCopyWithImpl(_$InvalidGoogleIdToken _value,
      $Res Function(_$InvalidGoogleIdToken) _then)
      : super(_value, (v) => _then(v as _$InvalidGoogleIdToken));

  @override
  _$InvalidGoogleIdToken get _value => super._value as _$InvalidGoogleIdToken;
}

/// @nodoc

class _$InvalidGoogleIdToken implements InvalidGoogleIdToken {
  const _$InvalidGoogleIdToken();

  @override
  String toString() {
    return 'AppException.invalidGoogleIdToken()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvalidGoogleIdToken);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInCanceled,
    required TResult Function() invalidGoogleIdToken,
  }) {
    return invalidGoogleIdToken();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? signInCanceled,
    TResult Function()? invalidGoogleIdToken,
  }) {
    return invalidGoogleIdToken?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInCanceled,
    TResult Function()? invalidGoogleIdToken,
    required TResult orElse(),
  }) {
    if (invalidGoogleIdToken != null) {
      return invalidGoogleIdToken();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInCanceled value) signInCanceled,
    required TResult Function(InvalidGoogleIdToken value) invalidGoogleIdToken,
  }) {
    return invalidGoogleIdToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInCanceled value)? signInCanceled,
    TResult Function(InvalidGoogleIdToken value)? invalidGoogleIdToken,
  }) {
    return invalidGoogleIdToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInCanceled value)? signInCanceled,
    TResult Function(InvalidGoogleIdToken value)? invalidGoogleIdToken,
    required TResult orElse(),
  }) {
    if (invalidGoogleIdToken != null) {
      return invalidGoogleIdToken(this);
    }
    return orElse();
  }
}

abstract class InvalidGoogleIdToken implements AppException {
  const factory InvalidGoogleIdToken() = _$InvalidGoogleIdToken;
}
