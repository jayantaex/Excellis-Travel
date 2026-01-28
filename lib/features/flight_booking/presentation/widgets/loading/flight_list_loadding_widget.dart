import 'package:flutter/material.dart';
import '../../../../../utils/app_helpers.dart';
import '../../../../../core/widgets/app_custom_appbar.dart';
import '../../../../../core/widgets/loading_effect.dart';

class FlightListLoadingWidget extends StatelessWidget {
  const FlightListLoadingWidget(
      {super.key, required this.arrival, required this.departure});
  final String arrival;
  final String departure;

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: AppCustomAppbar(
              start: departure,
              end: arrival,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: SizedBox(
              height: 70,
              width: AppHelpers.percentWidth(context: context),
              child: ListView.builder(
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: LoadingEffect(
                    height: 70,
                    width: 60,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: SizedBox(
              height: 50,
              width: AppHelpers.percentWidth(context: context),
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: LoadingEffect(
                    radius: 50,
                    height: 45,
                    width: 120,
                  ),
                ),
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
                itemBuilder: (BuildContext context, int index) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: LoadingEffect(
                    radius: 24,
                    height: 245,
                    width: AppHelpers.getScreenWidth(context),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
