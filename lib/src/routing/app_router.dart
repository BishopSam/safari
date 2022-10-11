import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/src/features/authentication/data/auth_repository.dart';
import 'package:travel_app/src/features/authentication/presentation/profile/profile_page.dart';
import 'package:travel_app/src/features/authentication/presentation/sign_in_page.dart';
import 'package:travel_app/src/features/bookings/presentation/bookings_page.dart';
import 'package:travel_app/src/features/destinations/presentation/explore/explore_page.dart';
import 'package:travel_app/src/features/destinations/presentation/home_page.dart';
import 'package:travel_app/src/routing/bottom_navigation/scaffold_with_bottom_nav_bar.dart';
import 'package:travel_app/src/routing/not_found_screen.dart';

enum AppRoute {
  signIn,
  home,
  explore,
  bookings,
  profile,
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GoRouter(
    initialLocation: '/home',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    redirect: (_, state) {
      final isLoggedIn = authRepository.currentUser != null;
      debugPrint(authRepository.currentUser?.displayName.toString());
      if (isLoggedIn) {
        if (state.location == '/signIn') {
          return '/home';
        }
      } else {
        if (state.location == '/home') {
          return '/signIn';
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return ScaffoldWithBottomNavBar(child: child);
          },
          routes: [
            GoRoute(
                path: '/home',
                name: AppRoute.home.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: HomePage()),
                routes: const []),
            GoRoute(
                path: '/explore',
                name: AppRoute.explore.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ExplorePage()),
                routes: const []),
            GoRoute(
                path: '/bookings',
                name: AppRoute.bookings.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: BookingsPage()),
                routes: const []),
            GoRoute(
                path: '/profile',
                name: AppRoute.profile.name,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ProfilePage()),
                routes: const []),
          ]),
      GoRoute(
        path: '/signIn',
        name: AppRoute.signIn.name,
        builder: (context, state) => const SignInPage(),
      )
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
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
