import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../core/constants/app_styles.dart';
import '../core/network/api_urls.dart';

Widget getAirlineLogo({required String airlineCode}) {
  final String imageUrl = '${EndPoints.airlineLogoUrl}$airlineCode.png';
  return CachedNetworkImage(
    imageUrl: imageUrl,
    fit: BoxFit.fill,
    placeholder: (context, url) => const Center(
      child: SizedBox(
        height: 16,
        width: 16,
        child: CircularProgressIndicator(
          color: AppColors.grey,
          strokeWidth: 2,
        ),
      ),
    ),
    errorWidget: (context, url, error) => const Icon(
      Icons.error,
      color: AppColors.error,
      size: 16,
    ),
  );
}
