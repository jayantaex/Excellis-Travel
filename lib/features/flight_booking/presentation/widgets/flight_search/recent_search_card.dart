// import 'package:flutter/material.dart';
// import '../../../../../core/constants/app_styles.dart';
// import '../../../../../core/utils/app_helpers.dart';
// import '../../../models/flights_data_model.dart';

// class RecentSearchCard extends StatelessWidget {
//   final FlightsDataModel? flightsData;
//   const RecentSearchCard({super.key, this.flightsData});

//   @override
//   Widget build(BuildContext context) {
//     double width = AppHelpers.getScreenWidth(context);
//     return InkWell(
//       focusColor: Colors.transparent,
//       hoverColor: Colors.transparent,
//       highlightColor: Colors.transparent,
//       splashColor: Colors.transparent,
//       onTap: () {},
//       child: Container(
//         height: 200,
//         width: width * 0.85,
//         color: Colors.white,
//         padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 45,
//               width: width,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(left: 16),
//                     height: 16,
//                     width: 40,
//                     color: AppColors.grey,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       flightsData != null
//                           ? Container(
//                               margin: const EdgeInsets.only(right: 10),
//                               height: 25,
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 10),
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(50),
//                                 color: getColorByStatus('best value')
//                                     .withOpacity(0.3),
//                               ),
//                               child: Text(
//                                 'best value'.toUpperCase(),
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   fontWeight: FontWeight.w700,
//                                   color: getColorByStatus('best value'),
//                                 ),
//                               ),
//                             )
//                           : const SizedBox(),
//                       // isFavIconRequired ?? false
//                       //     ? InkWell(
//                       //         onTap: onWishListTap,
//                       //         child: CircleAvatar(
//                       //           backgroundColor:
//                       //               AppColors.grey.withOpacity(0.1),
//                       //           radius: 18,
//                       //           child: Padding(
//                       //             padding: const EdgeInsets.all(8.0),
//                       //             child: isOnWishList ?? false
//                       //                 ? const Icon(Icons.favorite_rounded,
//                       //                     color: AppColors.error, size: 18)
//                       //                 : const Icon(
//                       //                     Icons.favorite_border_rounded,
//                       //                     color: AppColors.black,
//                       //                     size: 18),
//                       //           ),
//                       //         ),
//                       //       )
//                       //     : const SizedBox()
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 4),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 22),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(
//                       height: 60,
//                       width: width * 0.25,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             flightsData?.datam?.first.itineraries?.first
//                                     .segments?.first.departure?.iataCode ??
//                                 '',
//                             style: const TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           const Text(
//                             '',
//                             style: TextStyle(
//                                 fontSize: 11,
//                                 fontWeight: FontWeight.w500,
//                                 color: AppColors.grey),
//                           ),
//                         ],
//                       )),
//                   SizedBox(
//                       width: width * 0.25,
//                       child: Column(
//                         children: [
//                           AppHelpers.svgAsset(assetName: 'flight', width: 100),
//                           Text(
//                             getDuration(min: 150),
//                             style: const TextStyle(
//                                 fontSize: 12, fontWeight: FontWeight.w400),
//                           ),
//                         ],
//                       )),
//                   SizedBox(
//                     height: 60,
//                     width: width * 0.25,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Text(
//                             flightsData?.datam?.first.itineraries?.first
//                                     .segments?.first.arrival?.iataCode ??
//                                 '',
//                             style: const TextStyle(
//                                 fontSize: 24, fontWeight: FontWeight.w600)),
//                         const Text(
//                           '',
//                           style: TextStyle(
//                               fontSize: 11,
//                               fontWeight: FontWeight.w500,
//                               color: AppColors.grey),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const Spacer(),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 22),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Cabin Class',
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                       color: AppColors.grey,
//                     ),
//                   ),
//                   Text(
//                     'Cost',
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                       color: AppColors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 22),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Business',
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//                   ),
//                   Text(
//                     '₹500',
//                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// Color getColorByStatus(String status) {
//   switch (status.toLowerCase().trim()) {
//     case 'best value':
//       return AppColors.success;
//     case 'cheapest':
//       return AppColors.primary;
//     case 'fastest':
//       return AppColors.warning;
//     case 'non-stop':
//       return AppColors.info;
//     case 'direct':
//       return AppColors.info;
//     case 'popular':
//       return AppColors.primary;
//     default:
//       return AppColors.primary;
//   }
// }

// getDuration({required int min}) {
//   String hours = (min / 60).floor().toString();
//   String minutes = (min % 60).toString();
//   return '${hours}h ${minutes}m';
// }
