import 'package:flapkap_task/core/theming/colors.dart';
import 'package:flapkap_task/core/theming/styles.dart';
import 'package:flutter/material.dart';
class SummaryRowView extends StatelessWidget {
  const SummaryRowView({super.key, required this.label, required this.value});
final String label,value;
  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
              style:TextStyles.font14DarkBlueBold.copyWith(color: ColorsManager.gray)
          ),
          Text(
            value,
            style:TextStyles.font14DarkBlueBold.copyWith(color: ColorsManager.mainBlue)
          ),
        ],
      ),
    );;
  }
}
