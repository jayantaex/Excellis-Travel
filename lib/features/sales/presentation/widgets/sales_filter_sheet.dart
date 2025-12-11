import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_dropdown/multi_dropdown.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/multi_drop_down_widget.dart';
import '../../../../utils/app_date_picker.dart';
import '../../../../utils/app_helpers.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/primary_input.dart';
import '../../bloc/sales_bloc.dart';
import '../screens/child_data_model.dart';
import 'sub_sales_executive_selector.dart';

class SalesFilterSheet extends StatefulWidget {
  const SalesFilterSheet({
    super.key,
    required this.role,
    required this.bookingIdController,
    required this.startDateController,
    required this.endDateController,
    required this.onStartDatePicked,
    required this.onEndDatePicked,
    required this.onSubmitPressed,
  });

  final TextEditingController bookingIdController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;
  final Function(DateTime) onStartDatePicked;
  final Function(DateTime) onEndDatePicked;
  final Function(List<int>? agentIds, String? userType) onSubmitPressed;
  final String role;
  @override
  State<SalesFilterSheet> createState() => _SalesFilterSheetState();
}

class _SalesFilterSheetState extends State<SalesFilterSheet> {
  DateTime? startDate;
  DateTime? endDate;
  String _errorMessage = '';
  List<ChildDataModel>? _subSalesExecutives;
  List<ChildDataModel>? _selectedSubSalesExecutives;
  List<ChildDataModel>? _agents;
  List<ChildDataModel>? _selectedAgents;

