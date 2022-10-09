import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/src/features/authentication/data/auth_repository.dart';

class SignInPageController extends StateNotifier<AsyncValue<void>> {
  SignInPageController({required this.authRepository})
      : super(const AsyncData(null));
  final AuthRepository authRepository;

  Future<void> submit() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepository.signInWithGoogle());
  }
}

final signInPageControllerProvider =
    StateNotifierProvider<SignInPageController, AsyncValue>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return SignInPageController(
    authRepository: authRepository,
  );
});
