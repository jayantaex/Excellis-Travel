import 'package:flutter/material.dart';

import '../../../../core/constants/app_styles.dart';
import '../../../../utils/app_helpers.dart';
import 'profile_avatar_widget.dart';

class UserContentWidget extends StatelessWidget {
  const UserContentWidget(
      {super.key, required this.userName, required this.userImage});
  final String userName;
  final String userImage;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          children: <Widget>[
            ProfileAvatarWidget(
              isEditable: false,
            ),
            const SizedBox(height: 6),
            Text(
              userName,
              style: TextStyle(
                  fontSize: 16,
                  color: AppHelpers.isDarkMode(context)
                      ? AppColors.white
                      : AppColors.black),
            )
          ],
        ),
      );
}
