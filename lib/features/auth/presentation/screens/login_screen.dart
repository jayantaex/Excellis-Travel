import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/errors/error_wiget.dart';
import '../../bloc/auth_bloc.dart';
import '../widgets/login_sheet.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              margin: const EdgeInsets.only(top: 120),
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
    );
  }
}
