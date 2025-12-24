import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../utils/airline_image_provider.dart';
import '../../../../utils/app_helpers.dart';
import '../../data/models/ticket_model.dart';
import '../../booking_module.dart';

class TicketWidget extends StatefulWidget {
  const TicketWidget({super.key, this.isLast, this.ticketData});
  final bool? isLast;
  final Booking? ticketData;

  @override
  State<TicketWidget> createState() => _TicketWidgetState();
}

class _TicketWidgetState extends State<TicketWidget> {
  @override
  Widget build(BuildContext context) {
    final double width = AppHelpers.getScreenWidth(context);
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        context.pushNamed(
          BookingModule.ticketDetails,
          extra: widget.ticketData,
        );
      },
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: ClipPath(
              clipper: TicketClipper(),
              child: Container(
                decoration: BoxDecoration(
                  color: AppHelpers.isDarkMode(context)
                      ? AppColors.secondaryDark
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
                height: 250,
                width: width * 0.95,
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
                                  SizedBox(
                                    height: 40,
                                    width: 65,
                                    child: getAirlineLogo(
                                        airlineCode: widget
                                                .ticketData
                                                ?.flightData
                                                ?.itineraries
                                                ?.first
                                                .segments
                                                ?.first
                                                .carrierCode ??
                                            ''),
                                  ),
                                  const SizedBox(width: 5),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: getColorByStatus(
                                          widget.ticketData?.bookingStatus ??
                                              '')
                                      .withValues(alpha: 0.1),
                                ),
                                child: Text(
                                  (widget.ticketData?.bookingStatus ?? '')
                                      .toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    color: getColorByStatus(
                                      widget.ticketData?.bookingStatus ?? '',
                                    ),
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
                            width: width * 0.22,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                    '${widget.ticketData?.flightData?.itineraries?.first.segments?.first.departure?.iataCode}',
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600)),
                                Text(
                                  AppHelpers.formatDateTime(
                                    DateTime.parse(
                                        '${widget.ticketData?.flightData?.itineraries?.first.segments?.first.departure?.at}'),
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
                                        '${widget.ticketData?.flightData?.itineraries?.first.segments?.first.departure?.at}',
                                      ),
                                      pattern: 'hh:mm:aa'),
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grey),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                              width: width * 0.22,
                              child: Column(
                                children: <Widget>[
                                  AppHelpers.svgAsset(
                                      assetName: 'flight', width: 100),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        widget.ticketData?.flightData
                                                    ?.itineraries?.length ==
                                                2
                                            ? 'ROUND TRIP'
                                            : 'ONE WAY',
                                        style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Divider(
                                        thickness: 0.5,
                                        color: AppColors.primary
                                            .withValues(alpha: 0.3),
                                      ),
                                      widget.ticketData?.flightData?.itineraries
                                                  ?.first.segments?.length ==
                                              1
                                          ? const Text('Non Stop',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400))
                                          : Text(
                                              '${(widget.ticketData?.flightData?.itineraries?.first.segments?.length ?? 0) - 1} stops',
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
                            width: width * 0.22,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                    '${widget.ticketData?.flightData?.itineraries?.first.segments?.last.arrival?.iataCode}',
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600)),
                                Text(
                                  AppHelpers.formatDateTime(
                                    DateTime.parse(
                                        '${widget.ticketData?.flightData?.itineraries?.first.segments?.last.arrival?.at}'),
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
                                        '${widget.ticketData?.flightData?.itineraries?.first.segments?.last.arrival?.at}',
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
                        options: CustomPathDottedBorderOptions(
                          customPath: (Size size) => Path()
                            ..moveTo(0, size.height)
                            ..relativeLineTo(size.width, 0),
                          dashPattern: <double>[5, 5],
                          color: AppColors.grey.withValues(alpha: 0.5),
                        ),
                        child:
                            const SizedBox(height: 1, width: double.infinity)),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            'Booking ID',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              const Text(
                                'Price',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.grey),
                              ),
                              Text(
                                (widget.ticketData?.paymentStatus == 'paid') &&
                                        (widget.ticketData?.bookingStatus ==
                                            'cancelled')
                                    ? ' (Refund in Progress)'
                                    : ' (${widget.ticketData?.paymentStatus ?? 'Pending'})',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: (widget.ticketData?.paymentStatus ==
                                              'paid') &&
                                          (widget.ticketData?.bookingStatus ==
                                              'cancelled')
                                      ? AppColors.info
                                      : widget.ticketData?.paymentStatus ==
                                              'paid'
                                          ? AppColors.success
                                          : AppColors.warning,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                            width: AppHelpers.getScreenWidth(context) * 0.6,
                            child: Row(
                              children: [
                                Text(
                                  widget.ticketData?.bookingReference ?? '',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 45,
                                  height: 40,
                                  child: IconButton(
                                      onPressed: () {
                                        Clipboard.setData(ClipboardData(
                                          text: widget.ticketData
                                                  ?.bookingReference ??
                                              '',
                                        ));
                                      },
                                      icon: const Icon(
                                        Icons.copy,
                                        color: AppColors.grey,
                                        size: 12,
                                      )),
                                )
                              ],
                            ),
                          ),
                          Text(
                            '₹${widget.ticketData?.totalAmount ?? 0.00}',
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
          ),
          widget.isLast ?? false
              ? const Padding(
                  padding: EdgeInsets.only(top: 12, bottom: 40),
                  child: CircularProgressIndicator.adaptive(),
                )
              : const SizedBox()
        ],
      ),
    );
  }
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

Color getColorByStatus(String status) {
  switch (status.toLowerCase().trim()) {
    case 'confirmed':
      return AppColors.success;

    case 'pending':
      return AppColors.warning;
    default:
      return AppColors.error;
  }
}
