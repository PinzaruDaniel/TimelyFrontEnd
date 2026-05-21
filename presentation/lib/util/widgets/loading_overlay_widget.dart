import 'package:flutter/material.dart';
import 'main_circular_progress_indicator_widget.dart';

class LoadingOverlayWidget extends StatelessWidget {
  const LoadingOverlayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Center(
            child: MainCircularProgressIndicatorWidget(),
          ),
        ),
      ],
    );
  }
}
