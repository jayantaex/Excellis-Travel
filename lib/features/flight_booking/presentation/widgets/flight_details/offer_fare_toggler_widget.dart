import 'package:excellistravel/features/wallet_management/wallet_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../utils/app_helpers.dart';
import '../../../data/models/flight_offer_price_model.dart';
import 'pricing_details.dart';

class OfferFareTogglerWidget extends StatefulWidget {
  const OfferFareTogglerWidget(
      {super.key,
      this.onToggle,
      required this.flightOffer,
      this.myMarkup,
      required this.walletBalance});
  final Function(bool)? onToggle;
  final FlightOffer flightOffer;
  final MyMarkup? myMarkup;
  final double walletBalance;

  @override
  State<OfferFareTogglerWidget> createState() => _OfferFareTogglerWidgetState();
}

class _OfferFareTogglerWidgetState extends State<OfferFareTogglerWidget> {
  bool offerFare = false;
  @override
  Widget build(BuildContext context) {
    final bool isDark = AppHelpers.isDarkMode(context);
    return Column(
      children: [
        if (widget.myMarkup != null)
          ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.success.withValues(alpha: 0.9),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    AppHelpers.svgAsset(assetName: 'offerIcon', isIcon: true),
              ),
            ),
            title: Text('Offer Fare',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.white : AppColors.textPrimary,
                )),
            subtitle: Text('By enabling this, you may not get your commission',
                style: TextStyle(
                  fontSize: 12,
                  color: isDark
                      ? AppColors.white.withValues(alpha: 0.7)
                      : AppColors.grey,
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
        const SizedBox(height: 16),
        ListTile(
          onTap: () {
            context.pushNamed(WalletModule.wallet);
          },
          leading:
              AppHelpers.assetImage(assetName: 'wallet', height: 25, width: 25),
          title: Text(
            ' Excellis Wallet',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? AppColors.white : AppColors.textPrimary,
            ),
          ),
          subtitle: Text(
            'Available Balance ₹${widget.walletBalance} ',
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: widget.walletBalance > 20000
                    ? AppColors.success
                    : AppColors.error),
          ),
          trailing: const Icon(Icons.arrow_forward_ios,
              size: 16, color: AppColors.grey),
        ),
        const SizedBox(height: 16),
        PricingDetails(
          offerFareEnabled: offerFare,
          flightOffer: widget.flightOffer,
          myMarkup: widget.myMarkup,
        )
      ],
    );
  }
}
