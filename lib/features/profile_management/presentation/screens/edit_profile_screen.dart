import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_input.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../widgets/delete_account_sheet.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AppGradientBg(
      child: TransWhiteBgWidget(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                child: AppCustomAppbar(
                  centerTitle: 'Profile',
                  trailing: CircleAvatar(
                    backgroundColor: AppColors.black.withOpacity(0.1),
                    child: IconButton(
                      onPressed: () async {
                        await showDeleteAccountSheet(context: context);
                      },
                      icon: const Icon(
                        Icons.more_horiz_rounded,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Badge(
                offset: Offset(-10, -30),
                backgroundColor: AppColors.white,
                padding: EdgeInsets.all(0),
                alignment: Alignment.bottomRight,
                label: InkWell(
                  child: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Icon(
                      Icons.camera_alt_rounded,
                      size: 20,
                    ),
                  ),
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/images/user.jpg'),
                ),
              ),
              const SizedBox(height: 8),
              const Text('Jhon Doe',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white)),
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AppPrimaryInput(
                            controller: TextEditingController(text: 'Jhon'),
                            label: 'First Name',
                            maxCharacters: 50,
                            isMultiline: false,
                          ),
                          const SizedBox(height: 16),
                          AppPrimaryInput(
                            controller: TextEditingController(text: 'Deo'),
                            label: 'Last Name',
                            maxCharacters: 50,
                            isMultiline: false,
                          ),
                          const SizedBox(height: 16),
                          AppPrimaryInput(
                            controller:
                                TextEditingController(text: 'jhon@email.com'),
                            label: 'Email',
                            maxCharacters: 50,
                            isMultiline: false,
                          ),
                          const SizedBox(height: 16),
                          AppPrimaryInput(
                            controller:
                                TextEditingController(text: '9064187130'),
                            label: 'Phone Number',
                            maxCharacters: 10,
                            isMultiline: false,
                          ),
                          const SizedBox(height: 16),
                          AppPrimaryInput(
                            controller:
                                TextEditingController(text: '123456789012'),
                            label: 'AAdhar Number',
                            maxCharacters: 12,
                            isMultiline: false,
                          ),
                          const SizedBox(height: 16),
                          AppPrimaryInput(
                            controller:
                                TextEditingController(text: 'GNUPM1558F'),
                            label: 'Pan Number',
                            maxCharacters: 10,
                            isMultiline: false,
                          ),
                          const SizedBox(height: 16),
                          AppPrimaryInput(
                            controller:
                                TextEditingController(text: 'Kolkata Airport'),
                            label: 'Nearby Airport',
                            maxCharacters: 10,
                            isMultiline: false,
                          ),
                          const SizedBox(height: 16),
                          AppPrimaryInput(
                            controller:
                                TextEditingController(text: 'Sec-v, Kolkata'),
                            label: 'Office Address',
                            maxCharacters: 10,
                            isMultiline: false,
                          ),
                          const SizedBox(height: 16),
                          AppPrimaryInput(
                            controller: TextEditingController(text: 'Kolkata'),
                            label: 'City',
                            maxCharacters: 50,
                            isMultiline: false,
                          ),
                          const SizedBox(height: 16),
                          AppPrimaryInput(
                            controller:
                                TextEditingController(text: 'West Bengal'),
                            label: 'State',
                            maxCharacters: 50,
                            isMultiline: false,
                          ),
                          const SizedBox(height: 16),
                          AppPrimaryInput(
                            controller: TextEditingController(text: '720001'),
                            label: 'Pincode',
                            maxCharacters: 6,
                            isMultiline: false,
                          ),
                          const SizedBox(height: 16),
                          const AppPrimaryButton(
                            title: 'Save',
                            isLoading: false,
                            bgColor: AppColors.primary,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
