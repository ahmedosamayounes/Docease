import 'package:flutter/material.dart';
import '../../../../core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.14, 0.4],
              colors: [Colors.white, Colors.white.withOpacity(0.0)],
            ),
          ),
          child: Image.asset('assets/images/cheerful-happy-doctor-with-crossed-hands-white 2.png'),
        ),
        Positioned(
          bottom: 20.h,
          left: 0,
          right: 0,
          child: Text(
            'Your Trusted \nHealthcare Partner',
            style: TextStyles.font32PrimaryBold.copyWith(height: 1.4.h),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
