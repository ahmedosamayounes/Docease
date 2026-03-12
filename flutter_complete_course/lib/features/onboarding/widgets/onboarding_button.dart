import 'package:flutter/material.dart';
import 'package:flutter_complete_course/core/helpers/extensions.dart';
import 'package:flutter_complete_course/core/routing/routes.dart';
import 'package:flutter_complete_course/core/theming/app_colors.dart';
import 'package:flutter_complete_course/core/theming/styles.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      style: ButtonStyle(
        tapTargetSize:
            MaterialTapTargetSize.shrinkWrap, // remove the default padding
        minimumSize: MaterialStateProperty.all(
          Size(double.infinity, 52),
        ), // set the button to full width and a fixed height
        backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      child: Text('Get Started', style: TextStyles.font16WhiteSemiBold),
    );
  }
}
