import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../models/flights_data_model.dart';

class FlightCardWidget extends StatelessWidget {
  const FlightCardWidget(
      {super.key,
      required this.data,
      this.isFavIconRequired,
      this.isOnWishList,
      this.onWishListTap,
      this.dictionaries,
      required this.onTap,
      this.customWidth});
  final Datam data;
  final FlightDictionary? dictionaries;
  final bool? isOnWishList;
  final double? customWidth;
  final bool? isFavIconRequired;
  final Function()? onWishListTap;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final double width = AppHelpers.getScreenWidth(context);
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: ClipPath(
        clipper: TicketClipper(),
        child: Container(
          height: 250,
          width: width * 0.95,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 45,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                      width: AppHelpers.getScreenWidth(context) * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage(
                                  'assets/images/airlines/${data.itineraries?.first.segments?.first.carrierCode}.png'),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              dictionaries?.dictionaries.carriers![
                                      '${data.itineraries?.first.segments?.first.carrierCode}'] ??
                                  'NO-NAME',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 25,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: getColorByStatus('fastest').withOpacity(0.3),
                          ),
                          child: Text(
                            '${data.numberOfBookableSeats} seats available'
                                .toUpperCase(),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: getColorByStatus('fastest'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                        height: 90,
                        width: customWidth ?? width * 0.22,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                                data.itineraries?.first.segments?.first
                                        .departure?.iataCode ??
                                    'NO_CODE',
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600)),
                            Text(
                              AppHelpers.formatDateTime(
                                DateTime.parse(
                                  data.itineraries?.first.segments?.first
                                          .departure?.at ??
                                      DateTime.now().toString(),
                                ),
                                pattern: 'dd MMM, yyyy',
                              ),
                              style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.grey),
                            ),
                            //time
                            Text(
                              AppHelpers.formatDateTime(
                                  DateTime.parse(
                                    data.itineraries?.first.segments?.first
                                            .departure?.at ??
                                        DateTime.now().toString(),
                                  ),
                                  pattern: 'hh:mm:aa'),
                              style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.grey),
                            )
                          ],
                        )),
                    SizedBox(
                        width: customWidth ?? width * 0.22,
                        child: Column(
                          children: <Widget>[
                            AppHelpers.svgAsset(
                                assetName: 'flight', width: 100),
                            Column(
                              children: <Widget>[
                                Text(
                                  getDuration(
                                      duration:
                                          data.itineraries?.first.duration ??
                                              ''),
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                Divider(
                                  thickness: 0.5,
                                  color: AppColors.primary.withOpacity(0.3),
                                ),
                                Text(
                                  data.itineraries?.first.segments?.length == 1
                                      ? 'Non-Stop'
                                      : '${(data.itineraries!.first.segments!.length - 1)} Stop(s)',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 90,
                      width: customWidth ?? width * 0.22,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                              data.itineraries?.first.segments?.last.arrival
                                      ?.iataCode ??
                                  'NO_CODE',
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600)),
                          Text(
                            AppHelpers.formatDateTime(
                              DateTime.parse(
                                data.itineraries?.first.segments?.last.arrival
                                        ?.at ??
                                    DateTime.now().toString(),
                              ),
                              pattern: 'dd MMM, yyyy',
                            ),
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: AppColors.grey),
                          ),
                          Text(
                            AppHelpers.formatTime(
                                DateTime.parse(
                                  data.itineraries?.first.segments?.last.arrival
                                          ?.at ??
                                      DateTime.now().toString(),
                                ),
                                pattern: 'hh:mm:aa'),
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: AppColors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              DottedBorder(
                  dashPattern: const <double>[8, 4],
                  customPath: (Size size) => Path()
                    ..moveTo(0, size.height)
                    ..relativeLineTo(size.width, 0),
                  color: AppColors.grey,
                  strokeWidth: 0.5,
                  child: const SizedBox(height: 1, width: double.infinity)),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Cabin Class',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                      ),
                    ),
                    Text(
                      'Price | ${data.itineraries!.length > 1 ? 'Round Trip' : 'One Way'}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      data.travelerPricings?.first.fareDetailsBySegment?.first
                              .cabin ??
                          'NO_CABIN',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '₹${data.price?.markupPrice ?? 0.00}',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color getColorByStatus(String status) {
  switch (status.toLowerCase().trim()) {
    case 'best value':
      return AppColors.success;
    case 'cheapest':
      return AppColors.primary;
    case 'fastest':
      return AppColors.warning;
    case 'non-stop':
      return AppColors.info;
    case 'direct':
      return AppColors.info;
    case 'popular':
      return AppColors.primary;
    default:
      return AppColors.primary;
  }
}

getDuration({required String duration}) {
  //input PT6H35M
  duration = duration.replaceAll('PT', '');
  final String hr = duration.split('H')[0].trim();
  final String mn = duration.split('H')[1].split('M')[0].trim();

  return '${hr}H ${mn}M';
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
        Rect.fromCircle(center: Offset(0.0, size.height / 1.5), radius: 20.0));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 1.5), radius: 20.0));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
