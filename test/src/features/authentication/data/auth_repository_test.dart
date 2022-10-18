import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_app/src/exceptions/app_exception.dart';

import '../../../mocks.dart';

void main() {
  group('Auth repository tests', () {
    late final MockAuthRepository authRepository;
    late final MockUser mockUser;

    setUp(() {
      authRepository = MockAuthRepository();
      mockUser = MockUser();
    });

    test('current user is null before sign in', () {
      when(authRepository.authStateChanges)
          .thenAnswer((_) => Stream.value(null));
      expect(authRepository.currentUser, null);
      expect(authRepository.authStateChanges(), emits(null));
    });
    
    test('current user is not null when sign in succeeds', () async {
      when(authRepository.signInWithGoogle).thenAnswer((_) => Future.value());
      when(authRepository.authStateChanges)
          .thenAnswer((_) => Stream.value(mockUser));
      when(() => authRepository.currentUser).thenReturn(mockUser);
      await authRepository.signInWithGoogle();
      expect(authRepository.currentUser, mockUser);
      expect(authRepository.authStateChanges(), emits(mockUser));
    });

    test('current user is null after sign out', () async {
      when(authRepository.signOut).thenAnswer((_) => Future.value());
      when(authRepository.authStateChanges)
          .thenAnswer((_) => Stream.value(null));
      await authRepository.signOut();
      expect(authRepository.currentUser, null);
      expect(authRepository.authStateChanges(), emits(null));
    });

    test('sign in throws when missing google id', () async {
      const exception = AppException.invalidGoogleIdToken();
      when(authRepository.signInWithGoogle).thenThrow(exception);
      when(authRepository.authStateChanges)
          .thenAnswer((_) => Stream.value(null));
      await expectLater(authRepository.signInWithGoogle,
          throwsA(const AppException.invalidGoogleIdToken()));
      expect(authRepository.currentUser, null);
      expect(authRepository.authStateChanges(), emits(null));
    });

    test('sign in throws when sign in canceled', () async {
      const exception = AppException.signInCanceled();
      when(authRepository.signInWithGoogle).thenThrow(exception);
      when(authRepository.authStateChanges)
          .thenAnswer((_) => Stream.value(null));
      await expectLater(authRepository.signInWithGoogle,
          throwsA(const AppException.signInCanceled()));
      expect(authRepository.currentUser, null);
      expect(authRepository.authStateChanges(), emits(null));
    });
  });
}
