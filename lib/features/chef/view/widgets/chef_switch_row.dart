import 'package:flutter/material.dart';
import 'package:food/core/utils/app_colors.dart';

class ChefSwitchRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const ChefSwitchRow({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: AppColors.darkBlue),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(color: AppColors.lightSteelBlue, fontSize: 12),
              ),
            ],
          ),
        ),
        Switch.adaptive(
          value: value,
          activeColor: AppColors.orange,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
