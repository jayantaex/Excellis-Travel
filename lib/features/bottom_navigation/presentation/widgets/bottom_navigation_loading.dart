import 'package:flutter/material.dart';


import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';

class BottomNavigationLoading extends StatelessWidget {
  const BottomNavigationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBg(
          child: TransWhiteBgWidget(
              child: SizedBox(
        height: AppHelpers.getScreenHeight(context),
        width: AppHelpers.getScreenWidth(context),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(),
                LoadingEffect(
                  height: 19,
                  width: 140,
                )
              ],
            ),
          ),
        ),
      ))),
    );
  }
}
