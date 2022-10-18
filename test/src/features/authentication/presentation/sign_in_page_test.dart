import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:travel_app/src/exceptions/app_exception.dart';

import '../../../mocks.dart';
import '../auth_robot.dart';

void main() {
  late MockAuthRepository authRepository;
  setUp(() {
    authRepository = MockAuthRepository();
  });


  group('sign in page', (){
  testWidgets(
    '''
Given user is on sign in page
when tap on sign in button
then signinwithgoogle is called once
''',
    (tester) async {
      final r = AuthRobot(tester);
      when(authRepository.signInWithGoogle).thenAnswer((_) => Future.value());
      await r.pumpSignInPage(authRepository: authRepository);
      await r.tapSignInButton();
      verify(authRepository.signInWithGoogle).called(1);
    },
  );

  testWidgets(
    '''
Given user is on sign in page
when tap on sign in button
then user cancels sign in 
''',
    (tester) async {
      final r = AuthRobot(tester);
      const exception = AppException.signInCanceled();
      when(authRepository.signInWithGoogle).thenThrow(exception);
      await r.pumpSignInPage(authRepository: authRepository);
      await r.tapSignInButton();
      verify(authRepository.signInWithGoogle).called(1);
      r.expectErrorDialogFound();
    },
  );

  });

}
