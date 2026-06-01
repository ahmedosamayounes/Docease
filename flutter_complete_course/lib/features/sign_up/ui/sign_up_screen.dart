import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/Shared/app_text_button.dart';
import '../../../core/theming/styles.dart';
import 'widgets/aleardy_have_account_text.dart';
import '../../login/ui/widgets/terms_and_conditions_text.dart';
import '../logic/cubit/sign_up_cubit.dart';
import 'widgets/sign_up_bloc_listener.dart';
import 'widgets/sign_up_form.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Join Us Now', style: TextStyles.font24BlueBold),
                Gap(8),
                Text(
                  'Create your profile now to connect with certified doctors, schedule your visits, and take control of your well-being.',
                  style: TextStyles.font14GrayRegular,
                ),
                Gap(36),
                Column(
                  children: [
                    const SignupForm(),
                    Gap(40),
                    AppTextButton(
                      buttonText: "Sign Up",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoSignup(context);
                      },
                    ),
                    Gap(16),
                    const TermsAndConditionsText(),
                    Gap(30),
                    const AlreadyHaveAccountText(),
                    const SignupBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignUpStates();
    }
  }
}
