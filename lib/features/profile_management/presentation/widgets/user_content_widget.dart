import 'package:excellistravel/utils/title_case.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';
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
              toTitleCase(userName),
              style: const TextStyle(fontSize: 16, color: AppColors.white),
            )
          ],
        ),
      );
}
