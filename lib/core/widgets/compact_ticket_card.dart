import 'package:flutter/material.dart';

import 'package:ticket_widget/ticket_widget.dart';

import '../../features/flight_booking/models/ticket_data_model.dart';
import '../constants/app_styles.dart';
import '../utils/app_helpers.dart';

class CompactTicketCard extends StatelessWidget {
  final TicketModel data;
  final bool? isOnWishList;
  final bool? isFavIconRequired;
  final Function()? onWishListTap;
  final Function() onTap;
  const CompactTicketCard(
      {super.key,
      required this.data,
      this.isFavIconRequired,
      this.isOnWishList,
      this.onWishListTap,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    double width = AppHelpers.getScreenWidth(context);
    return InkWell(
      onTap: onTap,
      child: TicketWidget(
        height: 200,
        width: width * 0.85,
        isCornerRounded: true,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        child: Column(
          children: [
            SizedBox(
              height: 45,
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    height: 16,
                    width: 40,
                    color: AppColors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      data.tag != null
                          ? Container(
                              margin: const EdgeInsets.only(right: 10),
                              height: 25,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: getColorByStatus(data.tag!)
                                    .withOpacity(0.3),
                              ),
                              child: Text(
                                data.tag!.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: getColorByStatus(data.tag!),
                                ),
                              ),
                            )
                          : const SizedBox(),
                      isFavIconRequired ?? false
                          ? InkWell(
                              onTap: onWishListTap,
                              child: CircleAvatar(
                                backgroundColor:
                                    AppColors.grey.withOpacity(0.1),
                                radius: 18,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: isOnWishList ?? false
                                      ? const Icon(Icons.favorite_rounded,
                                          color: AppColors.error, size: 18)
                                      : const Icon(
                                          Icons.favorite_border_rounded,
                                          color: AppColors.black,
                                          size: 18),
                                ),
                              ),
                            )
                          : SizedBox()
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 60,
                      width: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.start!,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w600)),
                          Text(
                            AppHelpers.formatDateTime(DateTime.now(),
                                pattern: 'dd MMM, yyyy'),
                            style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: AppColors.grey),
                          ),
                        ],
                      )),
                  SizedBox(
                      width: 100,
                      child: Column(
                        children: [
                          AppHelpers.svgAsset(assetName: 'flight', width: 100),
                          Text(
                            getDuration(min: data.duration!),
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 60,
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(data.end!,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600)),
                        Text(
                          AppHelpers.formatDateTime(DateTime.now(),
                              pattern: 'dd MMM, yyyy'),
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
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Seat Class',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                    ),
                  ),
                  Text(
                    'Cost',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Business Class',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '\$500',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
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

getDuration({required int min}) {
  String hours = (min / 60).floor().toString();
  String minutes = (min % 60).toString();
  return '${hours}h ${minutes}m';
}
