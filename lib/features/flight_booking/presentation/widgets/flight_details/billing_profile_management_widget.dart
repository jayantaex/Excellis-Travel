import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/common/bloc/cities/city_bloc.dart';
import '../../../../../core/common/bloc/states/states_bloc.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/widgets/app_sheet.dart';
import '../../../../profile_management/bloc/profile_bloc.dart';
import '../../../data/dto/billing_address_model.dart';
import 'billing_sheet.dart';

class BillingProfileManagementWidget extends StatefulWidget {
  const BillingProfileManagementWidget(
      {super.key, this.billingAddress, required this.onBillingAddressChange});
  final BillingAddressModel? billingAddress;
  final Function(BillingAddressModel) onBillingAddressChange;

  @override
  State<BillingProfileManagementWidget> createState() =>
      _BillingProfileManagementWidgetState();
}

class _BillingProfileManagementWidgetState
    extends State<BillingProfileManagementWidget> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        context.read<ProfileBloc>().add(const LoadProfileEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.person)),
      title: Text(
        '${widget.billingAddress?.firstName} ${widget.billingAddress?.lastName}',
        style: TextStyle(
          color: isDark ? AppColors.white : AppColors.textPrimary,
        ),
      ),
      subtitle: (widget.billingAddress?.email.isNotEmpty ?? false)
          ? Text(
              widget.billingAddress?.email ?? '',
              style: TextStyle(
                color: isDark
                    ? AppColors.white.withValues(alpha: 0.7)
                    : AppColors.textSecondary,
              ),
            )
          : const Text(''),
      trailing: InkWell(
        onTap: () {
          showAppSheet(
            context: context,
            title: 'Billing Information',
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: context.read<StatesBloc>()),
                BlocProvider.value(value: context.read<CityBloc>()),
              ],
              child: BillingSheet(
                billingProfile: widget.billingAddress,
                onSavePressed: (billingProfile) {
                  widget.onBillingAddressChange(billingProfile);
                  context.pop();
                },
              ),
            ),
          );
        },
        child: const Icon(
          Icons.mode_edit_rounded,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
