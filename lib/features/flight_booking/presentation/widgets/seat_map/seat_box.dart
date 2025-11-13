import 'package:flutter/material.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../models/seat_map_data_model.dart';

class SeatBox extends StatefulWidget {

  const SeatBox({super.key, this.data});
  final SeatElement? data;

  @override
  State<SeatBox> createState() => _SeatBoxState();
}

class _SeatBoxState extends State<SeatBox> {
  List<String> selectedSeat = [];
  @override
  Widget build(BuildContext context) {
    final bool isBlocked = widget.data?.travelerPricing[0].seatAvailabilityStatus ==
        SeatAvailabilityStatus.BLOCKED;
    final int allowedToSelect = widget.data?.travelerPricing.length ?? 0;
    return SizedBox(
      height: AppHelpers.getScreenWidth(context) * 0.12,
      width: AppHelpers.getScreenWidth(context) * 0.12,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              if (!isBlocked) {
                if (allowedToSelect == selectedSeat.length) {
                  return;
                }
                if (selectedSeat.contains(widget.data!.number)) {
                  selectedSeat.remove(widget.data!.number);
                } else {
                  selectedSeat.add(widget.data!.number);
                }
                setState(() {});
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: isBlocked
                    ? AppColors.grey
                    : selectedSeat.contains(widget.data?.number)
                        ? AppColors.primary
                        : AppColors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              height: AppHelpers.getScreenWidth(context) * 0.09,
              width: AppHelpers.getScreenWidth(context) * 0.09,
              child: selectedSeat.contains(widget.data?.number)
                  ? const Icon(Icons.done_rounded,
                      size: 18, color: AppColors.white)
                  : null,
            ),
          ),
          Text(
            '${widget.data?.number}',
            style: const TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
