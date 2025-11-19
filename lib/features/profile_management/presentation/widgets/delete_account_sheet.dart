// import 'package:flutter/material.dart';

// import '../../../../core/constants/app_styles.dart';
// import '../../../../core/utils/app_helpers.dart';
// import '../../../../core/widgets/primary_button.dart';

// Future<void> showDeleteAccountSheet({required BuildContext context}) async {
//   showModalBottomSheet(
//       backgroundColor: AppColors.white,
//       showDragHandle: true,
//       context: context,
//       builder: (BuildContext context) => const DeleteAccountSheet());
// }

// class DeleteAccountSheet extends StatelessWidget {
//   const DeleteAccountSheet({super.key});

//   @override
//   Widget build(BuildContext context) => SizedBox(
//       width: AppHelpers.getScreenWidth(context),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           const Icon(
//             Icons.delete_outline_rounded,
//             size: 52,
//             color: AppColors.primary,
//           ),
//           const Text(
//             'Delete Account',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 8),
//           const Text(
//             'Are you sure you want to delete your account? this action cannot be undone.',
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 55),
//           SizedBox(
//             width: AppHelpers.getScreenWidth(context),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 SizedBox(
//                     width: AppHelpers.getScreenWidth(context) * 0.4,
//                     child: AppPrimaryButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         title: 'Cancel',
//                         isLoading: false)),
//                 SizedBox(
//                     width: AppHelpers.getScreenWidth(context) * 0.4,
//                     child: const AppPrimaryButton(
//                       title: 'Delete',
//                       isLoading: false,
//                       bgColor: AppColors.primary,
//                     ))
//               ],
//             ),
//           ),
//           const SizedBox(height: 35)
//         ],
//       ),
//     );
// }
