import 'package:excellistravel/core/widgets/app_custom_appbar.dart';
import 'package:excellistravel/core/widgets/app_gradient_bg.dart';
import 'package:excellistravel/core/widgets/app_sheet.dart';
import 'package:excellistravel/core/widgets/trans_white_bg_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/delete_confirmation_dialog.dart';
import '../widgets/edit_markup_sheet.dart';
import '../widgets/my_markup_card.dart';

class MyMarkupScreen extends StatelessWidget {
  const MyMarkupScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AppGradientBg(
          child: TransWhiteBgWidget(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const AppCustomAppbar(
                      centerTitle: 'My Markup',
                    ),
                    const SizedBox(height: 45),
                    Expanded(
                        child: Column(
                      children: [
                        MyMarkUpCard(
                          id: '1',
                          type: 'Domestic',
                          product: 'Airline',
                          unit: 'Percentage',
                          value: 3.45,
                          createdBy: 'Self',
                          status: 'active',
                          onEdit: () {},
                        ),
                        MyMarkUpCard(
                          id: '2',
                          type: 'International',
                          product: 'Hotel',
                          unit: 'Fixed',
                          value: 250.00,
                          createdBy: 'Admin',
                          status: 'active',
                          onEdit: () {
                            showAppSheet(
                              submitButtonRequired: true,
                              submitButtonTitle: 'Update',
                              onSubmitPressed: () {
                                // TODO: Implement update logic
                                print('Update markup');
                              },
                              context: context,
                              title: 'Edit Markup',
                              child: const AddEditMarkUpSheet(
                                initialType: 'International',
                                initialProduct: 'Hotel',
                                initialUnit: 'Fixed',
                                initialValue: 250.00,
                                initialStatus: 'active',
                              ),
                            );
                          },
                          onDelete: () {
                            showDeleteConfirmationDialog(
                              context: context,
                              title: 'Delete Commission',
                              message:
                                  'Are you sure you want to delete this commission? This action cannot be undone.',
                              onConfirm: () {
                                // TODO: Implement actual delete logic
                                print('Commission ID: 2 deleted');
                              },
                            );
                          },
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
