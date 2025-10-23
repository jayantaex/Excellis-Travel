import 'package:flutter/material.dart';
import 'package:reiselab/core/constants/app_styles.dart';

import '../../../../core/widgets/trans_white_bg_widget.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.transparent,
      body: TransWhiteBgWidget(
        child: Center(child: Text('TICKET SCREEN')),
      ),
    );
  }
}
