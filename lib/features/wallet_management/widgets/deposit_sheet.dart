import 'package:flutter/material.dart';

import '../../../core/constants/app_styles.dart';
import '../../../core/widgets/primary_input.dart';
import '../../../utils/app_helpers.dart';

class DepositSheet extends StatelessWidget {
  DepositSheet({super.key, required this.amountController});
  final TextEditingController amountController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<int> _amountList = [5000, 7000, 10000, 20000];

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Form(
            key: _formKey,
            child: AppPrimaryInput(
              maxCharacters: 5,
              label: 'Amount',
              hint: 'Enter amount',
              keyboardType: TextInputType.number,
              controller: amountController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Amount is required';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: AppHelpers.getScreenWidth(context),
            child: Wrap(
              children: [
                ..._amountList.map(
                  (amount) => InkWell(
                    onTap: () {
                      amountController.text = amount.toString();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      margin: const EdgeInsets.all(8),
                      child: Text(
                        '$amount',
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      );
}
