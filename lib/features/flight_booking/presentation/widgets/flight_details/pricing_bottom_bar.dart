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

class PricingBottomBar extends StatefulWidget {
  const PricingBottomBar({
    super.key,
    required this.grandTotal,
    required this.offerFareEnabled,
    required this.profile,
    required this.passengers,
    required this.travellersCount,
    required this.markup,
    required this.myMarkup,
    required this.flightOffer,
  });
  final String grandTotal;
  final String markup;
  final MyMarkup myMarkup;
  final bool offerFareEnabled;
  final int travellersCount;
  final List<PassengerModel> passengers;
  final FlightOffer flightOffer;

  final ProfileModel profile;

  @override
  State<PricingBottomBar> createState() => _PricingBottomBarState();
}

class _PricingBottomBarState extends State<PricingBottomBar> {
  Map<String, dynamic> createPaymentBody = <String, dynamic>{};

  Map<String, List<Map<String, dynamic>>> travellers =
      <String, List<Map<String, dynamic>>>{
    'adults': <Map<String, dynamic>>[],
    'infants': <Map<String, dynamic>>[],
    'children': <Map<String, dynamic>>[]
  };

  @override
  Widget build(BuildContext context) => Container(
        height: 65,
        color: AppColors.white,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        child: SizedBox(
          height: 45,
          width: AppHelpers.getScreenWidth(context),
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
                  final Map<String, dynamic> data = getPassengetDetails(
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
                final Map<String, dynamic> billingAddress = getBillingAddress(
                  address: widget.profile.address ?? '',
                );
                final Map<String, dynamic> contactDetails = getContactDetails(
                  email: widget.profile.email ?? '',
                  phone: widget.profile.phone ?? '',
                );
                final Map<String, dynamic> fareDetails = calculateFareDetails(
                  myMarkupPrice: widget.myMarkup.value ?? '0',
                  grandTotal: widget.grandTotal,
                  markupPrice: widget.markup,
                  taxes: widget.flightOffer.price?.fees,
                  showTotalFare: widget.offerFareEnabled,
                  myMarkupType: widget.myMarkup.fareType ?? 'Fixed',
                );

                createPaymentBody = getCreatePaymentBody(
                  markupPrice: widget.markup,
                  myMarkupPrice: widget.myMarkup.value ?? '0',
                  myMarkupType: widget.myMarkup.type ?? 'Fixed',
                  billingAddress: billingAddress,
                  contactDetails: contactDetails,
                  flightOfferData: widget.flightOffer.toJson(),
                  travellers: travellers,
                  fareDetails: fareDetails,
                  isOfferEnabled: widget.offerFareEnabled,
                );
                // log('createPaymentBody $createPaymentBody');
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
      );
}

Map<String, dynamic> getCreatePaymentBody(
        {required Map<String, dynamic> flightOfferData,
        required Map<String, dynamic> travellers,
        required Map<String, dynamic> contactDetails,
        required Map<String, dynamic> fareDetails,
        required bool isOfferEnabled,
        required String markupPrice,
        required String myMarkupPrice,
        required String myMarkupType,
        required Map<String, dynamic> billingAddress}) =>
    <String, dynamic>{
      'flightOffer': flightOfferData,
      'travellerDetails': travellers,
      'contactDetails': contactDetails,
      'billingAddress': billingAddress,
      'fareDetails': fareDetails,

      //enable  ->markup price
      //disable -> markup price + my markup price
      'amount': isOfferEnabled
          ? (double.parse(markupPrice))
          : (double.parse(getCalculatedPrice(
              basePrice: markupPrice,
              type: myMarkupType,
              value: myMarkupPrice))),
      'currency': 'INR'
    };

Map<String, dynamic> getBillingAddress({required String address}) {
  final int addressLenght = address.split(',').length;
  final String pinCode = address.split(',').last.trim();
  final String state = address.split(',')[addressLenght - 2].trim();
  final String city = address.split(',')[addressLenght - 3].trim();
  return <String, dynamic>{
    'addressLine1': address,
    'addressLine2': address,
    'city': city,
    'state': state,
    'pinCode': pinCode,
    'country': 'IN'
  };
}

Map<String, dynamic> getContactDetails(
        {required String phone, required String email}) =>
    <String, dynamic>{
      'countryCode': '+91',
      'phoneNumber': phone,
      'email': email
    };

Map<String, dynamic> getPassengetDetails({required PassengerModel passenger}) =>
    <String, dynamic>{
      'title': passenger.gender == 'male' ? 'Mr' : 'Ms',
      'firstName': passenger.firstName,
      'lastName': passenger.lastName,
      'nationality': 'India',
      'dateOfBirth': AppHelpers.formatDate(
          DateTime.parse('${passenger.dateOfBirth}'),
          pattern: 'yyyy-MM-dd'),
      'open': true
    };

Map<String, dynamic> calculateFareDetails(
    {required String grandTotal,
    required String markupPrice,
    required String myMarkupPrice,
    required String myMarkupType,
    required List<Fee>? taxes,
    required bool showTotalFare}) {
  double tax = 0.0;
  if (taxes != null || taxes!.isNotEmpty) {
    for (Fee element in taxes) {
      tax += double.parse(element.amount ?? '0.0');
    }
  }

  return <String, dynamic>{
    'selectedFare': 'selection',
    'baseFare': double.parse(markupPrice),
    'totalFare': showTotalFare
        ? (double.parse(markupPrice))
        : (double.parse(getCalculatedPrice(
            basePrice: markupPrice, type: myMarkupType, value: myMarkupPrice))),
    'taxes': tax,
    'taxesWithMarkup': double.parse(getCalculatedPrice(
            basePrice: markupPrice, type: myMarkupType, value: myMarkupPrice)) +
        tax,
    'markup': double.parse(getCalculatedPrice(
        basePrice: markupPrice, type: myMarkupType, value: myMarkupPrice)),
    'discount': 0,
    'originalSubtotal': showTotalFare
        ? (double.parse(markupPrice))
        : (double.parse(getCalculatedPrice(
            basePrice: markupPrice, type: myMarkupType, value: myMarkupPrice))),
    'showTotalFare': showTotalFare
  };
}

String getCalculatedPrice(
    {required String basePrice, required String type, required String value}) {
  double price = double.parse(basePrice);

  if (type == 'Fixed') {
    final double amount = double.parse(value);
    price += amount;
    return price.toStringAsFixed(2);
  }
  final amount = (price * double.parse(value)) / 100;
  price += amount;
  return price.toStringAsFixed(2);
}