  final TextEditingController _subSalesExecutiveController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        if (widget.role != 'agent') {
          context.read<SalesBloc>().add(const LoadSubSalesExecutivesEvent());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<SalesBloc, SalesState>(
        listener: (context, state) {
          // Store sub sales executives when loaded
          if (state is SubSalesExecutivesLoaded) {
            _subSalesExecutives = state.subSalesExecutives;
          }
          // Store agents when loaded
          if (state is SalesAgentsLoaded) {
            _agents = state.agents;
          }
        },
        builder: (context, state) {
          if (state is LoadingSubSalesExecutives) {
            return SizedBox(
              height: 150,
              width: AppHelpers.getScreenWidth(context),
              child: const Center(
                child: SizedBox(
                  height: 35,
                  width: 35,
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                    strokeWidth: 2,
                  ),
                ),
              ),
            );
          }
          return SizedBox(
            width: AppHelpers.getScreenWidth(context),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  child: AppPrimaryInput(
                    suffixIcon: IconButton(
                        onPressed: () {
                          widget.bookingIdController.clear();
                        },
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.grey,
                          size: 16,
                        )),
                    maxCharacters: 16,
                    hint: 'Enter your booking reference id',
                    label: 'Booking Reference ID',
                    controller: widget.bookingIdController,
                  ),
                ),
                SizedBox(height: widget.role != 'agent' ? 8 : 0),
                widget.role != 'agent'
                    ? state is LoadingSubSalesExecutives
                        ? const SizedBox(
                            height: 50,
                            child: Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                          )
                        : AppPrimaryInput(
                            controller: _subSalesExecutiveController,
                            label: 'Sub Sales Executive',
                            maxCharacters: 50,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textPrimary,
                            ),
                            isMultiline: true,
                            hint: 'Select sub sales executive',
                            onTap: () async {
                              await showSubSalesExecutiveSelector(
                                context,
                                _subSalesExecutives ?? [],
                                (selectedSubSalesExecutives) {
                                  _selectedSubSalesExecutives =
                                      selectedSubSalesExecutives;
                                  final List<int> selectedSubSalesExecutiveIds =
                                      [];
                                  _subSalesExecutiveController.text =
                                      selectedSubSalesExecutives
                                          .map((e) =>
                                              '${e.firstName} ${e.lastName}')
                                          .join(', ');

                                  for (var e in selectedSubSalesExecutives) {
                                    selectedSubSalesExecutiveIds.add(e.id ?? 0);
                                  }
                                  context.read<SalesBloc>().add(
                                        LoadAgentsEvent(
                                          agentIds:
                                              selectedSubSalesExecutiveIds,
                                        ),
                                      );
                                },
                                _selectedSubSalesExecutives ?? [],
                              );
                            },
                          )
                    : const SizedBox.shrink(),
                const SizedBox(height: 8),
                if (widget.role != 'agent')
                  state is LoadingSalesAgents
                      ? SizedBox(
                          height: 50,
                          width: AppHelpers.getScreenWidth(context),
                          child: LoadingEffect(
                              baseColor: AppColors.grey.withOpacity(0.1),
                              heighLightColor: AppColors.grey.withOpacity(0.3),
                              radius: 12,
                              height: 50,
                              width: AppHelpers.getScreenWidth(context)),
                        )
                      : state is SalesAgentsLoaded
                          ? MultiDropDownWidget<ChildDataModel>(
                              items: state.agents
                                  .map((e) => DropdownItem<ChildDataModel>(
                                      value: e,
                                      label: '${e.firstName} ${e.lastName}'))
                                  .toList(),
                              controller:
                                  MultiSelectController<ChildDataModel>(),
                              hintText: 'Select agent',
                              dialougeTitle: 'Select agent',
                              onSelectionChange: (selectedItems) {
                                _selectedAgents = selectedItems;
                                // Handle agent selection if needed
                              },
                              validator: (value) => null,
                            )
                          : const SizedBox.shrink(),
                const SizedBox(height: 8),
                SizedBox(
                  height: 50,
                  width: AppHelpers.getScreenWidth(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppHelpers.getScreenWidth(context) * 0.45,
                        height: 50,
                        child: AppPrimaryInput(
                          controller: widget.startDateController,
                          suffixIcon: const Icon(
                            Icons.calendar_month_rounded,
                            color: AppColors.grey,
                            size: 20,
                          ),
                          maxCharacters: 50,
                          hint: 'Pick up start date',
                          label: 'Start date',
                          onTap: () async {
                            final DateTime? picked = await showAppDatePicker(
                              context: context,
                              firstDate: DateTime(2025),
                              lastDate: DateTime.now(),
                              initialDate: DateTime.now(),
                            );
                            if (picked != null) {
                              startDate = picked;
                              widget.onStartDatePicked(picked);
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: AppHelpers.getScreenWidth(context) * 0.45,
                        height: 50,
                        child: AppPrimaryInput(
                          controller: widget.endDateController,
                          maxCharacters: 50,
                          hint: 'Pick up end date ',
                          label: 'End date',
                          suffixIcon: const Icon(
                            Icons.calendar_month_rounded,
                            color: AppColors.grey,
                            size: 20,
                          ),
                          onTap: () async {
                            final DateTime? picked = await showAppDatePicker(
                              context: context,
                              firstDate: DateTime(2025),
                              lastDate: DateTime.now(),
                              initialDate: DateTime.now(),
                            );
                            if (picked != null) {
                              endDate = picked;
                              widget.onEndDatePicked(picked);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                if (_errorMessage.isNotEmpty)
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    horizontalTitleGap: 0,
                    title: Text(
                      _errorMessage,
                      style: const TextStyle(
                        color: AppColors.error,
                        fontSize: 12,
                      ),
                    ),
                    leading: const Icon(
                      Icons.error_outline_outlined,
                      size: 16,
                      color: AppColors.error,
                    ),
                  ),
                SizedBox(
                  height: 50,
                  width: AppHelpers.getScreenWidth(context),
                  child: AppPrimaryButton(
                    onPressed: () {
                      // Clear previous error message
                      setState(() {
                        _errorMessage = '';
                      });

                      // Validate: At least one filter criteria must be selected
                      if (widget.bookingIdController.text.isEmpty &&
                          _selectedSubSalesExecutives == null &&
                          _selectedAgents == null &&
                          endDate == null) {
                        setState(() {
                          _errorMessage =
                              'Filter criteria is not matched. Please select at least one filter criteria.';
                        });
                        return;
                      }

                      // Validate: Booking ID must be at least 14 characters if provided
                      if (widget.bookingIdController.text.isNotEmpty &&
                          widget.bookingIdController.text.length < 14) {
                        setState(() {
                          _errorMessage =
                              'Invalid booking ID. Make sure you are entering correct booking ID';
                        });
                        return;
                      }

                      // Validate: If start date is selected, end date must also be selected
                      if (widget.startDateController.text.isNotEmpty &&
                          widget.endDateController.text.isEmpty) {
                        setState(() {
                          _errorMessage =
                              'End date is required to complete the filter.';
                        });
                        return;
                      }

                      // Validate: If end date is selected, start date must also be selected
                      if (widget.endDateController.text.isNotEmpty &&
                          widget.startDateController.text.isEmpty) {
                        setState(() {
                          _errorMessage =
                              'Start date is required to complete the filter.';
                        });
                        return;
                      }

                      // Validate: Start date must be before or equal to end date
                      if (startDate != null &&
                          endDate != null &&
                          startDate!.isAfter(endDate!)) {
                        setState(() {
                          _errorMessage =
                              'Make sure you are putting correct dates';
                        });
                        return;
                      }
                      List<int>? agentIds;
                      String? userType;
                      if (_selectedAgents != null &&
                          _selectedAgents!.isNotEmpty) {
                        agentIds =
                            _selectedAgents?.map((e) => e.id ?? 0).toList();
                        userType = 'agent';
                      } else if (_selectedSubSalesExecutives != null &&
                          _selectedSubSalesExecutives!.isNotEmpty) {
                        agentIds = _selectedSubSalesExecutives
                            ?.map((e) => e.id ?? 0)
                            .toList();
                        userType = 'partner';
                      }

                      // All validations passed
                      widget.onSubmitPressed(
                        agentIds,
                        userType,
                      );
                      Navigator.pop(context);
                    },
                    title: 'Apply',
                    isLoading: false,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      );
}
