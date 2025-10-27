import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';

class AppCustomAppbar extends StatelessWidget {
  final Function? onBackClicked;
  final Function? onMoreClicked;
  final Widget? trailing;
  final String? start;
  final String? end;
  final String? centerTitle;
  final bool? isBackButtonRequired;

  const AppCustomAppbar(
      {super.key,
      this.onBackClicked,
      this.onMoreClicked,
      this.trailing,
      this.start,
      this.end,
      this.isBackButtonRequired = true,
      this.centerTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isBackButtonRequired ?? true
              ? CircleAvatar(
                  backgroundColor: AppColors.black.withOpacity(0.1),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: AppColors.white,
                    ),
                  ),
                )
              : const SizedBox(),
          SizedBox(
              width: AppHelpers.getScreenWidth(context) * 0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: centerTitle == null
                    ? [
                        const Text('CKG',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppHelpers.svgAsset(assetName: 'appBarFlight'),
                        ),
                        const Text('NTR',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white)),
                      ]
                    : [
                        Text(centerTitle!,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white)),
                      ],
              )),
          trailing ?? const SizedBox()
        ],
      ),
    );
  }
}
