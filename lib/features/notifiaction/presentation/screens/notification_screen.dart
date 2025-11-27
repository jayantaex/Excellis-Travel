import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/widgets/app_custom_appbar.dart';
import '../../../../core/widgets/app_gradient_bg.dart';
import '../widgets/notification_details_sheet.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final List<Map<String, dynamic>> notifications = <Map<String, dynamic>>[
    <String, dynamic>{
      'id': '1',
      'title': 'Flight Booking Confirmed',
      'details':
          'Your flight to New York has been confirmed. Check-in opens 24 hours before departure.',
      'createdAt': DateTime.now().subtract(const Duration(hours: 2)),
      'isRead': false,
      'type': 'booking',
      'icon': Icons.flight_takeoff_rounded,
      'color': AppColors.primary,
    },
    <String, dynamic>{
      'id': '2',
      'title': 'Price Drop Alert',
      'details': 'The price for your watched route (LAX → SFO) dropped by 20%.',
      'createdAt': DateTime.now().subtract(const Duration(days: 1)),
      'isRead': true,
      'type': 'alert',
      'icon': Icons.trending_down_rounded,
      'color': Colors.green,
    },
    <String, dynamic>{
      'id': '3',
      'title': 'Check-in Reminder',
      'details': 'Your flight to London opens for check-in in 3 hours.',
      'createdAt': DateTime.now().subtract(const Duration(minutes: 45)),
      'isRead': false,
      'type': 'reminder',
      'icon': Icons.access_time_rounded,
      'color': Colors.orange,
    },
    <String, dynamic>{
      'id': '4',
      'title': 'Loyalty Points Updated',
      'details': 'You earned 1,200 points from your recent trip.',
      'createdAt': DateTime.now().subtract(const Duration(days: 3)),
      'isRead': true,
      'type': 'reward',
      'icon': Icons.stars_rounded,
      'color': Colors.amber,
    },
    <String, dynamic>{
      'id': '5',
      'title': 'Payment Successful',
      'details': 'Your payment of ₹45,000 has been processed successfully.',
      'createdAt': DateTime.now().subtract(const Duration(hours: 5)),
      'isRead': false,
      'type': 'payment',
      'icon': Icons.check_circle_rounded,
      'color': Colors.teal,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final unreadCount = notifications.where((n) => n['isRead'] == false).length;

    return Scaffold(
      body: AppGradientBg(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AppCustomAppbar(
                  centerTitle: 'Notifications',
                  trailing: unreadCount > 0
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.error,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            '$unreadCount new',
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  width: AppHelpers.getScreenWidth(context),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: notifications.isEmpty
                      ? _buildEmptyState()
                      : ListView.separated(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          itemCount: notifications.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          itemBuilder: (_, int index) => _buildNotificationCard(
                            context,
                            notifications[index],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationCard(
      BuildContext context, Map<String, dynamic> notification) {
    final bool isRead = notification['isRead'] as bool;
    final Color notificationColor = notification['color'] as Color;
    final IconData notificationIcon = notification['icon'] as IconData;

    return InkWell(
      onTap: () {
        showNotificationDetailsSheet(
          body: notification['details'],
          context: context,
          title: notification['title'],
          icon: notificationIcon,
          color: notificationColor,
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isRead ? AppColors.white : notificationColor.withOpacity(0.05),
          border: Border.all(
            color: isRead
                ? AppColors.grey.withOpacity(0.2)
                : notificationColor.withOpacity(0.3),
            width: 1,
          ),
          boxShadow: isRead
              ? []
              : [
                  BoxShadow(
                    color: notificationColor.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon Container
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: notificationColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                notificationIcon,
                color: notificationColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          notification['title'],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight:
                                isRead ? FontWeight.w500 : FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      if (!isRead)
                        Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            color: notificationColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    notification['details'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.grey.withOpacity(0.9),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        size: 14,
                        color: AppColors.grey.withOpacity(0.6),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        getDelay(createdAt: notification['createdAt']),
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.grey.withOpacity(0.8),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.notifications_off_outlined,
                size: 60,
                color: AppColors.grey.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'No Notifications',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'You\'re all caught up!\nWe\'ll notify you when something new arrives.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.grey.withOpacity(0.8),
                height: 1.5,
              ),
            ),
          ],
        ),
      );
}

String getDelay({required DateTime createdAt}) {
  final DateTime now = DateTime.now();
  final int days = now.difference(createdAt).inDays;
  final int hr = now.difference(createdAt).inHours;
  final int min = now.difference(createdAt).inMinutes;

  if (days > 0) {
    return days == 1 ? '1 day ago' : '$days days ago';
  } else if (hr > 0) {
    return hr == 1 ? '1 hour ago' : '$hr hours ago';
  } else if (min > 0) {
    return min == 1 ? '1 min ago' : '$min mins ago';
  } else {
    return 'Just now';
  }
}
