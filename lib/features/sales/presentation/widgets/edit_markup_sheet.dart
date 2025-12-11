import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/app_drop_down.dart';
import '../../../../core/widgets/primary_input.dart';

class AddEditMarkUpSheet extends StatefulWidget {
  const AddEditMarkUpSheet({
    super.key,
    this.id,
    this.initialType,
    this.initialProduct,
    this.initialUnit,
    this.initialValue,
    this.initialStatus,
  });
  final int? id;
  final String? initialType;
  final String? initialProduct;
  final String? initialUnit;
  final double? initialValue;
  final String? initialStatus;

  @override
  State<AddEditMarkUpSheet> createState() => AddEditMarkUpSheetState();
}

class AddEditMarkUpSheetState extends State<AddEditMarkUpSheet> {
  late String selectedType;
  late String selectedProduct;
  late String selectedUnit;
  late String selectedStatus;
  late TextEditingController valueController;

  @override
  void initState() {
    super.initState();
    selectedType = widget.initialType ?? 'Domestic';
    selectedProduct = widget.initialProduct ?? 'Airline';
    selectedUnit = widget.initialUnit ?? 'Percentage';
    selectedStatus = widget.initialStatus ?? 'active';
    valueController = TextEditingController(
      text: widget.initialValue?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppDropDown(
              title: 'Type',
              value: selectedType,
              label: 'Select Type',
              items: const [
                DropdownMenuItem(value: 'Domestic', child: Text('Domestic')),
                DropdownMenuItem(
                    value: 'International', child: Text('International')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedType = value;
                  });
                }
              },
            ),

            const SizedBox(height: AppSizes.md),

            AppDropDown(
              title: 'Product',
              value: selectedProduct,
              label: 'Select Product',
              items: const [
                DropdownMenuItem(value: 'Airline', child: Text('Airline')),
                // DropdownMenuItem(value: 'Hotel', child: Text('Hotel')),
                // DropdownMenuItem(value: 'Bus', child: Text('Bus')),
                // DropdownMenuItem(value: 'Train', child: Text('Train')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedProduct = value;
                  });
                }
              },
            ),

            const SizedBox(height: AppSizes.md),

            AppDropDown(
              title: 'Unit',
              value: selectedUnit,
              label: 'Select Unit',
              items: const [
                DropdownMenuItem(
                    value: 'Percentage', child: Text('Percentage')),
                DropdownMenuItem(value: 'Fixed', child: Text('Fixed')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedUnit = value;
                  });
                }
              },
            ),

            const SizedBox(height: AppSizes.md),

            // Value Input

            AppPrimaryInput(
              controller: valueController,
              label: selectedUnit == 'Percentage'
                  ? 'Commission Percentage'
                  : 'Commission Amount',
              hint: selectedUnit == 'Percentage'
                  ? 'Enter percentage (e.g., 3.45)'
                  : 'Enter amount (e.g., 250.00)',
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              maxCharacters: 10,
              prefixIcon: Icon(
                selectedUnit == 'Percentage'
                    ? Icons.percent_rounded
                    : Icons.currency_rupee_rounded,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: AppSizes.md),

            // Status Dropdown

            AppDropDown(
              title: 'Status',
              value: selectedStatus,
              label: 'Select Status',
              items: const [
                DropdownMenuItem(value: 'active', child: Text('Active')),
                DropdownMenuItem(value: 'inactive', child: Text('Inactive')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedStatus = value;
                  });
                }
              },
            ),

            const SizedBox(height: AppSizes.md),

            // Info Card
            Container(
              padding: const EdgeInsets.all(AppSizes.md),
              decoration: BoxDecoration(
                color: AppColors.info.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                border: Border.all(
                  color: AppColors.info.withOpacity(0.3),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline_rounded,
                    color: AppColors.info,
                    size: AppSizes.iconSm,
                  ),
                  const SizedBox(width: AppSizes.sm),
                  Expanded(
                    child: Text(
                      selectedUnit == 'Percentage'
                          ? 'Commission will be calculated as a percentage of the booking amount'
                          : 'Commission will be a fixed amount per booking',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.info,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSizes.lg),
          ],
        ),
      );

  Map<String, dynamic> getBody() => {
        'product': selectedProduct,
        'type': selectedType,
        'operator': ['All'],
        'fareType': selectedUnit,
        'value': valueController.text,
        'isActive': selectedStatus == 'active',
        'currency': 'INR',
        'forRole': 'self'
      };
}
