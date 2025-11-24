import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/app_exit_sheet.dart';
import '../../../../core/widgets/app_sheet.dart';
import '../widgets/registration_sheet.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, Object? result) async {
          if (!didPop) {
            await showAppSheet(
                onSubmitPressed: () async {
                  SystemNavigator.pop();
                },
                submitButtonRequired: true,
                submitButtonTitle: 'Yes',
                context: context,
                title: 'Exit',
                child: const AppExitSheet());
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.black,
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: Image.asset('assets/images/app_logo.png'),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: const AgencyRegistrationSheet(),
                ),
              ),
            ],
          ),
        ),
      );
}
