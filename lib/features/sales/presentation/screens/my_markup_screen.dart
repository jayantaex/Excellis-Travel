import 'package:excellistravel/core/widgets/app_custom_appbar.dart';
import 'package:excellistravel/core/widgets/app_gradient_bg.dart';
import 'package:excellistravel/core/widgets/app_sheet.dart';
import 'package:excellistravel/core/widgets/trans_white_bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/errors/error_screen.dart';
import '../../bloc/sales_bloc.dart';
import '../widgets/delete_confirmation_dialog.dart';
import '../widgets/edit_markup_sheet.dart';
import '../widgets/my_markup_card.dart';

class MyMarkupScreen extends StatefulWidget {
  const MyMarkupScreen({super.key});

  @override
  State<MyMarkupScreen> createState() => _MyMarkupScreenState();
}

class _MyMarkupScreenState extends State<MyMarkupScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch markup data when screen loads
    Future.microtask(() {
      if (mounted) {
        context.read<SalesBloc>().add(const GetMarkupEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AppGradientBg(
          child: TransWhiteBgWidget(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    AppCustomAppbar(
                      centerTitle: 'My Markup',
                      trailing: CircleAvatar(
                        backgroundColor: AppColors.black.withOpacity(0.1),
                        child: IconButton(
                          onPressed: () {
                            showAppSheet(
                                submitButtonRequired: true,
                                onSubmitPressed: () {
                                  // TODO: Implement add markup logic
                                },
                                context: context,
                                title: 'Add New Markup',
                                child: const AddEditMarkUpSheet());
                          },
                          icon: const Icon(
                            Icons.add_circle_outline_rounded,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 45),
                    Expanded(
                      child: BlocConsumer<SalesBloc, SalesState>(
                        listener: (context, state) {
                          if (state is MarkupAdded) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Markup added successfully'),
                                backgroundColor: Colors.green,
                              ),
                            );
                            // Refresh the list
                            context
                                .read<SalesBloc>()
                                .add(const GetMarkupEvent());
                          } else if (state is MarkupAddError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.message),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else if (state is MarkupUpdated) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Markup updated successfully'),
                                backgroundColor: Colors.green,
                              ),
                            );
                            // Refresh the list
                            context
                                .read<SalesBloc>()
                                .add(const GetMarkupEvent());
                          } else if (state is MarkupUpdateError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.message),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is MarkupLoading) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          }

                          if (state is MarkupLoadError) {
                            return ErrorScreen(
                              errorMessage: 'Error Loading Markup',
                              errorDesc: state.message,
                            );
                          }

                          if (state is MarkupLoaded) {
                            // TODO: Display actual markup data from state
                            // For now, showing placeholder data
                            return ListView(
                              children: [
                                MyMarkUpCard(
                                  id: '1',
                                  type: 'Domestic',
                                  product: 'Airline',
                                  unit: 'Percentage',
                                  value: 3.45,
                                  createdBy: 'Self',
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
                                        initialType: 'Domestic',
                                        initialProduct: 'Airline',
                                        initialUnit: 'Percentage',
                                        initialValue: 3.45,
                                        initialStatus: 'active',
                                      ),
                                    );
                                  },
                                  onDelete: () {
                                    showDeleteConfirmationDialog(
                                      context: context,
                                      title: 'Delete Markup',
                                      message:
                                          'Are you sure you want to delete this markup? This action cannot be undone.',
                                      onConfirm: () {
                                        // TODO: Implement actual delete logic
                                        print('Markup ID: 1 deleted');
                                      },
                                    );
                                  },
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
                                      title: 'Delete Markup',
                                      message:
                                          'Are you sure you want to delete this markup? This action cannot be undone.',
                                      onConfirm: () {
                                        // TODO: Implement actual delete logic
                                        print('Markup ID: 2 deleted');
                                      },
                                    );
                                  },
                                ),
                              ],
                            );
                          }

                          // Default state - show empty or initial view
                          return const Center(
                            child: Text('No markup data available'),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
