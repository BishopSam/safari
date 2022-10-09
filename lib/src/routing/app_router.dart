import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/src/features/authentication/data/auth_repository.dart';
import 'package:travel_app/src/features/authentication/presentation/sign_in_page.dart';
import 'package:travel_app/src/features/destinations/presentation/home_page.dart';

enum AppRoute { signIn, home }

final goRouterProvider = Provider<GoRouter>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      redirect: (_, state) {
        final isLoggedIn = authRepository.currentUser != null;
        if (isLoggedIn) {
        if (state.location == '/signIn') {
          return '/';
        }
        } else {
          if (state.location == '/') {
          return '/signIn';
         
        }
        }
      },
      refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
      routes: [
        GoRoute(
          path: '/',
          name: AppRoute.home.name,
          builder: (context, state) => const HomePage(),
          routes: [
        GoRoute(
          path: 'signIn',
          name: AppRoute.signIn.name,
          builder: (context, state) => const SignInPage(),
        )
          ]
        ),
      ]);
});


class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

