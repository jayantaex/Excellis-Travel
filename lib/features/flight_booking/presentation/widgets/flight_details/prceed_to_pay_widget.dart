import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/widgets/app_sheet.dart';
import '../../../../../utils/app_helpers.dart';
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
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.pinCode,
    required this.country,
    required this.countryCode,
    required this.walletBalance,
  });

  final List<PassengerModel> passengers;
  final bool offerFareEnabled;
  final String firstName;
  final String lastName;
  final String email;
  final String mobileNumber;
  final String addressLine1;
  final String addressLine2;
  final String city;
  final String pinCode;
  final String country;
  final String countryCode;
  final double walletBalance;

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
  String paymentMode = 'wallet';
  final List<Map<String, dynamic>> paymentModes = [
    {'name': 'Excellis Wallet', 'value': 'wallet', 'icon': 'wallet'},
    {'name': 'Razorpay', 'value': 'Razorpay', 'icon': 'razorpay'}
  ];

  @override
  Widget build(BuildContext context) => BlocBuilder<FlightBloc, FlightState>(
        builder: (context, flightState) {
          if (flightState is! FlightOfferPriceLoaded) {
            return const SizedBox.shrink();
          }

          final flightOffer = flightState.data.data!.flightOffers!.first;
          final grandTotal = flightOffer.price!.grandTotal!;
          final markup = flightOffer.price!.markup!;
          final myMarkup = flightState.data.data?.myMarkup;
          final travellersCount = flightOffer.travelerPricings!.length;

          return BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, profileState) {
              if (profileState is! ProfileLoaded) {
                return const SizedBox.shrink();
              }

              // final profile = profileState.profileData;

              return SizedBox(
                width: AppHelpers.getScreenWidth(context),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppHelpers.getScreenWidth(context) * 0.45,
                        child: ListTile(
                          onTap: () async {
                            showAppSheet(
                                context: context,
                                title: 'Payment Mode',
                                child: Column(
                                  children: [
                                    for (int i = 0;
                                        i < paymentModes.length;
                                        i++)
                                      ListTile(
                                        onTap: () {
                                          setState(() {
                                            paymentMode =
                                                paymentModes[i]['value'];
                                          });
                                          Navigator.pop(context);
                                        },
                                        leading: AppHelpers.assetImage(
                                          assetName: paymentModes[i]['icon'],
                                          width: 24,
                                          height: 24,
                                        ),
                                        title: Text(
                                          paymentModes[i]['name'],
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        subtitle: paymentModes[i]['value'] ==
                                                'wallet'
                                            ? Text(
                                                double.parse(grandTotal) >
                                                        widget.walletBalance
                                                    ? 'Insufficient Balance'
                                                    : 'Available Balance: ₹${widget.walletBalance}',
                                                style: TextStyle(
                                                  color:
                                                      double.parse(grandTotal) >
                                                              widget
                                                                  .walletBalance
                                                          ? AppColors.error
                                                          : AppColors.success,
                                                  fontSize: 12,
                                                ),
                                              )
                                            : null,
                                        trailing: paymentMode ==
                                                paymentModes[i]['value']
                                            ? const Icon(
                                                Icons
                                                    .check_circle_outline_rounded,
                                                color: AppColors.primary,
                                              )
                                            : const SizedBox.shrink(),
                                      )
                                  ],
                                ));
                          },
                          contentPadding: const EdgeInsets.all(0),
                          horizontalTitleGap: 8,
                          leading: AppHelpers.assetImage(
                            assetName:
                                paymentMode == 'wallet' ? 'wallet' : 'razorpay',
                            width: 25,
                            height: 25,
                          ),
                          title: const Row(
                            children: [
                              Text(
                                'PAYING VIA',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.grey,
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColors.black,
                                size: 14,
                              ),
                            ],
                          ),
                          subtitle: Text(
                            paymentModes.firstWhere(
                              (element) => element['value'] == paymentMode,
                            )['name'],
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: AppHelpers.getScreenWidth(context) * 0.45,
                        child: AppPrimaryButton(
                          onPressed: () async {
                            try {
                              if (paymentMode == 'wallet' &&
                                  widget.walletBalance <
                                      double.parse(grandTotal)) {
                                AppHelpers.showSnackBar(
                                    context, 'Insufficient balance in wallet');
                                return;
                              }
                              if (travellersCount != widget.passengers.length) {
                                AppHelpers.showSnackBar(context,
                                    'Add all the travellers to proceed with flight booking');
                                return;
                              }
                              if (paymentMode == 'wallet') {
                                AppHelpers.showSnackBar(
                                    context, 'Feature not implemented yet');
                                return;
                              }

                              // Reset travellers lists
                              travellers = {
                                'adults': <Map<String, dynamic>>[],
                                'infants': <Map<String, dynamic>>[],
                                'children': <Map<String, dynamic>>[]
                              };

                              for (int i = 0;
                                  i < widget.passengers.length;
                                  i++) {
                                final Map<String, dynamic> data =
                                    getPassengetDetails(
                                  passenger: widget.passengers[i],
                                );
                                if (widget.passengers[i].type == 'ADULT') {
                                  travellers['adults']?.add(data);
                                }
                                if (widget.passengers[i].type == 'CHILD') {
                                  travellers['children']?.add(data);
                                }
                                if (widget.passengers[i].type ==
                                    'HELD_INFANT') {
                                  travellers['infants']?.add(data);
                                }
                              }

                              final Map<String, dynamic> billingAddress =
                                  getBillingAddress(
                                addressLine1: widget.addressLine1,
                                addressLine2: widget.addressLine2,
                              );
                              final Map<String, dynamic> contactDetails =
                                  getContactDetails(
                                email: widget.email,
                                phone: widget.mobileNumber,
                              );
                              final Map<String, dynamic> fareDetails =
                                  calculateFareDetails(
                                myMarkupPrice: myMarkup?.value ?? '0',
                                grandTotal: grandTotal,
                                markupPrice: markup,
                                taxes: flightOffer.price?.fees,
                                showTotalFare: widget.offerFareEnabled,
                                myMarkupType: myMarkup?.fareType ?? 'Fixed',
                              );
                              createPaymentBody = getCreatePaymentBody(
                                markupPrice: markup,
                                myMarkupPrice: myMarkup?.value ?? '0',
                                myMarkupType: myMarkup?.type ?? 'Fixed',
                                billingAddress: billingAddress,
                                contactDetails: contactDetails,
                                flightOfferData: flightOffer.toJson(),
                                travellers: travellers,
                                fareDetails: fareDetails,
                                isOfferEnabled: widget.offerFareEnabled,
                              );
                              log('$createPaymentBody');

                              if (context.mounted) {
                                context.read<FlightBloc>().add(
                                      CreateFlightOrder(
                                          body: createPaymentBody),
                                    );
                              }
                            } catch (e) {
                              log('ERROR: ${e.toString()}');
                            }
                          },
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                          title: 'Book now',
                          isLoading: false,
                        ),
                      ),
                    ],
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
      'amount': isOfferEnabled
          ? (double.parse(markupPrice))
          : (double.parse(getCalculatedPrice(
              basePrice: markupPrice,
              type: myMarkupType,
              value: myMarkupPrice))),
      'currency': 'INR'
    };

Map<String, dynamic> getBillingAddress(
    {required String addressLine1, required String addressLine2}) {
  final int addressLenght = addressLine1.split(',').length;
  final String countryCode = addressLine1.split(',').last.trim();
  final String pinCode = addressLine1.split(',')[addressLenght - 2].trim();
  final String city = addressLine1.split(',')[addressLenght - 4].trim();
  final String state = addressLine1.split(',')[addressLenght - 3].trim();

  return <String, dynamic>{
    'addressLine1': addressLine1,
    'addressLine2': addressLine2,
    'city': city,
    'state': state,
    'pinCode': pinCode,
    'country': countryCode.isEmpty ? 'IN' : countryCode.toUpperCase()
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
