import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../../../core/common/models/profile_data_model.dart';
import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/services/razorpay.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../../../core/widgets/primary_button.dart';
import '../../../../wallet_management/wallet_module.dart';
import '../../../bloc/flight_bloc.dart';
import '../../../models/passenger_model.dart';

class PricingBottomBar extends StatefulWidget {
  final String grandTotal;
  final int travellersCount;
  final List<PassengerModel> passengers;
  final Map<String, dynamic> flightOfferData;

  final ProfileModel profile;
  const PricingBottomBar(
      {super.key,
      required this.grandTotal,
      required this.profile,
      required this.flightOfferData,
      required this.passengers,
      required this.travellersCount});

  @override
  State<PricingBottomBar> createState() => _PricingBottomBarState();
}

class _PricingBottomBarState extends State<PricingBottomBar> {
  final RazorpayService _razorpayService = RazorpayService();
  Map<String, dynamic> createOrderBody = {};
  List<Map<String, dynamic>> travellers = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightBloc, FlightState>(
      listener: (context, state) {
        if (state is FlightOrderCreationError) {
          context.pushNamed(WalletModule.paymentFailedName);
        }
      },
      builder: (context, state) {
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
                        '₹${widget.grandTotal}',
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
                  onPressed: () async {
                    try {
                      // isLoading = true;
                      if (widget.travellersCount != widget.passengers.length) {
                        AppHelpers.showSnackBar(
                            context, 'Please add all the travellers');
                        return;
                      }
                      for (int i = 0; i < widget.passengers.length; i++) {
                        Map<String, dynamic> data = getTravellerData(
                            passenger: widget.passengers[i], id: i);
                        travellers.add(data);
                      }
                      int addressLenght =
                          widget.profile.address!.split(',').length;
                      createOrderBody = getCreateOrderBody(
                        flightOfferData: widget.flightOfferData,
                        firstName: widget.profile.firstName!,
                        lastName: widget.profile.lastName!,
                        email: widget.profile.email!,
                        phone: widget.profile.phone!,
                        travallers: travellers,
                        companyName: widget.profile.firstName!,
                        city: widget.profile.address!
                            .split(',')[addressLenght - 3],
                        state: widget.profile.address!
                            .split(',')[addressLenght - 2],
                        zipCode: widget.profile.address!.split(',').last,
                        address: widget.profile.address!.split(','),
                      );

                      String desc =
                          '${widget.profile.email} processed a payment of ₹${widget.grandTotal} only for flight booking';
                      Future.delayed(const Duration(seconds: 1), () async {
                        await _razorpayService.initatePayment(
                          amount: double.parse(widget.grandTotal),
                          description: desc,
                          mobile: widget.profile.phone ?? 'no-phone-provided',
                          email: widget.profile.email ?? 'no-email-provided',
                          onSuccess: _handlePaymentSuccess,
                          onError: _handlePaymentError,
                        );
                      });
                    } catch (e) {}
                  },
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                  title: 'Book now',
                  isLoading: isLoading,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    context.read<FlightBloc>().add(CreateFlightOrder(body: createOrderBody));
    context.pushNamed(WalletModule.paymentSucessName,
        pathParameters: {'paymentId': '${response.paymentId}'});
  }

  _handlePaymentError(PaymentFailureResponse response) {
    context.pushNamed(WalletModule.paymentFailedName,
        pathParameters: {'errorMsg': '${response.message}'});
  }
}

Map<String, dynamic> getTravellerData(
    {required PassengerModel passenger, required int id}) {
  return {
    "id": "${id + 1}",
    "dateOfBirth": AppHelpers.formatDate(
        passenger.dateOfBirth ?? DateTime.now(),
        pattern: 'yyyy-MM-dd'),
    "name": {
      "firstName": "${passenger.firstName}",
      "lastName": "${passenger.lastName}"
    },
    "gender": "${passenger.gender}".toUpperCase(),
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
            "postalCode": zipCode.trim(),
            "cityName": city.trim(),
            "countryCode": "IN"
          }
        }
      ]
    }
  };
}
