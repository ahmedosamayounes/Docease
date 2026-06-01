import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/Shared/app_text_button.dart';
import '../../../core/Shared/app_text_formfield.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/styles.dart';
import '../data/models/appointment_request_model.dart';
import '../logic/cubit/appointment_cubit.dart';
import 'widgets/booking_bloc_builder.dart';
import '../../home/data/models/specialization_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

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
                  const Gap(30),
                  Text(
                    'Booking With Dr ${widget.doctorModel?.name ?? 'Unknown Doctor'}',
                    style: TextStyles.font24BlueBold,
                  ),
                  Gap(10),
                  Text(
                    ' ${widget.doctorModel?.degree ?? 'Unknown degree'}',
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColors.grayColor,
                      fontSize: 15.h,
                    ),
                  ),
                  Gap(10),
                  Text(
                    ' Phone : ${widget.doctorModel?.phone ?? 'Unknown email'}',
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColors.grayColor,
                      fontSize: 15.h,
                    ),
                  ),
                  const Gap(30),
                  Text(
                    'Booking Information',
                    style: TextStyles.font16DarkBluebold,
                  ),
                  const Gap(16),

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

                  const Gap(16),

            
                  AppTextFormField(
                    hintText: 'Notes (Optional)',
                    controller: context
                        .read<AppointmentCubit>()
                        .notesController,
                    validator: (value) {
                      return null;
                    },
                  ),

                  const Gap(32),

                  AppTextButton(
                    buttonText: 'Confirm Booking',
                    textStyle: TextStyles.font16WhiteSemiBold,
                    onPressed: () {
                      validateAndBook(context);
                    },
                  ),
                  Gap(30),
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
      // لو كله تمام، ابعت الداتا للـ Cubit
      context.read<AppointmentCubit>().emitAppointmentStates(
        AppointmentRequestModel(
          doctorId: widget.doctorModel!.id!, // الـ ID اللي جاي من الـ Router
          startTime: context
              .read<AppointmentCubit>()
              .timeController
              .text, // القيمة اللي في الـ controller
          notes: context.read<AppointmentCubit>().notesController.text,
        ),
      );
    }
  }
}
