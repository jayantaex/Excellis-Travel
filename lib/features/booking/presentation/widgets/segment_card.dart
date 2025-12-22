import 'package:excellistravel/utils/title_case.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart' show AppColors;
import '../../../../utils/airline_image_provider.dart' show getAirlineLogo;
import '../../../../utils/airline_info_provider.dart' show AirlineInfoProvider;
import '../../../../utils/app_helpers.dart' show AppHelpers;
import '../../../../utils/get_duration.dart';
import '../../data/models/ticket_model.dart';

class SegmentCard extends StatelessWidget {
  const SegmentCard({super.key, required this.data});
  final Segment data;

  @override
  Widget build(BuildContext context) {
    final bool isDark = AppHelpers.isDarkMode(context);
    return ExpansionTile(
      collapsedShape: const Border(),
      shape: const Border(),
      tilePadding: const EdgeInsets.all(0),
      childrenPadding: const EdgeInsets.all(0),
      leading: SizedBox(
        width: 50,
        child: getAirlineLogo(airlineCode: data.carrierCode!),
      ),
      title: AirlineNameCard(
          airlineCode: data.carrierCode!, duration: data.duration!),
      subtitle: data.aircraft?.code != null
          ? Text(
              '${data.number} | ${data.aircraft?.code}',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: isDark
                    ? AppColors.white.withValues(alpha: 0.7)
                    : AppColors.grey,
              ),
            )
          : Text(
              '${data.number} ',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: isDark
                    ? AppColors.white.withValues(alpha: 0.7)
                    : AppColors.grey,
              ),
            ),
      children: <Widget>[
        ListTile(
          leading: AppHelpers.svgAsset(
              assetName: 'from',
              isIcon: true,
              color: isDark ? AppColors.white : null),
          title: Text(
            'Departure ',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: isDark ? AppColors.white : AppColors.black),
          ),
          subtitle: Text(
            AppHelpers.formatDateTime(DateTime.parse(data.departure?.at ?? ''),
                pattern: 'dd MMM, yyyy | hh:mm'),
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: isDark
                    ? AppColors.white.withValues(alpha: 0.9)
                    : AppColors.black
                // color: AppColors.grey
                ),
          ),
          trailing: Text(
            '${data.departure?.iataCode}',
            style: TextStyle(
                color: isDark ? AppColors.white : AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w700),
          ),
        ),
        ListTile(
          leading: AppHelpers.svgAsset(
              assetName: 'from',
              isIcon: true,
              color: isDark ? AppColors.white : null),
          title: Text('Arrival',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: isDark ? AppColors.white : AppColors.black)),
          subtitle: Text(
            AppHelpers.formatDateTime(DateTime.parse(data.arrival?.at ?? ''),
                pattern: 'dd MMM, yyyy | hh:mm'),
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: isDark
                    ? AppColors.white.withValues(alpha: 0.9)
                    : AppColors.black
                // color: AppColors.grey
                ),
          ),
          trailing: Text(
            '${data.arrival?.iataCode}',
            style: TextStyle(
                color: isDark ? AppColors.white : AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}

class AirlineNameCard extends StatefulWidget {
  const AirlineNameCard(
      {super.key, required this.airlineCode, required this.duration});
  final String airlineCode;
  final String duration;

  @override
  State<AirlineNameCard> createState() => _AirlineNameCardState();
}

class _AirlineNameCardState extends State<AirlineNameCard> {
  AirlineInfoProvider airlineInfoProvider = AirlineInfoProvider();
  String _airlineName = 'Loading...';
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      _airlineName = await airlineInfoProvider.getAirlineName(
          airlineCode: widget.airlineCode);
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = AppHelpers.isDarkMode(context);
    return Text(
      '${toTitleCase(_airlineName)} -  ${formatIsoDuration(widget.duration)}',
      style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: isDark ? AppColors.white : AppColors.black),
    );
  }
}
