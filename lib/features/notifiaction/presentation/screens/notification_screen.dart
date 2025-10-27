import 'package:excellistravel/core/utils/app_helpers.dart';
import 'package:excellistravel/core/widgets/app_custom_appbar.dart';
import 'package:excellistravel/core/widgets/app_gradient_bg.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../widgets/notification_details_sheet.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final List<Map<String, dynamic>> notifications = [
    {
      'id': '1',
      'title': 'Flight Booking Confirmed',
      'details':
          'Your flight to New York has been confirmed. Check-in opens 24 hours before departure.',
      'createdAt': DateTime.now().subtract(const Duration(hours: 2)),
      'isRead': false,
      'type': 'booking',
      'icon': '✈️',
    },
    {
      'id': '2',
      'title': 'Price Drop Alert',
      'details': 'The price for your watched route (LAX → SFO) dropped by 20%.',
      'createdAt': DateTime.now().subtract(const Duration(days: 1)),
      'isRead': true,
      'type': 'alert',
      'icon': '💸',
    },
    {
      'id': '3',
      'title': 'Check-in Reminder',
      'details': 'Your flight to London opens for check-in in 3 hours.',
      'createdAt': DateTime.now().subtract(const Duration(minutes: 45)),
      'isRead': false,
      'type': 'reminder',
      'icon': '⏰',
    },
    {
      'id': '4',
      'title': 'Loyalty Points Updated',
      'details': 'You earned 1,200 points from your recent trip.',
      'createdAt': DateTime.now().subtract(const Duration(days: 3)),
      'isRead': true,
      'type': 'reward',
      'icon': '⭐',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBg(
          child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: AppCustomAppbar(
                centerTitle: 'Notification',
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                margin: const EdgeInsets.only(top: 24),
                width: AppHelpers.getScreenWidth(context),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (_, index) => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: notifications[index]['isRead']
                          ? AppColors.white
                          : AppColors.primary.withOpacity(0.1),
                    ),
                    child: ListTile(
                      onTap: () {
                        showNotificationDetailsSheet(
                          body: notifications[index]['details'],
                          context: context,
                          title: notifications[index]['title'],
                        );
                      },
                      contentPadding: const EdgeInsets.all(0),
                      leading: const CircleAvatar(
                        child: Icon(Icons.notifications),
                      ),
                      title: Text(
                        '${notifications[index]['title']}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        notifications[index]['details'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, color: AppColors.grey),
                      ),
                      trailing: Text(
                        getDelay(createdAt: notifications[index]['createdAt']),
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

String getDelay({required DateTime createdAt}) {
  final now = DateTime.now();
  int hr = now.difference(createdAt).inHours;
  int min = now.difference(createdAt).inMinutes;
  int sec = now.difference(createdAt).inSeconds;
  if (hr > 0) {
    return '$hr hr ago';
  } else if (min > 0) {
    return '$min min ago';
  } else {
    return '$sec sec ago';
  }
}
