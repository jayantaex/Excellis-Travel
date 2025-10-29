import 'package:excellistravel/core/utils/app_helpers.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../../../../core/widgets/trans_white_bg_widget.dart';

class BookingPolicy extends StatelessWidget {
  const BookingPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBg(
        child: TransWhiteBgWidget(
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
                  child: AppCustomAppbar(
                    centerTitle: 'Booking Policies',
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.only(top: 24),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(32),
                      topEnd: Radius.circular(32),
                    ),
                    color: AppColors.white,
                  ),
                  child: DefaultTabController(
                    initialIndex: 1,
                    length: 3,
                    child: Scaffold(
                        backgroundColor: Colors.transparent,
                        appBar: AppBar(
                          toolbarHeight: 10,
                          bottom: TabBar(
                            indicatorSize: TabBarIndicatorSize.tab,
                            dividerColor: AppColors.grey.withOpacity(0.2),
                            indicatorColor: AppColors.primary,
                            overlayColor: const WidgetStatePropertyAll(
                                Colors.transparent),
                            labelColor: AppColors.primary,
                            labelStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            unselectedLabelColor: AppColors.grey,
                            unselectedLabelStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            tabs: const <Widget>[
                              Tab(
                                text: 'Cancellation',
                              ),
                              Tab(
                                text: 'Date Change',
                              ),
                              Tab(
                                text: 'Baggage',
                              ),
                            ],
                          ),
                        ),
                        body: const TabBarView(
                          children: <Widget>[
                            CancellationWidget(),
                            DateChange(),
                            Baggage(),
                          ],
                        )),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CancellationWidget extends StatelessWidget {
  const CancellationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading:
              AppHelpers.assetImage(assetName: 'indigo', width: 35, height: 35),
          title: const Text(
            'Indigo',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          subtitle: const Text(
            'DEL - BOM',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
          ),
        ),
        const Divider(),
        const ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          title: Text(
            'Time frame',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            'From scheduled flight departure',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
          ),
          trailing: Text(
            'Airline Fee / passenger',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '00 to 04 hours *',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              Text(
                'Not Refundable (ADULT)',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '04 hours to 04 days *',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              Text(
                '5349 + 1000 (ADULT)',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '04 days to 365 days *',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              Text(
                '4279 + 1000 (ADULT)',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          padding: const EdgeInsets.all(8),
          width: AppHelpers.getScreenWidth(context),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: RichText(
            text: const TextSpan(
              text: 'Note: ',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.error,
              ),
              children: <TextSpan>[
                TextSpan(
                  text:
                      'To Code. Flutter, Android Developer, Full Stack Developer, Web Dev.Love to experiment with Java, Python, NodeJS, Kotlin, etc.,Welcome to here, If you like my articles and work consider buying me a coffee so it will encourage me to write and contribute moreIf you like my work and want me to work in your project I am open to freelance',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class DateChange extends StatelessWidget {
  const DateChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading:
              AppHelpers.assetImage(assetName: 'indigo', width: 35, height: 35),
          title: const Text(
            'Indigo',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          subtitle: const Text(
            'DEL - BOM',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
          ),
        ),
        const Divider(),
        const ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          title: Text(
            'Time frame',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            'From scheduled flight departure',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
          ),
          trailing: Text(
            'Airline Fee + Fare difference/ passenger',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '00 to 04 hours *',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              Text(
                'Not Changable',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '04 hours to 04 days *',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              Text(
                '2999 + 1000 + fare difference (ADULT)',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '04 days to 365 days *',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
              Text(
                '0 + 0  fare difference (ADULT)',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          padding: const EdgeInsets.all(8),
          width: AppHelpers.getScreenWidth(context),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: RichText(
            text: const TextSpan(
              text: 'Note: ',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.error,
              ),
              children: <TextSpan>[
                TextSpan(
                  text:
                      'To Code. Flutter, Android Developer, Full Stack Developer, Web Dev.Love to experiment with Java, Python, NodeJS, Kotlin, etc.,Welcome to here, If you like my articles and work consider buying me a coffee so it will encourage me to write and contribute moreIf you like my work and want me to work in your project I am open to freelance',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Baggage extends StatelessWidget {
  const Baggage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading:
              AppHelpers.assetImage(assetName: 'indigo', width: 35, height: 35),
          title: const Text(
            'Indigo',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          subtitle: const Text(
            'DEL - BOM',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: AppHelpers.getScreenWidth(context) * 0.25,
                child: const Text(''),
              ),
              SizedBox(
                width: AppHelpers.getScreenWidth(context) * 0.25,
                child: const Text(
                  'Cabin',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                width: AppHelpers.getScreenWidth(context) * 0.25,
                child: const Text(
                  'Checke -in',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: AppHelpers.getScreenWidth(context) * 0.25,
                child: const Text(
                  'Adult',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
              ),
              SizedBox(
                width: AppHelpers.getScreenWidth(context) * 0.25,
                child: const Text(
                  '7Kgs',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
              ),
              SizedBox(
                width: AppHelpers.getScreenWidth(context) * 0.25,
                child: const Text(
                  '30Kgs',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          padding: const EdgeInsets.all(8),
          width: AppHelpers.getScreenWidth(context),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: RichText(
            text: const TextSpan(
              text: 'Note: ',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.error,
              ),
              children: <TextSpan>[
                TextSpan(
                  text:
                      'To Code. Flutter, Android Developer, Full Stack Developer, Web Dev.Love to experiment with Java, Python, NodeJS, Kotlin, etc.,Welcome to here, If you like my articles and work consider buying me a coffee so it will encourage me to write and contribute moreIf you like my work and want me to work in your project I am open to freelance',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
