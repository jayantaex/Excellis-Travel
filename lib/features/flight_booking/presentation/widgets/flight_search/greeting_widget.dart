import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_styles.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../../notifiaction/notification_module.dart';
import '../../../../profile_management/bloc/profile_bloc.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: AppHelpers.getScreenWidth(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: AppHelpers.getScreenWidth(context) * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocConsumer<ProfileBloc, ProfileState>(
                      listener: (context, state) {
                        if (state is ProfileError) {}
                      },
                      builder: (BuildContext context, ProfileState state) =>
                          state is ProfileLoaded
                              ? Text(
                                  '${getDayTime()}, ${state.profileData.firstName ?? ''}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white),
                                )
                              : Text(
                                  '${getDayTime()}, Guest',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.white),
                                )),
                  const Text(
                    'Let’s Explore \nWorld With Us !',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  )
                ],
              ),
            ),
            CircleAvatar(
              backgroundColor: AppColors.white.withOpacity(0.2),
              child: IconButton(
                  onPressed: () {
                    context.pushNamed(NotificationModule.routeName);
                  },
                  icon: const Icon(
                    Icons.notifications_none_rounded,
                    color: AppColors.white,
                  )),
            )
          ],
        ),
      );
}

String getDayTime() {
  final DateTime now = DateTime.now();
  final int hour = now.hour;
  if (hour < 12) {
    return 'Good Morning';
  } else if (hour < 17) {
    return 'Good Afternoon';
  } else {
    return 'Good Evening';
  }
}
