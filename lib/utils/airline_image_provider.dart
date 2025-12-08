import 'package:cached_network_image/cached_network_image.dart';
import 'package:excellistravel/core/network/api_urls.dart';
import 'package:flutter/material.dart';

Widget getAirlineLogo({required String airlineCode}) {
  // /kp6vc3sud/ExTravel/logos/airlines-logos/0B.png
  final String imageUrl =
      '${EndPoints.airlineLogoUrl}/kp6vc3sud/ExTravel/logos/airlines-logos/$airlineCode.png';
  return CachedNetworkImage(
    imageUrl: imageUrl,
    fit: BoxFit.fill,
    placeholder: (context, url) => const Center(
      child: CircularProgressIndicator(),
    ),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
