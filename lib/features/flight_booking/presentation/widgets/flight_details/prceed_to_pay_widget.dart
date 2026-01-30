import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/widgets/app_sheet.dart';
import '../../../../../utils/app_helpers.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../../profile_management/bloc/profile_bloc.dart';
import '../../../../wallet_management/bloc/wallet_bloc.dart';
import '../../../bloc/flight_bloc.dart';
import '../../../data/dto/billing_address_model.dart';
import '../../../data/models/flight_offer_price_model.dart';
import '../../../data/models/passenger_model.dart';

class ProceedToPayWidget extends StatefulWidget {
  const ProceedToPayWidget({
    super.key,
    required this.passengers,
    required this.offerFareEnabled,
    required this.walletBalance,
    required this.creditWalletBalance,
    this.billingAddress,
  });

  final List<PassengerModel> passengers;
  final bool offerFareEnabled;
  final double walletBalance;
  final double creditWalletBalance;
  final BillingAddressModel? billingAddress;

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
    {'name': 'Credit Wallet', 'value': 'credit_wallet', 'icon': 'creditWallet'},
    {'name': 'Razorpay', 'value': 'Razorpay', 'icon': 'razorpay'}
  ];

  @override
  Widget build(BuildContext context) {
    final bool isDark = AppHelpers.isDarkMode(context);
    return BlocBuilder<FlightBloc, FlightState>(
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
                        minVerticalPadding: 0,
                        onTap: () async {
                          showAppSheet(
                              context: context,
                              title: 'Payment Mode',
                              child: Column(
                                children: [
                                  for (int i = 0; i < paymentModes.length; i++)
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
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: isDark
                                                ? AppColors.white
                                                : AppColors.black),
                                      ),
                                      subtitle: paymentModes[i]['value'] ==
                                              'wallet'
                                          ? Text(
                                              double.parse(grandTotal) >
                                                      widget.walletBalance
                                                  ? 'Insufficient Balance'
                                                  : 'Available Balance: ${AppHelpers.formatCurrency(widget.walletBalance)}',
                                              style: TextStyle(
                                                color:
                                                    double.parse(grandTotal) >
                                                            widget.walletBalance
                                                        ? AppColors.error
                                                        : AppColors.success,
                                                fontSize: 12,
                                              ),
                                            )
                                          : paymentModes[i]['value'] ==
                                                  'credit_wallet'
                                              ? Text(
                                                  double.parse(grandTotal) >
                                                          widget
                                                              .creditWalletBalance
                                                      ? 'Insufficient Balance'
                                                      : 'Available Balance: ${AppHelpers.formatCurrency(widget.creditWalletBalance)}',
                                                  style: TextStyle(
                                                    color: double.parse(
                                                                grandTotal) >
                                                            widget.walletBalance
                                                        ? AppColors.error
                                                        : AppColors.success,
                                                    fontSize: 12,
                                                  ),
                                                )
                                              : const Text(
                                                  'Pay with UPI/Cards/Banking Options',
                                                  style: TextStyle(
                                                    color: AppColors.grey,
                                                    fontSize: 12,
                                                  ),
                                                ),
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
                          assetName: paymentMode == 'wallet'
                              ? 'wallet'
                              : paymentMode == 'credit_wallet'
                                  ? 'creditWallet'
                                  : 'razorpay',
                          width: 20,
                          height: 20,
                        ),
                        title: const Row(
                          children: [
                            Text(
                              'PAYING VIA',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 18,
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                        subtitle: Text(
                          paymentModes.firstWhere(
                            (element) => element['value'] == paymentMode,
                          )['name'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: isDark ? AppColors.white : AppColors.black,
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

                            if (paymentMode == 'credit_wallet' &&
                                widget.creditWalletBalance <
                                    double.parse(grandTotal)) {
                              AppHelpers.showSnackBar(context,
                                  'Insufficient balance in credit wallet');
                              return;
                            }

                            if (travellersCount != widget.passengers.length) {
                              AppHelpers.showSnackBar(
                                context,
                                'Passenger information is required to proceed.',
                                backgroundColor: AppColors.error,
                              );
                              return;
                            }
                            if (widget.billingAddress == null) {
                              AppHelpers.showSnackBar(context,
                                  'Billing address is missing. Please wait or add one.');
                              return;
                            }

                            // Reset travellers lists
                            travellers = {
                              'adults': <Map<String, dynamic>>[],
                              'infants': <Map<String, dynamic>>[],
                              'children': <Map<String, dynamic>>[]
                            };

                            for (int i = 0; i < widget.passengers.length; i++) {
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
                              if (widget.passengers[i].type == 'HELD_INFANT') {
                                travellers['infants']?.add(data);
                              }
                            }

                            final Map<String, dynamic> billingAddress =
                                getBillingAddress(
                              billingAddress: widget.billingAddress!,
                            );
                            final Map<String, dynamic> contactDetails =
                                getContactDetails(
                              email: widget.billingAddress!.email,
                              phone: widget.billingAddress!.mobileNumber,
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
                              paymentMethod: paymentMode,
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

                            if (context.mounted) {
                              context.read<WalletBloc>().add(
                                    const FetchWalletEvent(),
                                  );
                              context.read<FlightBloc>().add(
                                    CreateFlightOrder(
                                      body: createPaymentBody,
                                      paymentVia: paymentMode,
                                    ),
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
                        bgColor: AppHelpers.isDarkMode(context)
                            ? AppColors.primary
                            : AppColors.black,
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
        required String paymentMethod,
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
      'currency': 'INR',
      'paymentMethod': paymentMethod.toLowerCase(),
    };

Map<String, dynamic> getBillingAddress(
        {required BillingAddressModel billingAddress}) =>
    <String, dynamic>{
      'addressLine1': billingAddress.addressLine1,
      'addressLine2': billingAddress.addressLine2,
      'city': billingAddress.city,
      'state': billingAddress.state,
      'pinCode': billingAddress.pinCode,
      'country': billingAddress.country.isEmpty
          ? 'IN'
          : billingAddress.country.toUpperCase()
    };

Map<String, dynamic> getContactDetails(
        {required String phone, required String email}) =>
    <String, dynamic>{
      'countryCode': '+91',
      'phoneNumber': phone,
      'email': email
    };

Map<String, dynamic> getPassengetDetails({required PassengerModel passenger}) =>
    <String, dynamic>{
      'title': passenger.title,
      'gender': passenger.gender,
      'firstName': passenger.firstName,
      'lastName': passenger.lastName,
      'nationality': passenger.countryCode,
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
