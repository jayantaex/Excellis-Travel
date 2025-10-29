import 'package:excellistravel/core/constants/app_styles.dart';
import 'package:excellistravel/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class AirportCardLoadingWidget extends StatelessWidget {
  const AirportCardLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: AppColors.grey,
      title: LoadingEffect(height: 20, width: 80),
      leading: LoadingEffect(height: 40, width: 40),
      subtitle: LoadingEffect(height: 20, width: 120),
    );
  }
}
