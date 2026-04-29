import 'package:flutter/material.dart';
import 'package:flutter_complete_course/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class OnboardingLogo extends StatelessWidget {
  const OnboardingLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svgs/Group 93.svg' , height: 50.h, width: 50.w),
        Gap(10.w),
        Text('DocEase', style: TextStyles.font24BlackBold),
      ],
    );
  }
}
