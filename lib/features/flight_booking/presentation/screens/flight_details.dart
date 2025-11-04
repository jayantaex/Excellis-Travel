import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../../../auth/auth_module.dart';
import '../../../profile_management/bloc/profile_bloc.dart';
import '../../bloc/flight_bloc.dart';
import '../../models/flights_data_model.dart' show FlightDictionary, Datam;
import '../../models/passenger_model.dart';
import '../widgets/flight_details/fareign_options_card_widget.dart';
import '../widgets/itinerary_card_widget.dart';
import '../widgets/passenger_details_card.dart';

class FlightDetailsScreen extends StatefulWidget {
  final Datam data;
  final FlightDictionary flightDictionary;
  const FlightDetailsScreen({
    super.key,
    required this.data,
    required this.flightDictionary,
  });

  @override
  State<FlightDetailsScreen> createState() => _FlightDetailsScreenState();
}

class _FlightDetailsScreenState extends State<FlightDetailsScreen> {
  String seletedTab = 'ADULT';
  List<String> userType = [
    'ADULT',
    'CHILD',
    'INFANT',
  ];
  List<PassengerModel> passengers = [];
  List<Map<String, dynamic>> travellers = [];
  Map<String, dynamic> offerData = {};
  Map<String, dynamic> createOrderBody = {};
  Map<String, dynamic> flightOfferJson = {};

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      offerData = widget.data.toJson();

