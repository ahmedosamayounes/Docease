import 'package:flutter/material.dart';
import 'package:flutter_complete_course/core/theming/styles.dart';
import 'package:flutter_complete_course/features/onboarding/widgets/onboarding_button.dart';
import 'package:flutter_complete_course/features/onboarding/widgets/onboarding_content.dart';
import 'package:flutter_complete_course/features/onboarding/widgets/onboarding_logo.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
            child: Column(
              children: [
                const OnboardingLogo(),
                Gap(30.h),
                const OnboardingContent(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      Text(
                        'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                        style: TextStyles.font13GreyRegular,
                        textAlign: TextAlign.center,
                      ),
                      Gap(30.h),
                      OnboardingButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
