import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException {
  //Auth
  const factory AppException.signInCanceled() = SignInCanceled;
  const factory AppException.invalidGoogleIdToken() = MissingGoogleIdToken;
}

class AppExceptionData {
  AppExceptionData(this.code, this.message);
  // it's quite common to define exceptions with both a **code** and a **message**
  final String code;
  final String message;

  @override
  String toString() => 'AppExceptionData(code: $code, message: $message)';
}

extension AppExceptionDetails on AppException {
  AppExceptionData get details {
    return when(
        signInCanceled: () =>
            AppExceptionData('sign-in-canceled', 'Sign In Canceled'),
        invalidGoogleIdToken: () =>
            AppExceptionData('invalid-id-token', 'Operation Failed'));
  }
}
