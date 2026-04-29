import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_course/core/Shared/app_text_button.dart';
import 'package:flutter_complete_course/core/theming/styles.dart';
import 'package:flutter_complete_course/core/Shared/app_text_formfield.dart';
import 'package:flutter_complete_course/features/login/data/models/login_requst_body.dart';
import 'package:flutter_complete_course/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_course/features/sign_up/ui/widgets/aleardy_have_account_text.dart';
import 'package:flutter_complete_course/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:flutter_complete_course/features/login/ui/widgets/email_and_password_form.dart';
import 'package:flutter_complete_course/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:flutter_complete_course/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  Column(
                    children: [
                      const EmailAndPasswordForm(),
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
                        onPressed: () {
                          validateThenDoLogin(context);
                        },
                      ),
                      Gap(16.h),
                      const TermsAndConditionsText(),
                      Gap(60.h),
                      const DontHaveAccountText(),
                      const LoginBlocListener(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