      context
          .read<FlightBloc>()
          .add(GetFlightsOfferPriceEvent(offerData: offerData));
      context.read<ProfileBloc>().add(const LoadProfileEvent());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = AppHelpers.getScreenWidth(context);

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
                  child: SingleChildScrollView(
                    child: BlocConsumer<FlightBloc, FlightState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is FlightOfferPriceLoading) {
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                        if (state is FlightOfferPriceError) {
                          return Center(
                            child: Text(state.message),
                          );
                        }

                        if (state is FlightOfferPriceLoaded) {
                          flightOfferJson =
                              state.data.data!.flightOffers!.first.toJson();
                          return Column(
                            children: [
                              const SizedBox(height: 8),
                              ...state
                                  .data.data!.flightOffers!.first.itineraries!
                                  .map(
                                (e) => ItineraryCard(
                                  width: width,
                                  flightDictionary: widget.flightDictionary,
                                  data: e,
                                ),
                              ),
                              const SizedBox(height: 12),
                              FareignOptionsCardWidget(
                                allTravelerPricings: state.data.data!
                                    .flightOffers!.first.travelerPricings!,
                              ),
                              const SizedBox(height: 8),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Travellers Details',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: PassengerDetailsCard(
                                  onAddPassenger: (passenger) {
                                    log('$passenger', name: 'FLIGHT DETAILS');
                                    passengers.add(passenger);
                                  },
                                  travelerPricing:
                                      widget.data.travelerPricings ?? [],
                                ),
                              ),
                              const SizedBox(height: 8),
                              BlocBuilder<ProfileBloc, ProfileState>(
                                builder: (context, state) {
                                  if (state is ProfileLoaded) {
                                    return const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 12),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text('Billing Details',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            )),
                                      ),
                                    );
                                  }
                                  return const SizedBox();
                                },
                              ),
                              BlocConsumer<ProfileBloc, ProfileState>(
                                listener: (context, state) {
                                  if (state is ProfileError) {
                                    log(state.message, name: 'FlightDetails');
                                  }
                                },
                                builder: (context, state) {
                                  if (state is ProfileLoaded) {
                                    // to change the billing or conatct details
                                    // company name
                                    // first name
                                    // last name
                                    // phone
                                    // email
                                    // cityName
                                    //country code
                                    //postal code
                                    //address line [address, address, address]
                                    return ListTile(
                                      leading: CircleAvatar(
                                        child: Text(
                                            state.profileData.firstName![0]),
                                      ),
                                      title: Text(
                                          '${state.profileData.firstName} ${state.profileData.lastName}'),
                                      subtitle:
                                          Text('${state.profileData.email}'),
                                      trailing: const Text('Change'),
                                    );
                                  }

                                  if (state is ProfileError) {
                                    return SizedBox(
                                      height: 300,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'It seems you are not logged in \n please login to continue',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.grey,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          InkWell(
                                            onTap: () {
                                              context.pushNamed(
                                                  AuthModule.loginName);
                                            },
                                            child: const Text(
                                              'LOGIN',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.primary,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor:
                                                      AppColors.primary),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  return const Text('Loading...');
                                },
                              )
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
      bottomNavigationBar: BlocBuilder<FlightBloc, FlightState>(
        builder: (context, state) {
          if (state is FlightOfferPriceLoaded) {
            return BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoaded) {
                  return Container(
                    height: 85,
                    color: AppColors.white,
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 40),
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
                                  '₹${widget.data.price!.grandTotal!}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                ),
                                const Text('Grand Price',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.grey,
                                    ))
                              ],
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.info_outline_rounded,
                              size: 18,
                              color: AppColors.grey,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 45,
                          width: AppHelpers.getScreenWidth(context) * 0.25,
                          child: AppPrimaryButton(
                              onPressed: () {
                                for (var i = 1; i < passengers.length; i++) {
                                  Map<String, dynamic> data = getTravellerData(
                                      passenger: passengers[i], id: i);
                                  travellers.add(data);
                                }
                                createOrderBody = getCreateOrderBody(
                                  flightOfferData: flightOfferJson,
                                  firstName: state.profileData.firstName!,
                                  lastName: state.profileData.lastName!,
                                  email: state.profileData.email!,
                                  phone: state.profileData.phone!,
                                  travallers: travellers,
                                  companyName: state.profileData.firstName!,
                                  city:
                                      state.profileData.address!.split(',')[3],
                                  state:
                                      state.profileData.address!.split(',')[2],
                                  zipCode: state.profileData.address!
                                      .split(',')
                                      .last,
                                  address:
                                      state.profileData.address!.split(','),
                                );
                                log('$travellers', name: 'FlightDetails');
                              },
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                              title: 'Book now',
                              isLoading: false),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox();
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

Map<String, dynamic> getTravellerData(
    {required PassengerModel passenger, required int id}) {
  return {
    "id": '$id',
    "dateOfBirth": AppHelpers.formatDate(
        passenger.dateOfBirth ?? DateTime.now(),
        pattern: 'yyyy-MM-dd'),
    "name": {
      "firstName": "${passenger.firstName}",
      "lastName": "${passenger.lastName}"
    },
    "gender": "${passenger.gender}",
    "contact": {
      "emailAddress": "${passenger.emailAddress}",
      "phones": [
        {
          "deviceType": "MOBILE",
          "countryCallingCode": "91",
          "number": "${passenger.number}"
        }
      ]
    },
    "documents": []
  };
}

Map<String, dynamic> getCreateOrderBody({
  required Map<String, dynamic> flightOfferData,
  required List<Map<String, dynamic>> travallers,
  required String companyName,
  required String phone,
  required List<String> address,
  required String city,
  required String state,
  required String zipCode,
  required String email,
  required String firstName,
  required String lastName,
}) {
  return {
    "data": {
      "type": "flight-order",
      "flightOffers": [flightOfferData],
      "travelers": travallers,
      "remarks": {
        "general": [
          {
            "subType": "GENERAL_MISCELLANEOUS",
            "text": "ONLINE BOOKING FROM ${companyName.toUpperCase()}"
          }
        ]
      },
      "ticketingAgreement": {"option": "DELAY_TO_CANCEL", "delay": "6D"},
      "contacts": [
        {
          "addresseeName": {
            "firstName": firstName.toUpperCase(),
            "lastName": lastName.toUpperCase(),
          },
          "companyName": companyName.toUpperCase(),
          "purpose": "STANDARD",
          "phones": [
            {
              "deviceType": "MOBILE",
              "countryCallingCode": "91",
              "number": phone
            }
          ],
          "emailAddress": email,
          "address": {
            "lines": address,
            "postalCode": zipCode,
            "cityName": city,
            "countryCode": "IN"
          }
        }
      ]
    }
  };
}
