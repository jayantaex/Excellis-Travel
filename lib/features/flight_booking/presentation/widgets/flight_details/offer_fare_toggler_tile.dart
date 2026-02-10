import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../utils/app_helpers.dart';
import '../../../data/models/flight_offer_price_model.dart';

class OfferFareTogglerTile extends StatefulWidget {
  const OfferFareTogglerTile(
      {super.key,
      this.onToggle,
      required this.flightOffer,
      required this.myMarkup});
  final Function(bool)? onToggle;
  final FlightOffer flightOffer;
  final MyMarkup myMarkup;

  @override
  State<OfferFareTogglerTile> createState() => _OfferFareTogglerTileState();
}

class _OfferFareTogglerTileState extends State<OfferFareTogglerTile> {
  bool offerFare = false;
  @override
  Widget build(BuildContext context) => Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.success.withValues(alpha: 0.9),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppHelpers.svgAsset(
                    assetName: 'offerIcon',
                    isIcon: true,
                    color: AppColors.white),
              ),
            ),
            title: const Text('Offer Fare',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )),
            subtitle:
                const Text('By enabling this, you may not get your commission',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.grey,
                    )),
            trailing: ScaleTransition(
              scale: const AlwaysStoppedAnimation<double>(0.7),
              child: CupertinoSwitch(
                  value: offerFare,
                  onChanged: (value) async {
                    await HapticFeedback.lightImpact();
                    setState(() {
                      offerFare = value;
                    });
                    if (widget.onToggle != null) {
                      widget.onToggle!(value);
                    }
                  }),
            ),
          ),
          // PriceDetailsSheet(
          //   offerFareEnabled: offerFare,
          //   flightOffer: widget.flightOffer,
          //   myMarkup: widget.myMarkup,
          // )
        ],
      );
}
