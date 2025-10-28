import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';
import 'add_passenger_sheet.dart';

class PassengerDetailsCard extends StatelessWidget {
  const PassengerDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          const ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text('Adult (00/01)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                )),
            subtitle: Text('Age 12 years or above',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w400,
                )),
            trailing: CircleAvatar(
                child: Icon(Icons.add, color: AppColors.secondary)),
          ),
          const SizedBox(height: 10),
          const ListTile(
            contentPadding: EdgeInsets.all(0),
            title: Text('Child (00/01)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                )),
            subtitle: Text('Between age 2 to 12 years',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w400,
                )),
            trailing: CircleAvatar(
                child: Icon(Icons.add, color: AppColors.secondary)),
          ),
          const SizedBox(height: 10),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: const Text('Infant (00/01)',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                )),
            subtitle: const Text('Between age 15 days to 2 years',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.grey,
                  fontWeight: FontWeight.w400,
                )),
            trailing: InkWell(
              onTap: () {
                showAddPassengerSheet(context: context);
              },
              child: const CircleAvatar(
                  child: Icon(Icons.add, color: AppColors.secondary)),
            ),
          ),
        ],
      ),
    );
  }
}
