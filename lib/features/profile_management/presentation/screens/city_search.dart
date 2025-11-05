import 'package:excellistravel/core/utils/app_helpers.dart';
import 'package:excellistravel/core/widgets/primary_input.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';

class CitySearch extends StatelessWidget {
  final int stateId;
  final String stateCode;
  final String stateName;
  const CitySearch(
      {super.key,
      required this.stateId,
      required this.stateCode,
      required this.stateName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBg(
        child: TransWhiteBgWidget(
          child: SizedBox(
              height: AppHelpers.getScreenHeight(context),
              width: AppHelpers.getScreenWidth(context),
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                      child: AppCustomAppbar(
                        centerTitle: 'Select City',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: AppColors.white,
                        ),
                        child: Column(
                          children: [
                            AppPrimaryInput(
                              maxCharacters: 100,
                              label: 'City',
                              controller: TextEditingController(),
                              hint: 'Enter your city name',
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              height:
                                  AppHelpers.getScreenHeight(context) * 0.72,
                              child: ListView.builder(
                                itemBuilder: (context, index) => const ListTile(
                                  title: Text('Kolkata'),
                                  subtitle: Text('West bengal'),
                                ),
                                itemCount: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
