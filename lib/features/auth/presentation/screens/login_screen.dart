import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/errors/error_wiget.dart';
import '../../../../core/widgets/app_exit_sheet.dart';
import '../../../bottom_navigation/bottom_nav_module.dart';
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
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  child: BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
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
                    },
                    builder: (context, state) {
                      return LoginSheet(
                        isLoading: state is AuthLoading,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
