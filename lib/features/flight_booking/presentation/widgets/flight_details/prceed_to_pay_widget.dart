import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../../profile_management/bloc/profile_bloc.dart';
import '../../../bloc/flight_bloc.dart';
import '../../../data/models/flight_offer_price_model.dart';
import '../../../data/models/passenger_model.dart';

class ProceedToPayWidget extends StatefulWidget {
  const ProceedToPayWidget({
    super.key,
    required this.passengers,
    required this.offerFareEnabled,
  });

  final List<PassengerModel> passengers;
  final bool offerFareEnabled;

  @override
  State<ProceedToPayWidget> createState() => _ProceedToPayWidgetState();
}

class _ProceedToPayWidgetState extends State<ProceedToPayWidget> {
  Map<String, dynamic> createPaymentBody = <String, dynamic>{};

  Map<String, List<Map<String, dynamic>>> travellers =
      <String, List<Map<String, dynamic>>>{
    'adults': <Map<String, dynamic>>[],
    'infants': <Map<String, dynamic>>[],
    'children': <Map<String, dynamic>>[]
  };

  @override
  Widget build(BuildContext context) => BlocBuilder<FlightBloc, FlightState>(
        builder: (context, flightState) {
          if (flightState is! FlightOfferPriceLoaded) {
            return const SizedBox.shrink();
          }

          final flightOffer = flightState.data.data!.flightOffers!.first;
          final grandTotal = flightOffer.price!.grandTotal!;
          final markup = flightOffer.price!.markup!;
          final myMarkup = flightState.data.data!.myMarkup!;
          final travellersCount = flightOffer.travelerPricings!.length;

          return BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, profileState) {
              if (profileState is! ProfileLoaded) {
                return const SizedBox.shrink();
              }

              final profile = profileState.profileData;

              return Container(
                height: 65,
                color: AppColors.white,
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                child: SizedBox(
                  height: 45,
                  width: AppHelpers.getScreenWidth(context),
                  child: AppPrimaryButton(
                    onPressed: () async {
                      try {
                        if (travellersCount != widget.passengers.length) {
                          AppHelpers.showSnackBar(context,
                              'Add all the travellers to proceed with flight booking');
                          return;
                        }

                        // Reset travellers lists
                        travellers = {
                          'adults': <Map<String, dynamic>>[],
                          'infants': <Map<String, dynamic>>[],
                          'children': <Map<String, dynamic>>[]
                        };

                        for (int i = 0; i < widget.passengers.length; i++) {
                          final Map<String, dynamic> data = getPassengetDetails(
                            passenger: widget.passengers[i],
                          );
                          log('${widget.passengers[i].type}');
                          if (widget.passengers[i].type == 'ADULT') {
                            travellers['adults']?.add(data);
                          }
                          if (widget.passengers[i].type == 'CHILD') {
                            travellers['children']?.add(data);
                          }
                          if (widget.passengers[i].type == 'HELD_INFANT') {
                            travellers['infants']?.add(data);
                          }
                        }

                        final Map<String, dynamic> billingAddress =
                            getBillingAddress(
                          address: profile.address ?? '',
                        );
                        final Map<String, dynamic> contactDetails =
                            getContactDetails(
                          email: profile.email ?? '',
                          phone: profile.phone ?? '',
                        );
                        final Map<String, dynamic> fareDetails =
                            calculateFareDetails(
                          myMarkupPrice: myMarkup.value ?? '0',
                          grandTotal: grandTotal,
                          markupPrice: markup,
                          taxes: flightOffer.price?.fees,
                          showTotalFare: widget.offerFareEnabled,
                          myMarkupType: myMarkup.fareType ?? 'Fixed',
                        );

                        createPaymentBody = getCreatePaymentBody(
                          markupPrice: markup,
                          myMarkupPrice: myMarkup.value ?? '0',
                          myMarkupType: myMarkup.type ?? 'Fixed',
                          billingAddress: billingAddress,
                          contactDetails: contactDetails,
                          flightOfferData: flightOffer.toJson(),
                          travellers: travellers,
                          fareDetails: fareDetails,
                          isOfferEnabled: widget.offerFareEnabled,
                        );

                        if (context.mounted) {
                          context
                              .read<FlightBloc>()
                              .add(CreateFlightOrder(body: createPaymentBody));
                        }
                      } catch (e) {
                        log(e.toString());
                      }
                    },
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400),
                    title: 'Book now',
                    isLoading: false,
                  ),
                ),
              );
            },
          );
        },
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
      'title': passenger.gender == 'Male' ? 'Mr' : 'Ms',
      'gender': passenger.gender,
      'firstName': passenger.firstName,
      'lastName': passenger.lastName,
      'nationality': 'India',
      'dateOfBirth': (passenger.dateOfBirth != null)
          ? AppHelpers.formatDate(DateTime.parse('${passenger.dateOfBirth}'),
              pattern: 'yyyy-MM-dd')
          : null,
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
      tax = tax + double.parse(element.amount ?? '0.0');
    }
  }

  return <String, dynamic>{
    'selectedFare': 'selection',
    'baseFare': double.parse(grandTotal),
    'totalFare': showTotalFare
        ? (double.parse(markupPrice))
        : (double.parse(getCalculatedPrice(
            basePrice: markupPrice, type: myMarkupType, value: myMarkupPrice))),
    'taxes': tax,
    'taxesWithMarkup': double.parse(getCalculatedPrice(
            basePrice: markupPrice, type: myMarkupType, value: myMarkupPrice)) +
        tax,
    'markup': showTotalFare
        ? 0.0
        : double.parse(getCalculatedPrice(
                basePrice: markupPrice,
                type: myMarkupType,
                value: myMarkupPrice)) -
            double.parse(markupPrice),
    'discount': 0,
    'originalSubtotal': double.parse(grandTotal),
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
