import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/cubit/appointment_cubit.dart';
import '../../logic/cubit/appointment_state.dart';

class AppointmentBlocListener extends StatelessWidget {
  const AppointmentBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppointmentCubit, AppointmentState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (appointmentData) {
            showSuccessDialog(context, appointmentData);
          },

          error: (errorMessage) {
            showErrorDialog(context, errorMessage);
          },
          orElse: () {},
        );
      },

      child: const SizedBox.shrink(),
    );
  }

  void showSuccessDialog(BuildContext context, var appointmentData) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle_outline_rounded,
                    color: Colors.green,
                    size: 80.sp,
                  ),
                  const Gap(10),
                  Text(
                    'Booking Successful!',
                    style: TextStyles.font18DarkBlueBold,
                  ),
                  const Gap(8),
                  Text(
                    'Thank you, ${appointmentData.data.patient.name}',
                    textAlign: TextAlign.center,
                    style: TextStyles.font14GrayRegular,
                  ),
                  const Divider(height: 30, thickness: 1),

                  // معلومات الدكتور
                  buildInfoRow(
                    Icons.person,
                    "Doctor",
                    appointmentData.data.doctor.name,
                  ),
                  const Gap(12),
                  buildInfoRow(
                    Icons.calendar_month,
                    "Date & Time",
                    appointmentData.data.appointmentTime,
                  ),
                  const Gap(12),
                  buildInfoRow(
                    Icons.attach_money,
                    "Price",
                    "${appointmentData.data.appointmentPrice} EGP",
                  ),
                  const Gap(12),
                  buildInfoRow(
                    Icons.location_on,
                    "Location",
                    appointmentData.data.doctor.address,
                  ),

                  const Gap(24),

                  // زرار الإغلاق
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      onPressed: () {
                        context.pop();
                        context.pushNamed(Routes.homeScreen);
                      },
                      child: Text(
                        'Done',
                        style: TextStyles.font16WhiteSemiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildInfoRow(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20.sp, color: AppColors.primaryColor),
        const Gap(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyles.font13GrayNormalRegular),
              Text(
                value,
                style: TextStyles.font14DarkBlueMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void showErrorDialog(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        icon: Icon(Icons.error_outline_rounded, color: Colors.red, size: 60.sp),
        title: Text(
          'Booking Failed',
          style: TextStyles.font18DarkBlueBold,
          textAlign: TextAlign.center,
        ),
        content: Text(
          error.isEmpty ? 'Something went wrong, please try again.' : error,
          style: TextStyles.font14GrayRegular,
          textAlign: TextAlign.center,
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              onPressed: () => context.pop(),
              child: Text('Try Again', style: TextStyles.font16WhiteSemiBold),
            ),
          ),
        ],
      ),
    );
  }
}
