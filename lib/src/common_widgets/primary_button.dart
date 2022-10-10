import 'package:flutter/material.dart';
import 'package:travel_app/src/constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.onPressed,
       this.loading = false,
      required this.child});
  final VoidCallback? onPressed;
  final bool loading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: loading ? null : onPressed,
      style: TextButton.styleFrom(
          minimumSize: const Size(100, 60),
          backgroundColor: kPrimaryColor,
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)))),
      child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: loading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: kLightBlueColor,
                    strokeWidth: 3,
                  ),
                )
              : child),
    );
  }
}
