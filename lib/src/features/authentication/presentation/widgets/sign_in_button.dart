import 'package:flutter/material.dart';
import 'package:travel_app/src/constants/app_colors.dart';
import 'package:travel_app/src/constants/app_sizes.dart';
import 'package:travel_app/src/constants/fonts.dart';

class SignInButton extends StatelessWidget {
  const SignInButton(
      {super.key, required this.onPressed, required this.isLoading});
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isLoading ? null : onPressed,
      style: TextButton.styleFrom(
          minimumSize: const Size(100, 60),
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)))),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: kLightBlueColor,
                  strokeWidth: 3,
                ),
              )
            : Row(
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
      ),
    );
  }
}
