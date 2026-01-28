import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../../../core/common/models/profile_data_model.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/errors/error_screen.dart';
import '../../../../core/services/razorpay.dart';
import '../../../../utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/no_login_widget.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../../payment/payment_module.dart';
import '../../../profile_management/bloc/profile_bloc.dart';
import '../../../wallet_management/bloc/wallet_bloc.dart';
import '../../bloc/flight_bloc.dart';
import '../../data/dto/billing_address_model.dart';
import '../../flight_booking_module.dart';
import '../../data/models/flights_data_model.dart'
    show FlightDictionary, FlightOfferDatam;
import '../../data/models/passenger_model.dart';
import '../widgets/flight_details/baggae_card_widget.dart';
import '../widgets/flight_details/billing_profile_management_widget.dart';
import '../widgets/flight_details/offer_fare_toggler_widget.dart';
import '../widgets/loading/flight_details_loading_widget.dart';
import '../widgets/flight_details/prceed_to_pay_widget.dart';
import '../widgets/flight_details/itinerary_card_widget.dart';
import '../widgets/flight_details/passenger_details_card.dart';

class FlightDetailsScreen extends StatefulWidget {
  const FlightDetailsScreen({
    super.key,
    required this.data,
    required this.flightDictionary,
    required this.arivalCity,
    required this.arivalAirport,
    required this.departureCity,
    required this.departureAirport,
  });
  final FlightOfferDatam data;
  final FlightDictionary flightDictionary;
  final String arivalCity;
  final String arivalAirport;
  final String departureCity;
  final String departureAirport;

  @override
  State<FlightDetailsScreen> createState() => _FlightDetailsScreenState();
}

