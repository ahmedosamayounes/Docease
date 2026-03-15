import 'package:flutter/material.dart';
import 'package:flutter_complete_course/core/theming/styles.dart';

class AleardyHaveAccountText extends StatelessWidget {
  const AleardyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(text: ' Sign In', style: TextStyles.font13BlueSemiBold),
        ],
      ),
    );
  }
}
