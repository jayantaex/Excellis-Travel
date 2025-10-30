import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';

class UserContentWidget extends StatelessWidget {
  final String userName;
  final String userImage;
  const UserContentWidget(
      {super.key, required this.userName, required this.userImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
}
