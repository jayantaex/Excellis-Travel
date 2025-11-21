import 'package:flutter/material.dart';
import '../../../../core/constants/app_styles.dart';

class MyMarkUpCard extends StatelessWidget {
  const MyMarkUpCard({
    super.key,
    required this.id,
    required this.type,
    required this.product,
    required this.unit,
    required this.value,
    required this.createdBy,
    required this.status,
    this.onEdit,
    this.onDelete,
  });
  final String id;
  final String type;
  final String product;
  final String unit;
  final double value;
  final String createdBy;
  final String status;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final bool isActive = status.toLowerCase() == 'active';

    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withOpacity(0.1),
                  AppColors.primary.withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSizes.radiusMd),
                topRight: Radius.circular(AppSizes.radiusMd),
              ),
            ),
            child: Row(
              children: [
                // Product Icon
                Container(
                  padding: const EdgeInsets.all(AppSizes.sm),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                  ),
                  child: Icon(
                    _getProductIcon(),
                    color: AppColors.white,
                    size: AppSizes.iconMd,
                  ),
                ),
                const SizedBox(width: AppSizes.md),
                // Product and Type
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product,
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.sm,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.2),
                          borderRadius:
                              BorderRadius.circular(AppSizes.radiusXs),
                        ),
                        child: Text(
                          type,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Status Badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.sm,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.success.withOpacity(0.15)
                        : AppColors.grey.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                    border: Border.all(
                      color: isActive ? AppColors.success : AppColors.grey,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: isActive ? AppColors.success : AppColors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        status.toUpperCase(),
                        style: AppTextStyles.bodySmall.copyWith(
                          color: isActive ? AppColors.success : AppColors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Commission Value Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.trending_up_rounded,
                      color: AppColors.primary,
                      size: AppSizes.iconLg,
                    ),
                    const SizedBox(width: AppSizes.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Markup',
                                style: AppTextStyles.bodySmall.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                              const SizedBox(width: AppSizes.sm),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: unit.toLowerCase() == 'percentage'
                                      ? AppColors.info.withOpacity(0.15)
                                      : AppColors.success.withOpacity(0.15),
                                  borderRadius:
                                      BorderRadius.circular(AppSizes.radiusXs),
                                ),
                                child: Text(
                                  unit,
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: unit.toLowerCase() == 'percentage'
                                        ? AppColors.info
                                        : AppColors.success,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (unit.toLowerCase() == 'fixed')
                                Text(
                                  '₹',
                                  style: AppTextStyles.h3.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              Text(
                                value.toStringAsFixed(2),
                                style: AppTextStyles.h1.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              if (unit.toLowerCase() == 'percentage')
                                Text(
                                  '%',
                                  style: AppTextStyles.h3.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Divider
                Container(
                  height: 1,
                  color: AppColors.divider,
                ),

                const SizedBox(height: AppSizes.md),

                // Metadata Section
                Row(
                  children: [
                    Expanded(
                      child: _buildMetadataItem(
                        icon: Icons.person_outline_rounded,
                        label: 'Created By',
                        value: createdBy,
                      ),
                    ),
                    Expanded(
                      child: _buildMetadataItem(
                        icon: Icons.tag_rounded,
                        label: 'ID',
                        value: '#$id',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Action Buttons Section
          if (onEdit != null || onDelete != null)
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: AppColors.divider,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  if (onEdit != null)
                    Expanded(
                      child: InkWell(
                        onTap: onEdit,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(AppSizes.radiusMd),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppSizes.md,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.edit_outlined,
                                color: AppColors.primary,
                                size: AppSizes.iconSm,
                              ),
                              const SizedBox(width: AppSizes.sm),
                              Text(
                                'Edit',
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (onEdit != null && onDelete != null)
                    Container(
                      width: 1,
                      height: 48,
                      color: AppColors.divider,
                    ),
                  if (onDelete != null)
                    Expanded(
                      child: InkWell(
                        onTap: onDelete,
                        borderRadius: BorderRadius.only(
                          bottomRight: const Radius.circular(AppSizes.radiusMd),
                          bottomLeft: onEdit == null
                              ? const Radius.circular(AppSizes.radiusMd)
                              : Radius.zero,
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppSizes.md,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.delete_outline_rounded,
                                color: AppColors.error,
                                size: AppSizes.iconSm,
                              ),
                              const SizedBox(width: AppSizes.sm),
                              Text(
                                'Delete',
                                style: AppTextStyles.bodyMedium.copyWith(
                                  color: AppColors.error,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMetadataItem({
    required IconData icon,
    required String label,
    required String value,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 16,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  IconData _getProductIcon() {
    switch (product.toLowerCase()) {
      case 'airline':
      case 'flight':
        return Icons.flight_rounded;
      case 'hotel':
        return Icons.hotel_rounded;
      case 'bus':
        return Icons.directions_bus_rounded;
      case 'train':
        return Icons.train_rounded;
      default:
        return Icons.confirmation_number_rounded;
    }
  }
}
