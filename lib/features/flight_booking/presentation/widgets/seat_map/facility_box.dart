import 'package:flutter/material.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../data/models/seat_map_data_model.dart';

class FacilityBox extends StatelessWidget {
  const FacilityBox({super.key, required this.facilityCode});
  final FacilityCode facilityCode;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: AppHelpers.getScreenWidth(context) * 0.12,
        width: AppHelpers.getScreenWidth(context) * 0.12,
        child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.facility,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          height: AppHelpers.getScreenWidth(context) * 0.09,
          width: AppHelpers.getScreenWidth(context) * 0.09,
          child: Text(
            facilityCode.name,
            style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: AppColors.white),
          ),
        ),
      );
}
