// import 'package:flutter/material.dart';
// import '../constants/app_styles.dart';

// class LoadingWidget extends StatelessWidget {

//   const LoadingWidget({
//     super.key,
//     this.message,
//     this.size = 50.0,
//     this.color,
//   });
//   final String? message;
//   final double size;
//   final Color? color;

//   @override
//   Widget build(BuildContext context) => Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           SizedBox(
//             width: size,
//             height: size,
//             child: CircularProgressIndicator(
//               color: color ?? AppColors.primary,
//               strokeWidth: 3.0,
//             ),
//           ),
//           if (message != null) ...<Widget>[
//             const SizedBox(height: AppSizes.md),
//             Text(
//               message!,
//               style: AppTextStyles.bodyMedium.copyWith(
//                 color: AppColors.textSecondary,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ],
//         ],
//       ),
//     );
// }

// class EmptyStateWidget extends StatelessWidget {

//   const EmptyStateWidget({
//     super.key,
//     required this.title,
//     this.subtitle,
//     this.icon,
//     this.action,
//     this.iconSize = 80.0,
//   });
//   final String title;
//   final String? subtitle;
//   final IconData? icon;
//   final Widget? action;
//   final double iconSize;

//   @override
//   Widget build(BuildContext context) => Center(
//       child: Padding(
//         padding: const EdgeInsets.all(AppSizes.lg),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             if (icon != null) ...<Widget>[
//               Icon(
//                 icon,
//                 size: iconSize,
//                 color: AppColors.textHint,
//               ),
//               const SizedBox(height: AppSizes.lg),
//             ],
//             Text(
//               title,
//               style: AppTextStyles.h4.copyWith(
//                 color: AppColors.textSecondary,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             if (subtitle != null) ...<Widget>[
//               const SizedBox(height: AppSizes.sm),
//               Text(
//                 subtitle!,
//                 style: AppTextStyles.bodyMedium.copyWith(
//                   color: AppColors.textHint,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//             if (action != null) ...<Widget>[
//               const SizedBox(height: AppSizes.xl),
//               action!,
//             ],
//           ],
//         ),
//       ),
//     );
// }

// class ErrorWidget extends StatelessWidget {

//   const ErrorWidget({
//     super.key,
//     required this.message,
//     this.onRetry,
//     this.retryText,
//   });
//   final String message;
//   final VoidCallback? onRetry;
//   final String? retryText;

//   @override
//   Widget build(BuildContext context) => Center(
//       child: Padding(
//         padding: const EdgeInsets.all(AppSizes.lg),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Icon(
//               Icons.error_outline,
//               size: 80,
//               color: AppColors.error,
//             ),
//             const SizedBox(height: AppSizes.lg),
//             Text(
//               'Oops! Something went wrong',
//               style: AppTextStyles.h4.copyWith(
//                 color: AppColors.textSecondary,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: AppSizes.sm),
//             Text(
//               message,
//               style: AppTextStyles.bodyMedium.copyWith(
//                 color: AppColors.textHint,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             if (onRetry != null) ...<Widget>[
//               const SizedBox(height: AppSizes.xl),
//               ElevatedButton.icon(
//                 onPressed: onRetry,
//                 icon: const Icon(Icons.refresh),
//                 label: Text(retryText ?? 'Retry'),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
// }

// class CustomButton extends StatelessWidget {

//   const CustomButton({
//     super.key,
//     required this.text,
//     this.onPressed,
//     this.isLoading = false,
//     this.isOutlined = false,
//     this.icon,
//     this.backgroundColor,
//     this.textColor,
//     this.width,
//     this.height = AppSizes.buttonHeight,
//     this.padding,
//   });
//   final String text;
//   final VoidCallback? onPressed;
//   final bool isLoading;
//   final bool isOutlined;
//   final IconData? icon;
//   final Color? backgroundColor;
//   final Color? textColor;
//   final double? width;
//   final double height;
//   final EdgeInsetsGeometry? padding;

