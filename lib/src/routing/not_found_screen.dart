import 'package:flutter/material.dart';
import 'package:travel_app/src/common_widgets/empty_place_holder_widget.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: EmptyPlaceholderWidget(
          message: '404 - Page not found!',
        ),
      ),
    );
  }
}
