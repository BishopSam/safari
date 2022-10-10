import 'package:flutter/material.dart';
import 'package:travel_app/src/common_widgets/primary_button.dart';
import 'package:travel_app/src/constants/app_sizes.dart';
import 'package:travel_app/src/constants/fonts.dart';


class SignInButton extends PrimaryButton {
  SignInButton(
      {super.key, required this.onSignInPressed, required this.isLoading})
      : super(
          onPressed: onSignInPressed,
          loading: isLoading,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/google_logo.png'),
              gapW12,
              const Text(
                'Continue with Google',
                style: TextStyle(fontFamily: kGilroyBold, fontSize: 17),
              ),
            ],
          ),
        );

  final VoidCallback? onSignInPressed;

  final bool isLoading;
}
