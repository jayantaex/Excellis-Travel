import 'package:flutter/material.dart';
import 'package:reiselab/core/widgets/app_gradient_bg.dart';
import 'package:reiselab/core/widgets/trans_white_bg_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/common_widgets.dart';
import '../../../../core/widgets/loading_widget.dart';

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
