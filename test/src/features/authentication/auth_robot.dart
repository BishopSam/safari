import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travel_app/src/features/authentication/data/auth_repository.dart';
import 'package:travel_app/src/features/authentication/presentation/sign_in_page.dart';
import 'package:travel_app/src/features/authentication/presentation/widgets/sign_in_button.dart';

class AuthRobot {
  AuthRobot(this.tester);
  final WidgetTester tester;

  Future<void> pumpSignInPage({
    required AuthRepository authRepository,
  }) async {
   
    return tester.pumpWidget(ProviderScope(
        overrides: [authRepositoryProvider.overrideWithValue(authRepository)],
        child: const MaterialApp(
          home: Scaffold(body: SignInPage()),
        )));
  }

   Future<void> setSurfaceSize(Size size) async {
    await tester.binding.setSurfaceSize(size);
    tester.binding.window.physicalSizeTestValue = size;
    tester.binding.window.devicePixelRatioTestValue = 1.0;
  }

  Future<void> tapSignInButton() async {
    final finder = find.byType(SignInButton);
     final listFinder = find.byType(Scrollable);
    await tester.scrollUntilVisible(finder, 500, scrollable: listFinder);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  void signInButtonNotFound() {
    final finder = find.byType(SignInButton);
    expect(finder, findsNothing);
  }

  void expectErrorDialogFound() {
    final finder = find.text('Error');
    expect(finder, findsOneWidget); 
  }
}
