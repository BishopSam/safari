import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_app/src/common_widgets/alert_dialogs.dart';
import 'package:travel_app/src/common_widgets/primary_button.dart';
import 'package:travel_app/src/constants/app_colors.dart';
import 'package:travel_app/src/constants/app_sizes.dart';
import 'package:travel_app/src/constants/fonts.dart';
import 'package:travel_app/src/features/authentication/data/auth_repository.dart';
import 'package:travel_app/src/features/authentication/presentation/profile/profile_page_controller.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authRepositoryProvider).currentUser;
    final state = ref.watch(profilePageControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              gapH64,
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: kPrimaryColor, width: 1.5)),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    child: Image.network(
                      user?.photoURL ?? '',
                      height: 200,
                      width: 200,
                      scale: 0.5,
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                      // loadingBuilder: (context, child, loadingProgress) =>
                      //     const CircularProgressIndicator(),
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.error,
                        color: kPrimaryColor,
                      ),
                    )),
              ),
              gapH48,
              Container(
                height: 300,
                width: 330,
                decoration: BoxDecoration(
                  color: kLightBlueColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 15.0, left: 15, top: 20, bottom: 10),
                  child: UserDataWidget(
                    user: user!,
                  ),
                ),
              ),
              gapH32,
              PrimaryButton(
                onPressed: () async {
                  final logout = await showAlertDialog(
                    context: context,
                    title: 'Are you sure?',
                    cancelActionText: 'Cancel',
                    defaultActionText: 'Logout',
                  );
                  if (logout == true) {
                    ref.read(profilePageControllerProvider.notifier).logOut();
                  }
                },
                loading: state.isLoading,
                child: const Text(
                  'Logout',
                  style: TextStyle(fontFamily: kGilroyRegular, fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class UserDataWidget extends StatelessWidget {
  const UserDataWidget({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        gapH12,
        UserInfoWidget(
          title: 'Name',
          info: user.displayName!,
        ),
        gapH24,
        UserInfoWidget(info: user.email!, title: 'E-mail'),
        gapH24,
        UserInfoWidget(info: user.phoneNumber ?? '', title: 'Phone Number'),
        gapH24,
        UserInfoWidget(info: user.phoneNumber ?? '', title: 'Location')
      ],
    );
  }
}

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    Key? key,
    required this.info,
    required this.title,
  }) : super(key: key);

  final String info, title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      // width: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: kPrimaryColor)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Text(
              '$title:',
              maxLines: 2,
              style: const TextStyle(fontFamily: kGilroyBold),
            ),
            gapW24,
            Text(
              info,
              style: const TextStyle(fontFamily: kGilroyRegular),
            )
          ],
        ),
      ),
    );
  }
}
