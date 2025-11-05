import 'package:flutter/material.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../../../core/widgets/loading_widget.dart';

class FlightListLoaddingWidget extends StatelessWidget {
  const FlightListLoaddingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 65),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SizedBox(
            height: 70,
            width: AppHelpers.percenWidth(context: context),
            child: ListView.builder(
              itemCount: 8,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: LoadingEffect(
                    height: 70,
                    width: 60,
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SizedBox(
            height: 50,
            width: AppHelpers.percenWidth(context: context),
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: LoadingEffect(
                    radius: 50,
                    height: 45,
                    width: 120,
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: AppHelpers.getScreenHeight(context) * 0.65,
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: LoadingEffect(
                    radius: 24,
                    height: 150,
                    width: AppHelpers.getScreenWidth(context),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
