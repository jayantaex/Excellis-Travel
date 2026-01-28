import 'package:flutter/material.dart';

import '../../../../utils/app_helpers.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/loading_effect.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';

class BottomNavigationLoading extends StatelessWidget {
  const BottomNavigationLoading({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
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
                    children: <Widget>[
                      const SizedBox(height: 8),
                      SizedBox(
                        width: AppHelpers.getScreenWidth(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: AppHelpers.getScreenWidth(context) * 0.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  LoadingEffect(
                                    height: 19,
                                    width: 140,
                                  ),
                                  const SizedBox(height: 8),
                                  LoadingEffect(
                                    height: 25,
                                    width: 140,
                                  )
                                ],
                              ),
                            ),
                            LoadingEffect(
                              height: 45,
                              width: 45,
                              radius: 45,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      LoadingEffect(
                        radius: 24,
                        height: AppHelpers.getScreenHeight(context) * 0.5,
                        width: AppHelpers.getScreenWidth(context),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          LoadingEffect(
                            height: 20,
                            width: 120,
                          ),
                          LoadingEffect(
                            height: 20,
                            width: 50,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      LoadingEffect(
                        height: AppHelpers.getScreenHeight(context) * 0.17,
                        width: AppHelpers.getScreenWidth(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