class _FlightDetailsScreenState extends State<FlightDetailsScreen> {
  String selectedTab = 'ADULT';
  List<String> passengerTypes = <String>[
    'ADULT',
    'CHILD',
    'INFANT',
  ];
  List<PassengerModel> passengers = <PassengerModel>[];
  bool isOfferEnabled = false;
  final RazorpayService _razorpayService = RazorpayService();
  BillingAddressModel? _billingAddress;
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        context.read<ProfileBloc>().add(const LoadProfileEvent());
        context.read<FlightBloc>().add(
              GetFlightsOfferPriceEvent(
                offerData: getOfferPriceBody(
                  data: widget.data.toJson(),
                ),
              ),
            );
        context.read<WalletBloc>().add(const FetchWalletEvent());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _loadInitialProfileData(ProfileModel profile) {
    String addressLine1 = '';
    String addressLine2 = '';
    String cityName = '';
    String stateName = '';
    String pinCode = '';
    String countryCode = 'IN';

    // Split and clean parts
    final List<String> rawParts = profile.address?.split(',') ?? [];
    final List<String> addressParts = rawParts
        .map((e) => e.trim())
        .where((element) => element.isNotEmpty)
        .toList();

    if (addressParts.isNotEmpty) {
      final String lastPart = addressParts.last;
      // Check if the last part is likely a country (not numeric, common names)
      final bool isNumeric = int.tryParse(lastPart) != null;
      if (!isNumeric) {
        // Assume it is country
        if (lastPart.length == 2) {
          countryCode = lastPart.toUpperCase();
        } else if (lastPart.toLowerCase() == 'india') {
          countryCode = 'IN';
        } else {
          // Fallback/Use as is
          countryCode = 'IN';
        }
        // Even if we default to IN, if the string was "India", we consume it so it's not set as Pin
        if (lastPart.toLowerCase() == 'india' ||
            lastPart.length == 2 ||
            !isNumeric) {
          addressParts.removeLast();
        }
      }
    }

    if (addressParts.isNotEmpty) {
      pinCode = addressParts.last;
      addressParts.removeLast();
    }
    if (addressParts.isNotEmpty) {
      stateName = addressParts.last;
      addressParts.removeLast();
    }
    if (addressParts.isNotEmpty) {
      cityName = addressParts.last;
      addressParts.removeLast();
    }

    // Any remaining parts are the address lines
    if (addressParts.isNotEmpty) {
      if (addressParts.length > 1) {
        addressLine2 = addressParts.last;
        addressParts.removeLast();
        addressLine1 = addressParts.join(', ');
      } else {
        addressLine1 = addressParts.first;
      }
    }

    if (_billingAddress == null) {
      _billingAddress = BillingAddressModel(
          addressLine1: addressLine1,
          addressLine2: addressLine2,
          city: cityName,
          state: stateName,
          pinCode: pinCode,
          country: countryCode,
          email: profile.email ?? '',
          firstName: profile.firstName ?? '',
          lastName: profile.lastName ?? '',
          mobileNumber: profile.phone ?? '',
          countryCode: countryCode);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = AppHelpers.getScreenWidth(context);
    final bool isDark = AppHelpers.isDarkMode(context);
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoaded) {
          _loadInitialProfileData(state.profileData);
        }
      },
      child: Scaffold(
        body: AppGradientBg(
          child: TransWhiteBgWidget(
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: AppCustomAppbar(
                      centerTitle: 'Flight Details & Fares',
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      decoration: BoxDecoration(
                        color:
                            isDark ? AppColors.secondaryDark : AppColors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                      child: BlocConsumer<FlightBloc, FlightState>(
                        listener: (context, state) async {
                          if (state is FlightOrderCreated) {
                            final String description =
                                'initiated this payment for booking no ${state.data.notes?.bookingId} and reference no ${state.data.notes?.bookingReference}';
                            final String orderId = state.data.id ?? '';
                            const String mobile = '';
                            const String email = '';
                            log('state.paymentVia: ${state.data.amount}');

                            if (state.paymentVia == 'Razorpay') {
                              final int amount = state.data.amount ?? 0;

                              await _razorpayService.initatePayment(
                                  amount: amount,
                                  description: description,
                                  orderId: orderId,
                                  mobile: mobile,
                                  email: email,
                                  onSuccess: _handlePaymentSuccess,
                                  onError: _handlePaymentError);
                              return;
                            }
                            final String amountStr =
                                ((state.data.amount ?? 0) / 100)
                                    .toStringAsFixed(2);
                            if (state.paymentVia == 'wallet') {
                              await _chargeWallet(
                                amount: double.parse(amountStr),
                                paymentId: state.data.paymentId ?? 0,
                              );
                              return;
                            }

                            if (state.paymentVia == 'credit_wallet') {
                              await _chargeCreditWallet(
                                amount: double.parse(amountStr),
                                bookingId: state.data.bookingId ?? 0,
                                paymentId: state.data.paymentId ?? 0,
                              );
                              return;
                            }
                          }

                          if (state is FlightPaymentVerified) {
                            if (context.mounted) {
                              if (state.paymentMode == 'credit_wallet' ||
                                  state.paymentMode == 'wallet') {
                                final Map<String, dynamic> data = {
                                  'btnText': 'Proceed to next',
                                  'nextRoute':
                                      FlightBookingModule.passDownloadName,
                                  'paymentData': state.data,
                                };
                                log('Details screen data: $data');
                                context.pushReplacementNamed(
                                    PaymentModule.paymentSuccessName,
                                    extra: data);
                                return;
                              }
                              context.pushReplacementNamed(
                                  FlightBookingModule.passDownloadName,
                                  extra: {'data': state.data});
                            }
                          }
                        },
                        builder: (context, flightState) {
                          if (flightState is FlightOfferPriceLoading) {
                            return const FlightDetailsLoadingWidget();
                          }
                          if (flightState is FlightOfferPriceError) {
                            return ErrorScreen(
                              errorDesc: flightState.message,
                              errorMessage: 'Flight Offer Error',
                            );
                          }
                          if (flightState is FlightPaymentVerificationFailed) {
                            return ErrorScreen(
                                bg: AppColors.primary.withValues(alpha: 0.3),
                                errorDesc: flightState.error,
                                errorMessage: 'Flight Payment Error');
                          }

                          if (flightState is FlightOrderCreationError) {
                            return ErrorScreen(
                                bg: AppColors.primary.withValues(alpha: 0.3),
                                errorDesc: flightState.error,
                                errorMessage: 'Flight Payment Error');
                          }

                          if (flightState is FlightOfferPriceLoaded) {
                            final itineraries = flightState
                                .data.data!.flightOffers!.first.itineraries!;
                            double.parse(flightState.data.data!.flightOffers!
                                    .first.price!.grandTotal ??
                                '0.0');
                            return CustomScrollView(
                              slivers: [
                                const SliverToBoxAdapter(
                                    child: SizedBox(height: 8)),
                                SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) => ItineraryCard(
                                      width: width,
                                      flightDictionary: widget.flightDictionary,
                                      data: itineraries[index],
                                      arrivalCity: widget.arivalCity,
                                      arrivalAirport: widget.arivalAirport,
                                      departureCity: widget.departureCity,
                                      departureAirport: widget.departureAirport,
                                      duration: widget
                                          .data.itineraries?[index].duration,
                                      index: index,
                                    ),
                                    childCount: itineraries.length,
                                  ),
                                ),
                                const SliverToBoxAdapter(
                                    child: SizedBox(height: 12)),
                                const SliverToBoxAdapter(
                                  child: BaggaeCardWidget(
                                    title: 'Cabin Baggage',
                                    iconName: 'baggage',
                                    allowance: '7KG (1 bag only)/Adult',
                                  ),
                                ),
                                const SliverToBoxAdapter(
                                    child: SizedBox(height: 8)),
                                SliverToBoxAdapter(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Travellers Details',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: isDark
                                              ? AppColors.white
                                              : AppColors.textPrimary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: PassengerDetailsCard(
                                      onAddPassenger: (passenger) {
                                        passengers.add(passenger);
                                      },
                                      onPassengerRemove: (passenger) {
                                        passengers.remove(passenger);
                                      },
                                      travelerPricing: flightState
                                              .data
                                              .data!
                                              .flightOffers!
                                              .first
                                              .travelerPricings ??
                                          [],
                                    ),
                                  ),
                                ),
                                // widget.data.itineraries?.length == 1
                                //     ? SliverToBoxAdapter(
                                //         child: Padding(
                                //           padding: const EdgeInsets.symmetric(
                                //               horizontal: 8),
                                //           child: ListTile(
                                //             contentPadding:
                                //                 const EdgeInsets.symmetric(
                                //                     horizontal: 8),
                                //             leading: AppHelpers.svgAsset(
                                //                 assetName: 'seat',
                                //                 isIcon: true),
                                //             title: const Text('Choose Seat',
                                //                 style: TextStyle(
                                //                   fontSize: 14,
                                //                   fontWeight: FontWeight.w600,
                                //                 )),
                                //             subtitle: const Text(
                                //               'Choose your seat for this flight',
                                //               style: TextStyle(
                                //                 fontSize: 12,
                                //                 fontWeight: FontWeight.w400,
                                //               ),
                                //             ),
                                //             trailing: InkWell(
                                //               onTap: () {
                                //                 context.pushNamed(
                                //                     FlightBookingModule
                                //                         .seatSelectionName,
                                //                     extra: {
                                //                       'flightOffer':
                                //                           widget.data,
                                //                       'departureAirport':
                                //                           widget
                                //                                   .data
                                //                                   .itineraries
                                //                                   ?.first
                                //                                   .segments
                                //                                   ?.first
                                //                                   .departure
                                //                                   ?.iataCode ??
                                //                               '',
                                //                       'arivalAirport': widget
                                //                               .data
                                //                               .itineraries
                                //                               ?.first
                                //                               .segments
                                //                               ?.first
                                //                               .arrival
                                //                               ?.iataCode ??
                                //                           '',
                                //                     });
                                //               },
                                //               child: CircleAvatar(
                                //                 radius: 16,
                                //                 backgroundColor: AppColors
                                //                     .success
                                //                     .withValues(alpha: 0.2),
                                //                 child: const Icon(
                                //                   Icons.add,
                                //                   size: 16,
                                //                   color: AppColors.success,
                                //                 ),
                                //               ),
                                //             ),
                                //           ),
                                //         ),
                                //       )
                                //     : const SizedBox(),
                                SliverToBoxAdapter(
                                  child:
                                      BlocConsumer<ProfileBloc, ProfileState>(
                                    buildWhen: (prev, curr) =>
                                        curr is ProfileLoaded ||
                                        curr is ProfileError,
                                    listener: (context, state) {
                                      if (state is ProfileLoaded) {}
                                    },
                                    builder: (context, state) {
                                      if (state is ProfileLoaded) {
                                        return Column(
                                          children: <Widget>[
                                            const SizedBox(height: 16),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16),
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Billing Details',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: isDark
                                                        ? AppColors.white
                                                        : AppColors.textPrimary,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            BlocBuilder<WalletBloc,
                                                WalletState>(
                                              builder: (context, state) {
                                                if (state
                                                    is FetchCreditBalanceSuccess) {
                                                  return OfferFareTogglerWidget(
                                                    walletBalance: state
                                                            .availableWalletBalance ??
                                                        0,
                                                    onToggle: (bool value) {
                                                      setState(() {
                                                        isOfferEnabled = value;
                                                      });
                                                    },
                                                    flightOffer: flightState
                                                        .data
                                                        .data!
                                                        .flightOffers!
                                                        .first,
                                                    myMarkup: flightState
                                                        .data.data?.myMarkup,
                                                  );
                                                }
                                                return const SizedBox.shrink();
                                              },
                                            ),
                                            BillingProfileManagementWidget(
                                              billingAddress: _billingAddress,
                                              onBillingAddressChange:
                                                  (BillingAddressModel
                                                      billingAddress) {
                                                _billingAddress =
                                                    billingAddress;
                                                setState(() {});
                                              },
                                            ),
                                          ],
                                        );
                                      }
                                      if (state is ProfileError) {
                                        return const NotLoginWidget();
                                      }
                                      return const SizedBox();
                                    },
                                  ),
                                ),
                              ],
                            );
                          }
                          if (flightState is FlightOrderLoading ||
                              flightState is FlightOrderCreated) {
                            return Center(
                              child: SizedBox(
                                height: 900,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: CircularProgressIndicator(
                                        color: AppColors.primary,
                                        strokeWidth: 2,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      'Please allow us to process your booking',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: isDark
                                            ? AppColors.white
                                                .withValues(alpha: 0.7)
                                            : AppColors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BlocConsumer<WalletBloc, WalletState>(
          listener: (context, state) {
            if (state is WalletLoaded) {
              context.read<WalletBloc>().add(const FetchCreditBalanceEvent());
            }
            if (state is ChargeMoneySubmitted) {
              final Map<String, dynamic> body = {
                'payment_id': state.paymentId,
                'razorpay_order_id': null,
                'razorpay_payment_id': null,
                'razorpay_signature': null
              };
              _verifyPayment(body, 'wallet');
            }
            if (state is ChargeMoneyError) {
              _handlePaymentError(
                  PaymentFailureResponse(400, state.message, null));
            }

            if (state is ChargeCreditWalletMoneySuccess) {
              final Map<String, dynamic> body = {
                'payment_id': state.paymentId,
                'razorpay_order_id': null,
                'razorpay_payment_id': null,
                'razorpay_signature': null
              };
              _verifyPayment(body, 'credit_wallet');
            }

            if (state is ChargeCreditWalletMoneyError) {
              _handlePaymentError(
                  PaymentFailureResponse(400, state.message, null));
            }
          },
          builder: (context, state) {
            if (state is FetchCreditBalanceSuccess) {
              return ProceedToPayWidget(
                walletBalance: state.availableWalletBalance ?? 0.0,
                creditWalletBalance: state.data?.data?.balance ?? 0.0,
                passengers: passengers,
                offerFareEnabled: isOfferEnabled,
                billingAddress: _billingAddress,
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse? response) async {
    final Map<String, dynamic> verifyPaymentBody = {
      'razorpay_order_id': response?.orderId,
      'razorpay_payment_id': response?.paymentId,
      'razorpay_signature': response?.signature,
      'payment_id': null,
    };

    _verifyPayment(verifyPaymentBody, 'razorpay');
  }

  Future<void> _verifyPayment(
      Map<String, dynamic> body, String paymentMode) async {
    context
        .read<FlightBloc>()
        .add(VerifyPayment(body: body, paymentMode: paymentMode));
  }

  Future<void> _handlePaymentError(PaymentFailureResponse response) async {
    final String failureMessage = _extractPaymentFailureMessage(response);
    if (!mounted) return;
    context.pushReplacementNamed(
      PaymentModule.paymentFailedName,
      queryParameters: {'message': failureMessage},
    );
  }

  String _extractPaymentFailureMessage(PaymentFailureResponse response) {
    final String? directMessage = _sanitizePaymentMessage(response.message);
    if (directMessage != null) {
      return directMessage;
    }

    final dynamic errorPayload = response.error;
    if (errorPayload is Map) {
      final dynamic nestedError = errorPayload['error'];
      final Iterable<dynamic> candidates = <dynamic>[
        if (nestedError is Map) nestedError['description'],
        if (nestedError is Map) nestedError['reason'],
        errorPayload['description'],
        errorPayload['reason'],
      ];

      for (final candidate in candidates) {
        final String? cleaned = _sanitizePaymentMessage(candidate?.toString());
        if (cleaned != null) {
          return cleaned;
        }
      }
    }

    final int? code = response.code;
    if (code != null) {
      return 'Payment failed (code $code). Please try again.';
    }

    return 'Payment failed. Please try again.';
  }

  String? _sanitizePaymentMessage(String? message) {
    if (message == null) return null;
    final String trimmed = message.trim();
    if (trimmed.isEmpty) return null;
    final String normalized = trimmed.toLowerCase();
    if (normalized == 'null' || normalized == 'undefined') {
      return null;
    }
    return trimmed;
  }

  Future<void> _chargeWallet(
      {required double amount, required int paymentId}) async {
    context.read<WalletBloc>().add(
          ChargeMoneyEvent(
            amount: amount,
            description: 'Flight Booking',
            paymentId: paymentId,
          ),
        );
  }

  Future<void> _chargeCreditWallet(
      {required double amount,
      required int bookingId,
      required int paymentId}) async {
    final Map<String, dynamic> body = {
      'amount': amount,
      'description': 'Flight Booking via Credit Wallet',
      'relatedBookingId': bookingId,
      'paymentId': paymentId,
    };
    context.read<WalletBloc>().add(
          ChargeCreditWalletMoneyEvent(
            body: body,
          ),
        );
  }
}

Map<String, dynamic> getOfferPriceBody({required Map<String, dynamic> data}) {
  int associatedAdultId = 1;
  data['travelerPricings'].forEach((traveller) {
    if (traveller['travelerType'] == 'HELD_INFANT') {
      traveller['associatedAdultId'] = associatedAdultId.toString();
      associatedAdultId++;
    }
  });
  return data;
}
