import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/src/constants/app_colors.dart';
import 'package:travel_app/src/constants/app_sizes.dart';
import 'package:travel_app/src/constants/fonts.dart';
import 'package:travel_app/src/features/authentication/presentation/sign_in_page_controller.dart';
import 'package:travel_app/src/features/authentication/presentation/widgets/sign_in_button.dart';
import 'package:travel_app/src/utils/async_value_ui.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(signInPageControllerProvider, (_, next) {
      next.showAlertDialogOnError(context);
    });
    final state = ref.watch(signInPageControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                gapH24,
                SvgPicture.asset('assets/signin_pic.svg'),
                gapH64,
                Container(
                  width: 286,
                  decoration: const BoxDecoration(
                      color: kLightBlueColor,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 16),
                    child: Column(
                      children: [
                        const Text(
                          'Visit your dream \ndestinations',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: kGilroyExtraBold,
                            fontSize: 32,
                            color: Colors.black,
                          ),
                        ),
                        gapH12,
                        const Text(
                          'Easily plan, manage \nand order \nyour journey with \nSafari',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: kGilroyRegular,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        gapH12,
                        SignInButton(
                          onSignInPressed: () => ref
                              .read(signInPageControllerProvider.notifier)
                              .submit(),
                          isLoading: state.isLoading,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
