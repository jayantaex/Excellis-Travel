// import 'dart:developer';

// import 'package:excellistravel/features/flight_booking/presentation/widgets/fare_breakdown_card.dart';
// import 'package:flutter/material.dart';
// import '../../../../core/constants/app_styles.dart';
// import '../../../../core/utils/app_helpers.dart';
// import '../../../../core/widgets/app_custom_appbar.dart';
// import '../../../../core/widgets/app_gradient_bg.dart';
// import '../../../../core/widgets/primary_button.dart';
// import '../../../../core/widgets/trans_white_bg_widget.dart';
// import '../../models/flights_data_model.dart';
// import '../../models/passenger_model.dart';
// import '../widgets/passenger_details_card.dart';

// class PassengetDetailsNew extends StatefulWidget {
//   final Datam data;
//   final FlightDictionary flightDictionary;
//   final String selectedPlan;
//   const PassengetDetailsNew({
//     super.key,
//     required this.data,
//     required this.selectedPlan,
//     required this.flightDictionary,
//   });

//   @override
//   State<PassengetDetailsNew> createState() => _PassengetDetailsNewState();
// }

// class _PassengetDetailsNewState extends State<PassengetDetailsNew> {
//   List<Map> travellers = [];
//   List<PassengerModel> passengers = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: AppGradientBg(
//           child: TransWhiteBgWidget(
//             child: SafeArea(
//               child: Column(
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16),
//                     child: AppCustomAppbar(
//                       centerTitle: 'Passenger Details',
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Expanded(
//                     child: Container(
//                       padding: const EdgeInsets.only(top: 20),
//                       decoration: BoxDecoration(
//                         color: AppColors.white,
//                         borderRadius: BorderRadius.circular(32),
//                       ),
//                       child: SingleChildScrollView(
//                         child: Column(
//                           children: [
//                             // ...s.data.itineraries!.map(
//                             //   (e) => ItineraryCard(
//                             //     isSegmentRequired: false,
//                             //     width: width,
//                             //     data: e,
//                             //     flightDictionary: widget.flightDictionary,
//                             //   ),
//                             // ),
//                             const SizedBox(height: 8),
//                             const Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 16, vertical: 12),
//                               child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text('Passenger Details',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w600,
//                                     )),
//                               ),
//                             ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 16),
//                               child: PassengerDetailsCard(
//                                 onAddPassenger: (passenger) {
//                                   passengers.add(passenger);
//                                   setState(() {});
//                                 },
//                                 travelerPricing:
//                                     widget.data.travelerPricings ?? [],
//                               ),
//                             ),
//                             const SizedBox(height: 24),
//                             // const Padding(
//                             //   padding: EdgeInsets.symmetric(
//                             //       horizontal: 16, vertical: 12),
//                             //   child: Align(
//                             //     alignment: Alignment.centerLeft,
//                             //     child: Text('Baggage Allowance Details',
//                             //         style: TextStyle(
//                             //           fontSize: 14,
//                             //           fontWeight: FontWeight.w600,
//                             //         )),
//                             //   ),
//                             // ),
//                             // const Padding(
//                             //   padding: EdgeInsets.symmetric(horizontal: 16),
//                             //   child: BaggageAllowanceCard(),
//                             // ),
//                             // const SizedBox(height: 45),
//                             const Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 16, vertical: 12),
//                               child: Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text('Fare breakdown',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w600,
//                                     )),
//                               ),
//                             ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 16),
//                               child: FareBreakdownCard(
//                                 data: widget.data.price,
//                               ),
//                             ),
//                             const SizedBox(height: 45),
//                           ],
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//         bottomNavigationBar: Container(
//           height: 90,
//           color: AppColors.white,
//           padding:
//               const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 40),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Column(
//                     children: [
//                       Text(
//                         '₹${widget.data.price!.grandTotal!}',
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           color: AppColors.black,
//                         ),
//                       ),
//                       const Text('Grand Price',
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                             color: AppColors.grey,
//                           ))
//                     ],
//                   ),
//                   const SizedBox(width: 8),
//                   const Icon(
//                     Icons.info_outline_rounded,
//                     size: 18,
//                     color: AppColors.grey,
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 45,
//                 width: AppHelpers.getScreenWidth(context) * 0.25,
//                 child: AppPrimaryButton(
//                   onPressed: () {
//                     for (var i = 1; i < passengers.length; i++) {
//                       Map<String, dynamic> data =
//                           getTravellerData(passenger: passengers[i], id: i);

//                       travellers.add(data);
//                     }
//                   },
//                   style: const TextStyle(
//                       fontSize: 12, fontWeight: FontWeight.w400),
//                   title: 'Book now',
//                   isLoading: false,
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }

// getDuration({required int min}) {
//   String hours = (min / 60).floor().toString();
//   String minutes = (min % 60).toString();
//   return '${hours}h ${minutes}m';
// }

// Map<String, dynamic> getTravellerData(
//     {required PassengerModel passenger, required int id}) {
//   return {
//     "id": '$id',
//     "dateOfBirth": AppHelpers.formatDate(
//         passenger.dateOfBirth ?? DateTime.now(),
//         pattern: 'yyyy-MM-dd'),
//     "name": {
//       "firstName": "${passenger.firstName}",
//       "lastName": "${passenger.lastName}"
//     },
//     "gender": "${passenger.gender}",
//     "contact": {
//       "emailAddress": "${passenger.emailAddress}",
//       "phones": [
//         {
//           "deviceType": "MOBILE",
//           "countryCallingCode": "91",
//           "number": "${passenger.number}"
//         }
//       ]
//     },
//     "documents": []
//   };
// }
