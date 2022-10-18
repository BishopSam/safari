@Timeout(Duration(milliseconds: 500))
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_app/src/exceptions/app_exception.dart';
import 'package:travel_app/src/features/authentication/presentation/sign_in_page_controller.dart';

import '../../../mocks.dart';

void main() {
  group('submit', () {
    test('signin with google succeeds', () async {
      //setup
      final authRepository = MockAuthRepository();
      when(authRepository.signInWithGoogle).thenAnswer((_) => Future.value());

      final controller = SignInPageController(authRepository: authRepository);
      //expectLater
      expectLater(
          controller.stream,
          emitsInOrder([
            const AsyncLoading<void>(),
            const AsyncData<void>(null),
          ]));
      //run
      await controller.submit();
    //verify
      verify(authRepository.signInWithGoogle).called(1);
    });

    test('user cancels sign in', () async {
      final authRepository = MockAuthRepository();
      const exception = AppException.signInCanceled();
      when(authRepository.signInWithGoogle).thenThrow(exception);
      final controller = SignInPageController(authRepository: authRepository);
      expectLater(controller.stream, emitsInOrder([
        const AsyncLoading<void>(),
        isA<AsyncError>()
      ]));
      await controller.submit();

      verify(authRepository.signInWithGoogle).called(1);

    });
  });
}
