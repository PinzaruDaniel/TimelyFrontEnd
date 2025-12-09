import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:presentation/util/resources/app_colors.dart';

class MainCircularProgressIndicatorWidget extends StatelessWidget {
  const MainCircularProgressIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitSpinningLines(color: AppColors.primaryBlue, size: 115,);
  }
}
