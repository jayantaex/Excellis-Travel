import 'package:excellistravel/core/utils/app_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/errors/error_wiget.dart';
import '../../../../core/widgets/app_exit_sheet.dart';
import '../../../../core/widgets/app_sheet.dart';
import '../../../bottom_navigation/bottom_nav_module.dart';
import '../../bloc/auth_bloc.dart';
import '../widgets/login_sheet.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    child: BlocConsumer<AuthBloc, AuthState>(
                      listener: (BuildContext context, AuthState state) {
                        if (state is AuthError) {
                          AppErrorWidget.show(
                            type: WidghetType.snackBar,
                            context: context,
                            message: state.message,
                            onOk: () {},
                          );
                        }

                        if (state is Authenticated) {
                          context.goNamed(BottomNavModule.name);
                        }

                        if (state is PasswordResetSuccess) {
                          AppHelpers.showSnackBar(
                              backgroundColor: AppColors.success,
                              context,
                              'Password reset link sent successfully');
                        }
                      },
                      builder: (BuildContext context, AuthState state) =>
                          LoginSheet(
                        isLoading: state is AuthLoading,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
