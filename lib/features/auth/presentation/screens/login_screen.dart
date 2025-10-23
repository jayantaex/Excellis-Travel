import 'package:excellistravel/core/utils/app_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/errors/error_wiget.dart';
import '../../../../core/widgets/app_exit_sheet.dart';
import '../../bloc/auth_bloc.dart';
import '../widgets/login_sheet.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          await showAppExitSheet(context: context);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Center(
                child: Image.asset('assets/images/app_logo.png'),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 40),
                margin: EdgeInsets.only(
                    //onkey board
                    top: AppHelpers.getScreenHeight(context) * 0.1),
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthError) {
                      AppErrorWidget.show(
                          type: WidghetType.snackBar,
                          context: context,
                          message: state.message,
                          onOk: () {});
                    }
                  },
                  builder: (context, state) {
                    return LoginSheet(
                      isLoading: state is AuthLoading,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
