import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppHelpers.getScreenWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: AppHelpers.getScreenWidth(context) * 0.8,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Morning, Raghunath',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white),
                ),
                Text(
                  'Let’s Explore \nWorld With Us !',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                )
              ],
            ),
          ),
          CircleAvatar(
            backgroundColor: AppColors.white.withOpacity(0.2),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_rounded)),
          )
        ],
      ),
    );
  }
}
