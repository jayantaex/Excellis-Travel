// import 'package:flutter/material.dart';
// import '../../../../../core/constants/app_styles.dart';
// import '../../../../../core/utils/app_helpers.dart';
// import '../../../data/models/flight_offer_price_model.dart';

// class FareCard extends StatelessWidget {
//   const FareCard({super.key, required this.data});
//   final TravelerPricing data;

//   @override
//   Widget build(BuildContext context) => Container(
//         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           color: AppColors.grey.withValues(alpha:0.05),
//           border: Border.all(
//             color: AppColors.grey.withValues(alpha:0.1),
//           ),
//         ),
//         child: Column(
//           children: <Widget>[
//             Text(
//               '${data.fareOption} ${data.travelerType} (${data.price?.currency})',
//               style: const TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             const SizedBox(height: 6),
//             ...data.fareDetailsBySegment!.map(
//               (FareDetailsBySegment e) => Container(
//                 margin: const EdgeInsets.only(bottom: 6),
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(6),
//                     color: AppColors.white),
//                 child: Column(
//                   children: <Widget>[
//                     ListTile(
//                       dense: true,
//                       contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 4, vertical: 0),
//                       visualDensity:
//                           const VisualDensity(horizontal: 0, vertical: -4),
//                       title: Text(
//                         '${e.brandedFare} - ${e.fareDetailsBySegmentClass}',
//                         style: const TextStyle(fontSize: 11),
//                       ),
//                       subtitle: Text(
//                         '${e.fareBasis} - ${e.fareDetailsBySegmentClass}',
//                         style: const TextStyle(
//                             color: AppColors.grey, fontSize: 10),
//                       ),
//                       trailing: Text(
//                         '${e.cabin}',
//                         style: const TextStyle(
//                             color: AppColors.warning,
//                             fontWeight: FontWeight.w600,
//                             fontSize: 9),
//                       ),
//                     ),
//                     FeatureCard(
//                       title: 'Check-in Baggage',
//                       iconName: 'baggage',
//                       allowance:
//                           '${e.includedCheckedBags!.weight} ${e.includedCheckedBags!.weightUnit}(1 bag only)',
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 4),
//           ],
//         ),
//       );
// }

// class FeatureCard extends StatelessWidget {
//   const FeatureCard(
//       {super.key,
//       required this.title,
//       required this.iconName,
//       required this.allowance});
//   final String title;
//   final String iconName;
//   final String allowance;

//   @override
//   Widget build(BuildContext context) => ListTile(
//         dense: true,
//         contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
//         visualDensity: const VisualDensity(vertical: -4),
//         leading: CircleAvatar(
//             radius: 14,
//             backgroundColor: AppColors.grey.withValues(alpha:0.1),
//             child: AppHelpers.svgAsset(
//                 assetName: iconName, isIcon: true, height: 16, width: 16)),
//         title: Text(
//           title,
//           style: const TextStyle(
//             fontSize: 10,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         trailing: Text(
//           allowance,
//           style: const TextStyle(
//             fontSize: 9,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//       );
// }
