import 'package:dotted_border/dotted_border.dart';
import 'package:excellistravel/core/utils/app_helpers.dart';
import 'package:excellistravel/core/widgets/app_custom_appbar.dart';
import 'package:excellistravel/core/widgets/app_gradient_bg.dart';
import 'package:excellistravel/core/widgets/trans_white_bg_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../data/search_data.dart';
import 'flight_details_feature_card.dart';

class FlightDetailsScreen extends StatefulWidget {
  const FlightDetailsScreen({super.key});

  @override
  State<FlightDetailsScreen> createState() => _FlightDetailsScreenState();
}

class _FlightDetailsScreenState extends State<FlightDetailsScreen> {
  final SearchData _searchData = SearchData();
  String seletedTab = 'Economy';
  List<String> classList = [
    'Economy',
    'Business Class',
    'First Class',
  ];

  @override
  Widget build(BuildContext context) {
    double width = AppHelpers.getScreenWidth(context);

    final data = _searchData.ticketData[0];
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
                    padding: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          DottedBorder(
                            dashPattern: const [8, 4],
                            customPath: (size) => Path()
                              ..moveTo(0, size.height)
                              ..relativeLineTo(size.width, 0),
                            color: AppColors.grey,
                            strokeWidth: 0.5,
                            padding: const EdgeInsets.only(bottom: 5),
                            child: ListTile(
                              leading: AppHelpers.assetImage(
                                  assetName: 'indigo', ext: 'png'),
                              title: const Text(
                                'Indigo',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                              subtitle: const Text(
                                '6E2119 | Airbus A321-200',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.grey),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          DottedBorder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            dashPattern: const [8, 4],
                            customPath: (size) => Path()
                              ..moveTo(0, size.height)
                              ..relativeLineTo(size.width, 0),
                            color: AppColors.grey,
                            strokeWidth: 0.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    height: 90,
                                    width: width * 0.25,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('06.15',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w600)),
                                        Text(
                                          AppHelpers.formatDateTime(
                                              DateTime.now(),
                                              pattern: 'dd MMM, yyyy'),
                                          style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.grey),
                                        ),
                                        const Text(
                                          'Kolkata (CCU)',
                                          style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.grey),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                    width: width * 0.25,
                                    child: Column(
                                      children: [
                                        AppHelpers.svgAsset(
                                            assetName: 'flight', width: 100),
                                        Text(
                                          getDuration(min: data.duration!),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  height: 90,
                                  width: width * 0.25,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      const Text('09.40',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600)),
                                      Text(
                                        AppHelpers.formatDateTime(
                                            DateTime.now(),
                                            pattern: 'dd MMM, yyyy'),
                                        style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.grey),
                                      ),
                                      const Text(
                                        'Delhi (DEL)',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ListTile(
                            leading: AppHelpers.svgAsset(
                                assetName: 'from', isIcon: true),
                            title: const Text(
                              'Apparture Airport',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: const Text(
                              'Netaji Subhash Chandra Bose International Airport (CCU)',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey),
                            ),
                          ),
                          ListTile(
                            leading: AppHelpers.svgAsset(
                                assetName: 'to', isIcon: true),
                            title: const Text(
                              'Departure Airport',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: const Text(
                              'Indira Gandhi International Airport (DEL)',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            height: 45,
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(
                                width: 1,
                                color: AppColors.grey.withOpacity(0.2),
                              ),
                            ),
                            width: AppHelpers.getScreenWidth(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ...classList.map((e) => InkWell(
                                      onTap: () {
                                        setState(() {
                                          seletedTab = e;
                                        });
                                      },
                                      child: Container(
                                        height: 45,
                                        width: width / classList.length - 20,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: seletedTab == e
                                              ? AppColors.black
                                              : null,
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        child: Text(
                                          e,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: seletedTab == e
                                                ? AppColors.white
                                                : AppColors.black,
                                            fontSize: 14,
                                            fontWeight: seletedTab == e
                                                ? FontWeight.w500
                                                : FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: FlightDetailsFeatureCard(),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: FlightDetailsFeatureCard(),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: FlightDetailsFeatureCard(),
                          ),
                          const SizedBox(height: 45),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

getDuration({required int min}) {
  String hours = (min / 60).floor().toString();
  String minutes = (min % 60).toString();
  return '${hours}h ${minutes}m';
}
