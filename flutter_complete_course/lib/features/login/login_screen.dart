import 'package:flutter/material.dart';
import 'package:flutter_complete_course/core/Shared/app_text_button.dart';
import 'package:flutter_complete_course/core/theming/styles.dart';
import 'package:flutter_complete_course/core/Shared/app_text_formfield.dart';
import 'package:flutter_complete_course/features/login/widgets/aleardy_have_account_text.dart';
import 'package:flutter_complete_course/features/login/widgets/terms_and_conditions_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final fromKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome Back', style: TextStyles.font24PrimaryBold),
                  Gap(8.h),
                  Text(
                    'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                    style: TextStyles.font15GreyRegular,
                  ),
                  Gap(36.h),
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: Form(
                      key: fromKey,
                      child: Column(
                        children: [
                          AppTextFormField(hintText: "Email"),
                          Gap(20.h),
                          AppTextFormField(
                            hintText: "Password",
                            isObscureText: isObscureText,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isObscureText = !isObscureText;
                                });
                              },
                              child: Icon(
                                isObscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                          Gap(24.h),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Text(
                              'Forgot Password?',
                              style: TextStyles.font13PrimaryRegular,
                            ),
                          ),
                          Gap(40.h),
                          AppTextButton(
                            buttonText: 'Login',
                            textStyle: TextStyles.font16WhiteSemiBold,
                            onPressed: () {},
                          ),
                          Gap(16.h),
                          const TermsAndConditionsText(),
                          Gap(60.h),
                          const AleardyHaveAccountText(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
