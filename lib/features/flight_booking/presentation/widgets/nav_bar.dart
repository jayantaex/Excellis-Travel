import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';

class Navbar extends StatelessWidget {
  final Function onBcakClicked;
  final Function onMoreClicked;
  final Widget? trailing;
  final String? start;
  final String? end;
  final String? centerTitle;

  const Navbar(
      {super.key,
      required this.onBcakClicked,
      required this.onMoreClicked,
      this.trailing,
      this.start,
      this.end,
      this.centerTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
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
          ),
          SizedBox(
              width: AppHelpers.getScreenWidth(context) * 0.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: centerTitle == null
                    ? [
                        const Text('CKG',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: AppColors.white)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppHelpers.svgAsset(assetName: 'appBarFlight'),
                        ),
                        const Text('NTR',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: AppColors.white)),
                      ]
                    : [
                        Text(centerTitle!,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: AppColors.white)),
                      ],
              )),
          trailing ??
              CircleAvatar(
                backgroundColor: AppColors.black.withOpacity(0.1),
                child: IconButton(
                  onPressed: () {
                    onMoreClicked();
                  },
                  icon: const Icon(
                    Icons.more_horiz_sharp,
                    color: AppColors.white,
                  ),
                ),
              )
        ],
      ),
    );
  }
}
