import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
class RoundedTextCardView extends StatelessWidget {
  const RoundedTextCardView({super.key, required this.title});
final String title;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
          color: ColorsManager.darkBlue ,
          borderRadius: BorderRadius.circular(6.r)
      ),
      child: Text(
         title,
          style: TextStyles.font12GrayMedium.copyWith(color:title=='RETURNED'? ColorsManager.red:ColorsManager.white)
      ),
    );
  }
}
