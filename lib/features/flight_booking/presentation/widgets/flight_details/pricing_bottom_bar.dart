import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/models/profile_data_model.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../bloc/flight_bloc.dart';
import '../../../models/flight_offer_price_model.dart';
import '../../../models/passenger_model.dart';
import 'price_details_sheet.dart';

class PricingBottomBar extends StatefulWidget {
  final String grandTotal;
  final String markup;
  final int travellersCount;
  final List<PassengerModel> passengers;
  final FlightOffer flightOffer;

  final ProfileModel profile;
  const PricingBottomBar({
    super.key,
    required this.grandTotal,
    required this.profile,
    required this.passengers,
    required this.travellersCount,
    required this.markup,
    required this.flightOffer,
  });

  @override
  State<PricingBottomBar> createState() => _PricingBottomBarState();
}

class _PricingBottomBarState extends State<PricingBottomBar> {
  Map<String, dynamic> createPaymentBody = {};

  Map<String, List<Map<String, dynamic>>> travellers = {
    "adults": [],
    "infants": [],
    "children": []
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      color: AppColors.white,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    '₹${widget.markup}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  const Text(
                    'Grand Price',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                    ),
                  )
                ],
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () async {
                  await showPriceDetailsSheet(
                      context: context, flightOffer: widget.flightOffer);
                },
                child: const Icon(
                  Icons.info_outline_rounded,
                  size: 18,
                  color: AppColors.grey,
                ),
              )
            ],
          ),
          SizedBox(
            height: 45,
            width: AppHelpers.getScreenWidth(context) * 0.25,
            child: AppPrimaryButton(
              onPressed: () async {
                try {
                  // isLoading = true;
                  if (widget.travellersCount != widget.passengers.length) {
                    AppHelpers.showSnackBar(
                        context, 'Please add all the travellers');
                    return;
                  }
                  for (int i = 0; i < widget.passengers.length; i++) {
                    Map<String, dynamic> data = getPassengetDetails(
                      passenger: widget.passengers[i],
                    );
                    log('${widget.passengers[i].type}');
                    if (widget.passengers[i].type == 'Adult') {
                      travellers['adults']?.add(data);
                    }
                    if (widget.passengers[i].type == 'Child') {
                      travellers['children']?.add(data);
                    }
                    if (widget.passengers[i].type == 'Infant') {
                      travellers['infants']?.add(data);
                    }
                  }
                  Map<String, dynamic> billingAddress = getBillingAddress(
                    address: widget.profile.address ?? '',
                  );
                  Map<String, dynamic> contactDetails = getContactDetails(
                    email: widget.profile.email ?? '',
                    phone: widget.profile.phone ?? '',
                  );
                  Map<String, dynamic> fareDetails = calculateFareDetails(
                    grandTotal: widget.grandTotal,
                    markupPrice: widget.markup,
                    taxes: widget.flightOffer.price?.fees,
                  );

                  createPaymentBody = getCreatePaymentBody(
                    billingAddress: billingAddress,
                    contactDetails: contactDetails,
                    flightOfferData: widget.flightOffer.toJson(),
                    travellers: travellers,
                    fareDetails: fareDetails,
                  );

                  context
                      .read<FlightBloc>()
                      .add(CreateFlightOrder(body: createPaymentBody));
                } catch (e) {
                  log(e.toString());
                }
              },
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              title: 'Book now',
              isLoading: false,
            ),
          ),
        ],
      ),
    );
  }
}

// Map<String, dynamic> getTravellerData(
//     {required PassengerModel passenger, required int id}) {
//   return {
//     "id": "${id + 1}",
//     "dateOfBirth": AppHelpers.formatDate(
//         passenger.dateOfBirth ?? DateTime.now(),
//         pattern: 'yyyy-MM-dd'),
//     "name": {
//       "firstName": "${passenger.firstName}",
//       "lastName": "${passenger.lastName}"
//     },
//     "gender": "${passenger.gender}".toUpperCase(),
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

