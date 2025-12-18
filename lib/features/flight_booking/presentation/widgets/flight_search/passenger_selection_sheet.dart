import 'package:flutter/material.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../utils/app_helpers.dart';
import '../../../../../core/widgets/primary_button.dart';

Future<void> showPassengerSelectionSheet(
    {required BuildContext context,
    required Function(int, int, int) onDone,
    required int adult,
    required int child,
    required int infant}) async {
  showModalBottomSheet(
      backgroundColor: AppHelpers.isDarkMode(context)
          ? AppColors.secondaryDark
          : AppColors.white,
      context: context,
      builder: (context) => PassengerSelectionSheet(
            adult: adult,
            child: child,
            infant: infant,
            onDone: onDone,
          ));
}

class PassengerSelectionSheet extends StatefulWidget {
  const PassengerSelectionSheet(
      {super.key,
      required this.onDone,
      required this.adult,
      required this.child,
      required this.infant});
  final Function(int, int, int) onDone;
  final int adult;
  final int child;
  final int infant;

  @override
  State<PassengerSelectionSheet> createState() =>
      _PassengerSelectionSheetState();
}

class _PassengerSelectionSheetState extends State<PassengerSelectionSheet> {
  int adult = 1;
  int child = 0;
  int infant = 0;

  @override
  void initState() {
    adult = widget.adult;
    child = widget.child;
    infant = widget.infant;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 40),
        width: AppHelpers.getScreenWidth(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 20),
                const Text(
                  'Select Passengers',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close_rounded,
                      color: AppColors.grey,
                    ))
              ],
            ),
            const SizedBox(height: 10),
            const Divider(
              thickness: 0.5,
            ),
            const SizedBox(height: 15),
            ListTile(
              title: Text(
                'Adults',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppHelpers.isDarkMode(context)
                        ? AppColors.white
                        : AppColors.black),
              ),
              subtitle: const Text(
                'Age above 12',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey),
              ),
              trailing: InCrementDecrementButton(
                value: adult,
                onIncrement: () {
                  if (adult < 9) {
                    adult++;
                  }
                  setState(() {});
                },
                onDecrement: () {
                  if (adult > 1) {
                    adult--;
                  }
                  setState(() {});
                },
                title: 'Adult',
                subtitle: 'Age 12 years and above',
              ),
            ),
            ListTile(
              title: Text(
                'Children',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppHelpers.isDarkMode(context)
                        ? AppColors.white
                        : AppColors.black),
              ),
              subtitle: const Text(
                'Age 2 to 12 years',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey),
              ),
              trailing: InCrementDecrementButton(
                value: child,
                onIncrement: () {
                  if (child < 9) {
                    child++;
                  }
                  setState(() {});
                },
                onDecrement: () {
                  if (child > 0) {
                    child--;
                  }
                  setState(() {});
                },
                title: 'Adult',
                subtitle: 'Age above 18',
              ),
            ),
            ListTile(
              title: Text(
                'Infants',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppHelpers.isDarkMode(context)
                        ? AppColors.white
                        : AppColors.black),
              ),
              subtitle: const Text(
                'Age below 2 years',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey),
              ),
              trailing: InCrementDecrementButton(
                value: infant,
                onIncrement: () {
                  if (infant < 9) {
                    if (infant < adult) {
                      infant++;
                    }
                  }
                  setState(() {});
                },
                onDecrement: () {
                  if (infant > 0) {
                    infant--;
                  }
                  setState(() {});
                },
                title: 'Adult',
                subtitle: 'Age above 18',
              ),
            ),
            const SizedBox(height: 55),
            SizedBox(
              height: 50,
              width: AppHelpers.getScreenWidth(context),
              child: AppPrimaryButton(
                bgColor: AppHelpers.isDarkMode(context)
                    ? AppColors.primaryDark
                    : AppColors.black,
                title: 'Done',
                isLoading: false,
                onPressed: () {
                  widget.onDone(adult, child, infant);
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      );
}

class InCrementDecrementButton extends StatelessWidget {
  const InCrementDecrementButton(
      {super.key,
      required this.value,
      required this.onIncrement,
      required this.onDecrement,
      required this.title,
      required this.subtitle});
  final int value;
  final Function() onIncrement;
  final Function() onDecrement;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      width: 120,
      decoration: BoxDecoration(
        color: AppColors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onDecrement,
            child: const SizedBox(
              height: 35,
              width: 35,
              child: Icon(
                Icons.remove,
                size: 18,
              ),
            ),
          ),
          Text(
            '$value',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppHelpers.isDarkMode(context)
                    ? AppColors.primary
                    : AppColors.black),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: onIncrement,
            child: const SizedBox(
              height: 35,
              width: 35,
              child: Icon(
                Icons.add,
                size: 18,
              ),
            ),
          ),
        ],
      ));
}
