import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reiselab/core/constants/app_constants.dart';
import 'package:reiselab/core/constants/app_styles.dart';
import 'package:reiselab/core/utils/app_helpers.dart';
import 'package:reiselab/core/widgets/primary_input.dart';

import '../../../../core/widgets/trans_white_bg_widget.dart';
import '../widgets/greeting_widget.dart';
import '../widgets/seat_type_selection_widget.dart';

class FlightSearchScreen extends StatefulWidget {
  const FlightSearchScreen({super.key});

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

class _FlightSearchScreenState extends State<FlightSearchScreen> {
  DateTime? selectedDate;
  final TextEditingController _travellerController =
      TextEditingController(text: '1');
  final TextEditingController _seatTypeController =
      TextEditingController(text: 'Business');
  String selectedSeatType = 'business';

  Future<void> _pickDate(BuildContext context) async {
    selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
      initialDate: DateTime.now(),
    );
    setState(() {});

    log(selectedDate.toString());
  }

  @override
  Widget build(BuildContext context) {
    return TransWhiteBgWidget(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              //greeting part
              const GreetingWidget(),
              //searching part
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                width: AppHelpers.getScreenWidth(context),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: SizedBox(
                  width: AppHelpers.getScreenWidth(context),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: AppHelpers.getScreenWidth(context),
                        child: Column(
                          children: [
                            AppPrimaryInput(
                              maxCharacters: 10,
                              hint: 'Enter your source',
                              label: 'From',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(
                                  '${AppConstants.assetIcontUrl}from.svg',
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            AppPrimaryInput(
                              maxCharacters: 10,
                              hint: 'Enter your destination',
                              label: 'To',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(
                                  '${AppConstants.assetIcontUrl}to.svg',
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            AppPrimaryInput(
                              controller: TextEditingController(
                                text: AppHelpers.formatDate(
                                    selectedDate ?? DateTime.now(),
                                    pattern: 'E, dd MMM yyyy'),
                              ),
                              enable: false,
                              maxCharacters: 10,
                              hint: 'Pick your departure date',
                              label: 'Departure',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(
                                  '${AppConstants.assetIcontUrl}calender.svg',
                                ),
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 10),
                                child: SizedBox(
                                  width: 140,
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Roundtrip?',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.grey),
                                      ),
                                      SizedBox(
                                        height: 10,
                                        child: CupertinoSwitch(
                                            value: true, onChanged: (value) {}),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black),
                              onTap: () async {
                                await _pickDate(context);
                              },
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: AppHelpers.getScreenWidth(context),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: AppHelpers.getScreenWidth(context) *
                                        0.4,
                                    child: AppPrimaryInput(
                                      keyboardType: TextInputType.number,
                                      controller: _travellerController,
                                      enable: false,
                                      maxCharacters: 2,
                                      hint: '1 Adult',
                                      label: 'Travellers',
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: SvgPicture.asset(
                                          '${AppConstants.assetIcontUrl}users.svg',
                                        ),
                                      ),
                                      suffixIcon: Container(
                                        alignment: Alignment.centerLeft,
                                        width: 100,
                                        child: Text(
                                          _travellerController.text == '1'
                                              ? 'Adult'
                                              : _travellerController.text == ''
                                                  ? ''
                                                  : 'Adults',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black,
                                      ),
                                      onChange: (p0) {
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppHelpers.getScreenWidth(context) *
                                        0.4,
                                    child: AppPrimaryInput(
                                      keyboardType: TextInputType.number,
                                      controller: _travellerController,
                                      enable: false,
                                      maxCharacters: 2,
                                      hint: '1 Adult',
                                      label: 'Travellers',
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: SvgPicture.asset(
                                          '${AppConstants.assetIcontUrl}users.svg',
                                        ),
                                      ),
                                      suffixIcon: Container(
                                        alignment: Alignment.centerLeft,
                                        width: 100,
                                        child: Text(
                                          _travellerController.text == '1'
                                              ? 'Adult'
                                              : _travellerController.text == ''
                                                  ? ''
                                                  : 'Adults',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.black,
                                      ),
                                      onChange: (p0) {
                                        setState(() {});
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        right: 30,
                        top: 40,
                        child: InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                              radius: 24,
                              backgroundColor: AppColors.primary,
                              child: SvgPicture.asset(
                                '${AppConstants.assetIcontUrl}swap.svg',
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
