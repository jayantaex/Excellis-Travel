import 'package:excellistravel/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../utils/app_helpers.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../bottom_navigation/bottom_nav_module.dart';
import '../../../legal/legal_module.dart';
import '../../auth_module.dart';
import '../../bloc/auth_bloc.dart';
import 'auth_input_widget.dart';
import 'recover_pass_confirmation.dart';

class LoginSheet extends StatefulWidget {
  const LoginSheet({super.key, required this.isLoading});
  final bool isLoading;

  @override
  State<LoginSheet> createState() => _LoginSheetState();
}

class _LoginSheetState extends State<LoginSheet> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String usertype = 'retailer';
  String errMsg = '';

  @override
  void initState() {
    AppConstants.env == 'development'
        ? <String>{
            _userNameController.text = 'agent@reiselab.com',
            _passwordController.text = 'Excellis@#2025'
          }
        : null;
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),

        // height: AppHelpers.getScreenHeight(context) * 0.55,
        width: AppHelpers.getScreenWidth(context),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: Column(
              children: <Widget>[
                // const SizedBox(height: 25),
                SizedBox(
                  width: AppHelpers.getScreenWidth(context),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        context.goNamed(BottomNavModule.name);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 16),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 5),
                        child: const Text(
                          'Skip >>',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),
                const AppText(
                    text: 'Welcome back!', size: 28, weight: FontWeight.bold),
                const AppText(
                  text: 'You can reach us anytime',
                  size: 20,
                  weight: FontWeight.normal,
                ),
                const SizedBox(height: 33),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: AuthDropdownWidget(
                //     items: _items,
                //     onChanged: (String? value) {
                //       usertype = value ?? 'retailer';
                //     },
                //   ),
                // ),
                // const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AuthInputWidget(
                      isPassword: false,
                      maxCharacters: 100,
                      controller: _userNameController,
                      label: 'Email',
                      hint: 'Enter your email address'),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AuthInputWidget(
                      isPassword: true,
                      maxCharacters: 20,
                      controller: _passwordController,
                      label: 'Password',
                      hint: 'Enter your Password'),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Forget your password?',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.grey,
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () async {
                          if (_userNameController.text.isEmpty) {
                            await AppHelpers.showSnackBar(context,
                                'please enter your email to recover password');
                            return;
                          }
                          await recoverPassConfirmation(
                              context, _userNameController.text, () {
                            context.read<AuthBloc>().add(
                                  SendRecoverLinkEvent(
                                    email: _userNameController.text,
                                  ),
                                );
                          });
                        },
                        child: const Text(
                          'Recover Now',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            color: AppColors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AppPrimaryButton(
                    title: 'LOGIN',
                    isLoading: widget.isLoading,
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            LoginEvent(
                              fcmToken: '',
                              userName: _userNameController.text,
                              password: _passwordController.text,
                              userType: usertype,
                            ),
                          );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: AppHelpers.getScreenWidth(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Don’t have an account? ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        onTap: () async {
                          context.goNamed(AuthModule.registerName);
                        },
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'By continuing, you agree to our ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 2),

                SizedBox(
                  width: AppHelpers.getScreenWidth(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        splashColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(LegalModule.termsName);
                        },
                        child: const Text(
                          'Terms & Conditions',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Text(
                        ' and ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(LegalModule.policyName);
                        },
                        child: const Text(
                          'Privacy Policy',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
