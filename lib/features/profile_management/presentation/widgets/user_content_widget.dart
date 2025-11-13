import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';

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
            CircleAvatar(
                radius: 45,
                child: Text(userName.substring(0, 1),
                    style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 45,
                      fontWeight: FontWeight.w600,
                    ))),
            const SizedBox(height: 6),
            Text(
              userName,
              style: const TextStyle(fontSize: 16, color: AppColors.white),
            )
          ],
        ),
      );
}
