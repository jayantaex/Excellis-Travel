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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: Image.asset(
                userImage,
                fit: BoxFit.contain,
              ),
            ),
          ),
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