//   @override
//   Widget build(BuildContext context) {
//     final Widget child = isLoading
//         ? const SizedBox(
//             width: 20,
//             height: 20,
//             child: CircularProgressIndicator(
//               strokeWidth: 2,
//               valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
//             ),
//           )
//         : Row(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               if (icon != null) ...<Widget>[
//                 Icon(icon, size: AppSizes.iconSm),
//                 const SizedBox(width: AppSizes.sm),
//               ],
//               Text(text),
//             ],
//           );

//     if (isOutlined) {
//       return SizedBox(
//         width: width,
//         height: height,
//         child: OutlinedButton(
//           onPressed: isLoading ? null : onPressed,
//           style: OutlinedButton.styleFrom(
//             foregroundColor: textColor ?? AppColors.primary,
//             side: BorderSide(color: backgroundColor ?? AppColors.primary),
//             padding: padding,
//           ),
//           child: child,
//         ),
//       );
//     }

//     return SizedBox(
//       width: width,
//       height: height,
//       child: ElevatedButton(
//         onPressed: isLoading ? null : onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: backgroundColor ?? AppColors.primary,
//           foregroundColor: textColor ?? AppColors.white,
//           padding: padding,
//         ),
//         child: child,
//       ),
//     );
//   }
// }

// class CustomTextField extends StatelessWidget {

//   const CustomTextField({
//     super.key,
//     this.label,
//     this.hint,
//     this.controller,
//     this.validator,
//     this.keyboardType,
//     this.obscureText = false,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.maxLines = 1,
//     this.enabled = true,
//     this.onChanged,
//     this.onSubmitted,
//     this.focusNode,
//   });
//   final String? label;
//   final String? hint;
//   final TextEditingController? controller;
//   final String? Function(String?)? validator;
//   final TextInputType? keyboardType;
//   final bool obscureText;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final int? maxLines;
//   final bool enabled;
//   final Function(String)? onChanged;
//   final Function(String)? onSubmitted;
//   final FocusNode? focusNode;

//   @override
//   Widget build(BuildContext context) => TextFormField(
//       controller: controller,
//       validator: validator,
//       keyboardType: keyboardType,
//       obscureText: obscureText,
//       maxLines: maxLines,
//       enabled: enabled,
//       onChanged: onChanged,
//       onFieldSubmitted: onSubmitted,
//       focusNode: focusNode,
//       decoration: InputDecoration(
//         labelText: label,
//         hintText: hint,
//         prefixIcon: prefixIcon,
//         suffixIcon: suffixIcon,
//       ),
//     );
// }

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

//   const CustomAppBar({
//     super.key,
//     required this.title,
//     this.actions,
//     this.leading,
//     this.automaticallyImplyLeading = true,
//     this.backgroundColor,
//     this.foregroundColor,
//     this.elevation = 0,
//   });
//   final String title;
//   final List<Widget>? actions;
//   final Widget? leading;
//   final bool automaticallyImplyLeading;
//   final Color? backgroundColor;
//   final Color? foregroundColor;
//   final double elevation;

//   @override
//   Widget build(BuildContext context) => AppBar(
//       title: Text(title),
//       actions: actions,
//       leading: leading,
//       automaticallyImplyLeading: automaticallyImplyLeading,
//       backgroundColor: backgroundColor ?? AppColors.primary,
//       foregroundColor: foregroundColor ?? AppColors.white,
//       elevation: elevation,
//       centerTitle: true,
//     );

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }

// class CustomCard extends StatelessWidget {

//   const CustomCard({
//     super.key,
//     required this.child,
//     this.padding,
//     this.margin,
//     this.color,
//     this.elevation,
//     this.onTap,
//   });
//   final Widget child;
//   final EdgeInsetsGeometry? padding;
//   final EdgeInsetsGeometry? margin;
//   final Color? color;
//   final double? elevation;
//   final VoidCallback? onTap;

//   @override
//   Widget build(BuildContext context) {
//     final Widget card = Card(
//       color: color,
//       elevation: elevation,
//       margin: margin ?? const EdgeInsets.all(AppSizes.sm),
//       child: Padding(
//         padding: padding ?? const EdgeInsets.all(AppSizes.md),
//         child: child,
//       ),
//     );

//     if (onTap != null) {
//       return InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(AppSizes.radiusMd),
//         child: card,
//       );
//     }

//     return card;
//   }
// }
