import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_styles.dart';
import '../../../core/widgets/primary_input.dart';
import '../../../utils/app_helpers.dart';
import '../bloc/wallet_bloc.dart';

class WithdrawalSheet extends StatefulWidget {
  const WithdrawalSheet({super.key, required this.availableBalance});
  final double availableBalance;

  @override
  State<WithdrawalSheet> createState() => _WithdrawalSheetState();
}

class _WithdrawalSheetState extends State<WithdrawalSheet> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _processWithdrawal() {
    if (_formKey.currentState?.validate() ?? false) {
      final body = {
        'amount': double.parse(_amountController.text),
        'metadata': {'remarks': _descriptionController.text},
        'bank_account_details': {}
      };
      context.read<WalletBloc>().add(SubmitWithdrawalEvent(body: body));

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Available Balance
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.primary.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.account_balance_wallet_outlined,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Available Balance:',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          AppHelpers.formatCurrency(widget.availableBalance),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),
                  AppPrimaryInput(
                    prefixIcon: Icon(
                      Icons.currency_rupee,
                      size: 18,
                      color: AppHelpers.isDarkMode(context)
                          ? AppColors.white
                          : AppColors.black,
                    ),
                    maxCharacters: 9,
                    keyboardType: TextInputType.number,
                    isMultiline: false,
                    controller: _amountController,
                    hint: 'Enter amount',
                    label: 'Amount*',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an amount';
                      }
                      if (double.parse(value) <= 0) {
                        return 'Amount must be greater than 0';
                      }
                      if (double.parse(value) > widget.availableBalance) {
                        return 'Amount must be less than available balance';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 8),

                  // Description Field

                  const SizedBox(height: 8),
                  AppPrimaryInput(
                    prefixIcon: Icon(
                      Icons.description,
                      size: 18,
                      color: AppHelpers.isDarkMode(context)
                          ? AppColors.white
                          : AppColors.black,
                    ),
                    maxCharacters: 500,
                    keyboardType: TextInputType.multiline,
                    isMultiline: true,
                    controller: _descriptionController,
                    hint: 'Enter remarks',
                    label: 'Remarks*',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter remarks';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  const ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Icons.info_outline,
                      color: AppColors.warning,
                    ),
                    title: Text(
                      'Withdrawals are subject to approval and processing times.',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.warning,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _processWithdrawal,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Submit Withdrawal Request',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      );
}
