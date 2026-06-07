import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/Shared/app_text_button.dart';
import '../../../core/Shared/app_text_formfield.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/styles.dart';
import '../../home/data/models/specialization_and_doctor_response_model.dart';
import '../data/models/appointment_request_model.dart';
import '../logic/cubit/appointment_cubit.dart';
import 'widgets/booking_bloc_builder.dart';

class BookingScreen extends StatefulWidget {
  final Doctors? doctorModel;
  const BookingScreen({super.key, this.doctorModel});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Form(
            key: context.read<AppointmentCubit>().formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(30.h),
                  Text(
                    'Booking With Dr ${widget.doctorModel?.name ?? 'Unknown Doctor'}',
                    style: TextStyles.font24BlueBold,
                  ),
                  Gap(10.h),

                  Text(
                    ' ${widget.doctorModel?.degree ?? 'Unknown degree'}',
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColors.grayColor,
                      fontSize: 15.h,
                    ),
                  ),

                  Gap(10.h),

                  Text(
                    ' Phone : ${widget.doctorModel?.phone ?? 'Unknown phone'}',
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColors.grayColor,
                      fontSize: 15.h,
                    ),
                  ),
                  Gap(30.h),
                  Text(
                    'Booking Information',
                    style: TextStyles.font16DarkBluebold,
                  ),
                  Gap(16.h),

                  AppTextFormField(
                    controller: context.read<AppointmentCubit>().timeController,
                    hintText: 'Select Date & Time (YYYY-MM-DD HH:mm:ss)',

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the appointment time';
                      }
                      return null;
                    },
                  ),

                  Gap(16.h),

                  AppTextFormField(
                    hintText: 'Notes (Optional)',
                    controller: context
                        .read<AppointmentCubit>()
                        .notesController,
                    validator: (value) {
                      return null;
                    },
                  ),

                  Gap(32.h),

                  AppTextButton(
                    buttonText: 'Confirm Booking',
                    textStyle: TextStyles.font16WhiteSemiBold,
                    onPressed: () {
                      validateAndBook(context);
                    },
                  ),
                  Gap(30.h),
                  const AppointmentBlocListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateAndBook(BuildContext context) {
    if (context.read<AppointmentCubit>().formKey.currentState!.validate()) {
      context.read<AppointmentCubit>().emitAppointmentStates(
        AppointmentRequestModel(
          doctorId: widget.doctorModel!.id!,
          startTime: context.read<AppointmentCubit>().timeController.text,
          notes: context.read<AppointmentCubit>().notesController.text,
        ),
      );
    }
  }
}
