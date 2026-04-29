import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_course/core/helpers/extensions.dart';
import 'package:flutter_complete_course/core/routing/routes.dart';
import 'package:flutter_complete_course/core/theming/app_colors.dart';
import 'package:flutter_complete_course/core/theming/styles.dart';
import 'package:flutter_complete_course/features/booking/logic/cubit/appointment_cubit.dart';
import 'package:flutter_complete_course/features/booking/logic/cubit/appointment_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AppointmentBlocListener extends StatelessWidget {
  const AppointmentBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const SizedBox.shrink();
          },
          error: (errorHandler) => const SizedBox.shrink(),

          initial: () => const SizedBox.shrink(),
          loading: () => Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          ),
          success: (appointmentdata) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ✅ Success Message
                Text(
                  'Thank You ${appointmentdata.data.patient.name} ',
                  style: TextStyles.font18DarkBlueBold.copyWith(
                    color: AppColors.darkBlue,
                  ),
                ),

                const Gap(16),

                ///  Doctor Info
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 26,
                        // backgroundImage: NetworkImage(
                        //   appointmentdata.data.doctor.photo,
                        // ),
                        backgroundImage: Image.asset(
                          'assets/svgs/Rectangle 39859.png',
                        ).image,
                      ),
                      const Gap(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              appointmentdata.data.doctor.name,
                              style: TextStyles.font16DarkBluebold,
                            ),
                            const Gap(4),
                            Text(
                              appointmentdata.data.doctor.specialization.name,
                              style: TextStyles.font14GrayRegular,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const Gap(16),

                ///  Appointment Time
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Appointment Time",
                        style: TextStyles.font16DarkBluebold,
                      ),
                      const Gap(8),
                      Text(
                        appointmentdata.data.appointmentTime,
                        style: TextStyles.font14GrayRegular,
                      ),
                      const Gap(4),
                      Text(
                        appointmentdata.data.appointmentEndTime,
                        style: TextStyles.font14GrayRegular,
                      ),
                    ],
                  ),
                ),

                const Gap(16),

                ///  Price
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.attach_money, color: AppColors.primaryColor),
                      const Gap(8),
                      Text(
                        '${appointmentdata.data.appointmentPrice} EGP',
                        style: TextStyles.font16DarkBluebold,
                      ),
                    ],
                  ),
                ),

                const Gap(16),

                ///  Address
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on, color: AppColors.primaryColor),
                      const Gap(8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            'Location',
                            style: TextStyles.font16DarkBluebold,
                            maxLines: 1,
                          ),
                          Gap(8),
                          Text(
                            ' ${appointmentdata.data.doctor.address}',
                            style: TextStyles.font14GrayRegular,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const Gap(16),

                ///  Notes
                appointmentdata.data.notes == ""
                    ? SizedBox.shrink()
                    : Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.info, color: Colors.green),
                            const Gap(8),
                            Text(
                              'Your Notes Is Saved',

                              style: TextStyles.font14DarkBlueBold,
                            ),
                          ],
                        ),
                      ),
                Gap(40),
              ],
            );
          },
        );
      },
    );
  }
}
