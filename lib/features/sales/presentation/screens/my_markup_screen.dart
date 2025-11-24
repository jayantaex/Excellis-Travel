import 'package:excellistravel/core/widgets/app_custom_appbar.dart';
import 'package:excellistravel/core/widgets/app_gradient_bg.dart';
import 'package:excellistravel/core/widgets/app_sheet.dart';
import 'package:excellistravel/core/widgets/trans_white_bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/errors/error_screen.dart';
import '../../bloc/sales_bloc.dart';
import '../../data/models/markup_data_model.dart';
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
                            final sheetKey =
                                GlobalKey<AddEditMarkUpSheetState>();
                            showAppSheet(
                                submitButtonRequired: true,
                                onSubmitPressed: () {
                                  final body = sheetKey.currentState?.getBody();
                                  if (body != null) {
                                    context.read<SalesBloc>().add(
                                          SalesAddMarkupEvent(
                                            body: body,
                                          ),
                                        );
                                  }
                                },
                                context: context,
                                title: 'Add New Markup',
                                child: AddEditMarkUpSheet(key: sheetKey));
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
                            return ListView(
                              children: [
                                ...state.markUpData.markups!.map(
                                  (Markups e) => MyMarkUpCard(
                                    id: e.id.toString(),
                                    type: '${e.type}',
                                    product: '${e.product}',
                                    unit: '${e.fareType}',
                                    value: double.parse('${e.value}'),
                                    createdBy:
                                        '${e.owner?.firstName} ${e.owner?.lastName}',
                                    status: e.isActive ?? false
                                        ? 'active'
                                        : 'inActive',
                                    onEdit: () {
                                      final sheetKey =
                                          GlobalKey<AddEditMarkUpSheetState>();
                                      showAppSheet(
                                        submitButtonRequired: true,
                                        submitButtonTitle: 'Update',
                                        onSubmitPressed: () {
                                          final body =
                                              sheetKey.currentState?.getBody();
                                          if (body != null && e.id != null) {
                                            context.read<SalesBloc>().add(
                                                  SalesUpdateMarkupEvent(
                                                    id: e.id!,
                                                    body: body,
                                                  ),
                                                );
                                          }
                                        },
                                        context: context,
                                        title: 'Edit Markup',
                                        child: AddEditMarkUpSheet(
                                          key: sheetKey,
                                          id: e.id,
                                          initialType: e.type,
                                          initialProduct: e.product,
                                          initialUnit: e.fareType,
                                          initialValue: e.value != null
                                              ? double.tryParse(e.value!)
                                              : null,
                                          initialStatus: e.isActive ?? false
                                              ? 'active'
                                              : 'inactive',
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
                                          if (e.id != null) {
                                            context.read<SalesBloc>().add(
                                                  DeleteMarkupEvent(
                                                    id: e.id!,
                                                  ),
                                                );
                                          }
                                        },
                                      );
                                    },
                                  ),
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
