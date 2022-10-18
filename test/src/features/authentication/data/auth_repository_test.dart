import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_app/src/exceptions/app_exception.dart';

import '../../../mocks.dart';

void main() {
  group('Auth repository tests', () {

    test('current user is null before sign in', () {
      final authRepository = MockAuthRepository();
    
      when(authRepository.authStateChanges)
          .thenAnswer((_) => Stream.value(null));
      expect(authRepository.currentUser, null);
      expect(authRepository.authStateChanges(), emits(null));
    });

    test('current user is not null when sign in succeeds', () async {
       final authRepository = MockAuthRepository();
      final mockUser = MockUser();
      when(authRepository.signInWithGoogle).thenAnswer((_) => Future.value());
      when(authRepository.authStateChanges)
          .thenAnswer((_) => Stream.value(mockUser));
      when(() => authRepository.currentUser).thenReturn(mockUser);
      await authRepository.signInWithGoogle();
      expect(authRepository.currentUser, mockUser);
      expect(authRepository.authStateChanges(), emits(mockUser));
    });

    test('current user is null after sign out', () async {
       final authRepository = MockAuthRepository();
      when(authRepository.signOut).thenAnswer((_) => Future.value());
      when(authRepository.authStateChanges)
          .thenAnswer((_) => Stream.value(null));
      when(() => authRepository.currentUser).thenReturn(null);
      await authRepository.signOut();
      expect(authRepository.currentUser, null);
      expect(authRepository.authStateChanges(), emits(null));
    });

    test('sign in throws when missing google id', () async {
       final authRepository = MockAuthRepository();
     
      const exception = AppException.invalidGoogleIdToken();
      when(authRepository.signInWithGoogle).thenThrow(exception);
      when(authRepository.authStateChanges)
          .thenAnswer((_) => Stream.value(null));
      when(() => authRepository.currentUser).thenReturn(null);
      await expectLater(authRepository.signInWithGoogle,
          throwsA(const AppException.invalidGoogleIdToken()));
      expect(authRepository.currentUser, null);
      expect(authRepository.authStateChanges(), emits(null));
    });

    test('sign in throws when sign in canceled', () async {
       final authRepository = MockAuthRepository();
     
      const exception = AppException.signInCanceled();
      when(authRepository.signInWithGoogle).thenThrow(exception);
      when(authRepository.authStateChanges)
          .thenAnswer((_) => Stream.value(null));
      when(() => authRepository.currentUser).thenReturn(null);
      await expectLater(authRepository.signInWithGoogle,
          throwsA(const AppException.signInCanceled()));
      expect(authRepository.currentUser, null);
      expect(authRepository.authStateChanges(), emits(null));
    });
  });
}
