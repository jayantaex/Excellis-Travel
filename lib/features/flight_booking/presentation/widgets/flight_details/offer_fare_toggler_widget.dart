import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../utils/app_helpers.dart';
import '../../../data/models/flight_offer_price_model.dart';
import 'pricing_details.dart';

class OfferFareTogglerWidget extends StatefulWidget {
  const OfferFareTogglerWidget(
      {super.key, this.onToggle, required this.flightOffer, this.myMarkup});
  final Function(bool)? onToggle;
  final FlightOffer flightOffer;
  final MyMarkup? myMarkup;

  @override
  State<OfferFareTogglerWidget> createState() => _OfferFareTogglerWidgetState();
}

class _OfferFareTogglerWidgetState extends State<OfferFareTogglerWidget> {
  bool offerFare = false;
  @override
  Widget build(BuildContext context) => Column(
        children: [
          if (widget.myMarkup != null)
            ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.success.withOpacity(0.9),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      AppHelpers.svgAsset(assetName: 'offerIcon', isIcon: true),
                ),
              ),
              title: const Text('Offer Fare',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  )),
              subtitle: const Text(
                  'By enabling this, you may not get your commission',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.grey,
                  )),
              trailing: ScaleTransition(
                scale: const AlwaysStoppedAnimation<double>(0.7),
                child: CupertinoSwitch(
                    value: offerFare,
                    onChanged: (value) {
                      setState(() {
                        offerFare = value;
                      });
                      if (widget.onToggle != null) {
                        widget.onToggle!(value);
                      }
                    }),
              ),
            ),
          PricingDetails(
            offerFareEnabled: offerFare,
            flightOffer: widget.flightOffer,
            myMarkup: widget.myMarkup,
          )
        ],
      );
}
