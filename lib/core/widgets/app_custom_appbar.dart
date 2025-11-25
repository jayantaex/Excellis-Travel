import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';

class AppCustomAppbar extends StatelessWidget {
  const AppCustomAppbar(
      {super.key,
      this.onBackClicked,
      this.onMoreClicked,
      this.trailing,
      this.start,
      this.end,
      this.isBackButtonRequired = true,
      this.centerTitle});
  final Function? onBackClicked;
  final Function? onMoreClicked;
  final Widget? trailing;
  final String? start;
  final String? end;
  final String? centerTitle;
  final bool? isBackButtonRequired;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            isBackButtonRequired ?? true
                ? CircleAvatar(
                    backgroundColor: AppColors.white.withOpacity(0.2),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ),
                  )
                : const SizedBox(
                    width: 45,
                  ),
            SizedBox(
                width: AppHelpers.getScreenWidth(context) * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: centerTitle == null
                      ? <Widget>[
                          Text(start ?? '',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                AppHelpers.svgAsset(assetName: 'appBarFlight'),
                          ),
                          Text(end ?? '',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white)),
                        ]
                      : <Widget>[
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
