import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/errors/error_screen.dart';
import '../../../../core/services/razorpay.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/no_login_widget.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../../payment/payment_module.dart';
import '../../../profile_management/bloc/profile_bloc.dart';
import '../../bloc/flight_bloc.dart';
import '../../flight_booking_module.dart';
import '../../data/models/flights_data_model.dart' show FlightDictionary, Datam;
import '../../data/models/passenger_model.dart';
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
  });
  final Datam data;
  final FlightDictionary flightDictionary;

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

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        context.read<ProfileBloc>().add(const LoadProfileEvent());
        context.read<FlightBloc>().add(GetFlightsOfferPriceEvent(
            offerData: getOfferPriceBody(data: widget.data.toJson())));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = AppHelpers.getScreenWidth(context);

    return Scaffold(
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
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: BlocConsumer<FlightBloc, FlightState>(
                      listener: (context, state) async {
                        if (state is FlightOrderCreated) {
                          final int amount = state.data.amount ?? 0;
                          final String description =
                              'initiated this payment for booking no ${state.data.notes?.bookingId} and reference no ${state.data.notes?.bookingReference}';
                          final String orderId = state.data.id ?? '';
                          const String mobile = '';
                          const String email = '';

                          await _razorpayService.initatePayment(
                              amount: amount,
                              description: description,
                              orderId: orderId,
                              mobile: mobile,
                              email: email,
                              onSuccess: _handlePaymentSuccess,
                              onError: _handlePaymentError);
                        }
                        if (state is FlightPaymentVerified) {
                          if (context.mounted) {
                            context.goNamed(
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
                              bg: AppColors.primary.withOpacity(0.3),
                              errorDesc: flightState.error,
                              errorMessage: 'Flight Payment Error');
                        }

                        if (flightState is FlightOrderCreationError) {
                          return ErrorScreen(
                              bg: AppColors.primary.withOpacity(0.3),
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
                                  ),
                                  childCount: itineraries.length,
                                ),
                              ),
                              const SliverToBoxAdapter(
                                  child: SizedBox(height: 12)),
                              // SliverToBoxAdapter(
                              //   child: FaresAndPrices(
                              //     allTravelerPricings: travelerPricings,
                              //     grandPrice: grandTotal,
                              //   ),
                              // ),
                              const SliverToBoxAdapter(
                                  child: SizedBox(height: 8)),
                              const SliverToBoxAdapter(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Travellers Details',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: PassengerDetailsCard(
                                    onAddPassenger: (passenger) {
                                      passengers.add(passenger);
                                    },
                                    onPassengerRemove: (passenger) {
                                      passengers.remove(passenger);
                                    },
                                    travelerPricing:
                                        widget.data.travelerPricings ?? [],
                                  ),
                                ),
                              ),
                              SliverToBoxAdapter(
                                child: BlocBuilder<ProfileBloc, ProfileState>(
                                  buildWhen: (prev, curr) =>
                                      curr is ProfileLoaded ||
                                      curr is ProfileError,
                                  builder: (context, state) {
                                    if (state is ProfileLoaded) {
                                      return Column(
                                        children: [
                                          OfferFareTogglerWidget(
                                            onToggle: (bool value) {
                                              isOfferEnabled = value;
                                            },
                                            flightOffer: flightState
                                                .data.data!.flightOffers!.first,
                                            myMarkup: flightState
                                                .data.data!.myMarkup!,
                                          ),
                                          ListTile(
                                            leading: CircleAvatar(
                                              child: Text(
                                                (state.profileData.firstName
                                                            ?.isNotEmpty ??
                                                        false)
                                                    ? state.profileData
                                                        .firstName![0]
                                                    : '?',
                                              ),
                                            ),
                                            title: Text(
                                                '${state.profileData.firstName} ${state.profileData.lastName}'),
                                            subtitle: Text(
                                                '${state.profileData.email}'),
                                            trailing: const Text('Change'),
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
                        if (flightState is FlightOrderLoading) {
                          return const Center(
                            child: SizedBox(
                              height: 900,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: CircularProgressIndicator(
                                      color: AppColors.primary,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    'Please allow us to process your booking',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 8),
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
      bottomNavigationBar: ProceedToPayWidget(
        passengers: passengers,
        offerFareEnabled: isOfferEnabled,
      ),
    );
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    final Map<String, dynamic> verifyPaymentBody = {
      'razorpay_order_id': response.orderId,
      'razorpay_payment_id': response.paymentId,
      'razorpay_signature': response.signature
    };

    context.read<FlightBloc>().add(VerifyPayment(body: verifyPaymentBody));
  }

  Future<void> _handlePaymentError(PaymentFailureResponse response) async {
    context.pushNamed(PaymentModule.paymentFailedName,
        pathParameters: {'errorMsg': '${response.message}'});
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
