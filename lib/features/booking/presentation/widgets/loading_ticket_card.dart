import 'package:flutter/material.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../utils/app_helpers.dart';

class LoadingTicketCard extends StatelessWidget {
  const LoadingTicketCard({super.key});

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: LoadingEffect(
          radius: 28,
          height: 220,
          width: AppHelpers.getScreenWidth(context) * 0.95,
        ),
      );
}
