import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/src/features/authentication/data/auth_repository.dart';

class ProfilePageController extends StateNotifier<AsyncValue<void>> {
  ProfilePageController(this.authRepository) : super(const AsyncData(null));
  final AuthRepository authRepository;

  Future<void> logOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepository.signOut());
  }
}

final profilePageControllerProvider = StateNotifierProvider<ProfilePageController, AsyncValue>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return ProfilePageController(authRepository);
});