// Map<String, dynamic> getCreateOrderBody({
//   required Map<String, dynamic> flightOfferData,
//   required List<Map<String, dynamic>> travallers,
//   required String companyName,
//   required String phone,
//   required List<String> address,
//   required String city,
//   required String state,
//   required String zipCode,
//   required String email,
//   required String firstName,
//   required String lastName,
// }) {
//   return {
//     "data": {
//       "type": "flight-order",
//       "flightOffers": [flightOfferData],
//       "travelers": travallers,
//       "remarks": {
//         "general": [
//           {
//             "subType": "GENERAL_MISCELLANEOUS",
//             "text": "ONLINE BOOKING FROM ${companyName.toUpperCase()}"
//           }
//         ]
//       },
//       "ticketingAgreement": {"option": "DELAY_TO_CANCEL", "delay": "6D"},
//       "contacts": [
//         {
//           "addresseeName": {
//             "firstName": firstName.toUpperCase(),
//             "lastName": lastName.toUpperCase(),
//           },
//           "companyName": companyName.toUpperCase(),
//           "purpose": "STANDARD",
//           "phones": [
//             {
//               "deviceType": "MOBILE",
//               "countryCallingCode": "91",
//               "number": phone
//             }
//           ],
//           "emailAddress": email,
//           "address": {
//             "lines": address,
//             "postalCode": zipCode.trim(),
//             "cityName": city.trim(),
//             "countryCode": "IN"
//           }
//         }
//       ]
//     }
//   };
// }

Map<String, dynamic> getCreatePaymentBody(
    {required Map<String, dynamic> flightOfferData,
    required Map<String, dynamic> travellers,
    required Map<String, dynamic> contactDetails,
    required Map<String, dynamic> fareDetails,
    required Map<String, dynamic> billingAddress}) {
  return {
    "flightOffer": flightOfferData,
    "travellerDetails": travellers,
    "contactDetails": contactDetails,
    "billingAddress": billingAddress,
    "fareDetails": fareDetails,
    "amount": double.parse(flightOfferData['price']['grandTotal']),
    "currency": "INR"
  };
}

Map<String, dynamic> getBillingAddress({required String address}) {
  int addressLenght = address.split(',').length;
  String pinCode = address.split(',').last.trim();
  String state = address.split(',')[addressLenght - 2].trim();
  String city = address.split(',')[addressLenght - 3].trim();
  return {
    "addressLine1": address,
    "addressLine2": address,
    "city": city,
    "state": state,
    "pinCode": pinCode,
    "country": "IN"
  };
}

Map<String, dynamic> getContactDetails(
    {required String phone, required String email}) {
  return {"countryCode": "+91", "phoneNumber": phone, "email": email};
}

Map<String, dynamic> getPassengetDetails({required PassengerModel passenger}) {
  return {
    "title": passenger.gender == 'male' ? "Mr" : "Ms",
    "firstName": passenger.firstName,
    "lastName": passenger.lastName,
    "nationality": "India",
    "dateOfBirth": AppHelpers.formatDate(
        DateTime.parse('${passenger.dateOfBirth}'),
        pattern: 'yyyy-MM-dd'),
    "open": true
  };
}

Map<String, dynamic> calculateFareDetails({
  required String grandTotal,
  required String markupPrice,
  required List<Fee>? taxes,
}) {
  double tax = 0.0;
  if (taxes != null || taxes!.isNotEmpty) {
    for (var element in taxes) {
      tax += double.parse(element.amount ?? '0.0');
    }
  }

  return {
    "selectedFare": "selection",
    "totalFare": double.parse(markupPrice),
    "baseFare": double.parse(grandTotal),
    "taxes": tax,
    "taxesWithMarkup": double.parse(markupPrice) + tax,
    "markup": double.parse(markupPrice),
    "discount": 0,
    "originalSubtotal": double.parse(grandTotal),
    "showTotalFare": true
  };
}
