import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_course/core/Shared/app_text_button.dart';
import 'package:flutter_complete_course/core/Shared/app_text_formfield.dart';
import 'package:flutter_complete_course/core/theming/app_colors.dart';
import 'package:flutter_complete_course/core/theming/styles.dart';
import 'package:flutter_complete_course/features/booking/data/models/appointment_request_model.dart';
import 'package:flutter_complete_course/features/booking/logic/cubit/appointment_cubit.dart';
import 'package:flutter_complete_course/features/booking/ui/widgets/booking_bloc_builder.dart';
import 'package:flutter_complete_course/features/home/data/models/specialization_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class BookingScreen extends StatefulWidget {
  final Doctors? doctorModel;
  const BookingScreen({super.key, this.doctorModel});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  @override
  void dispose() {
    timeController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Form(
            key: formKey,
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

                  // 1. مكان لاختيار التاريخ (كمثال بسيط)
                  AppTextFormField(
                    controller: timeController,
                    hintText: 'Select Date & Time (YYYY-MM-DD HH:mm:ss)',

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the appointment time';
                      }
                      return null;
                    },
                  ),

                  const Gap(16),

                  // 2. مكان للملحوظات
                  AppTextFormField(
                    hintText: 'Notes (Optional)',
                    controller: notesController,
                    validator: (value) {
                      return null;
                    },
                  ),

                  const Gap(32),

                  // 3. زرار الحجز والتعامل مع الـ Cubit
                  AppTextButton(
                    buttonText: 'Confirm Booking',
                    textStyle: TextStyles.font16WhiteSemiBold,
                    onPressed: () {
                      validateAndBook(context);
                      // go to sucess page
                    },
                  ),
                  Gap(30),
                  // 4. الـ BlocListener عشان تسمع الـ Success والـ Error
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
    if (formKey.currentState!.validate()) {
      // لو كله تمام، ابعت الداتا للـ Cubit
      context.read<AppointmentCubit>().emitAppointmentStates(
        AppointmentRequestModel(
          doctorId: widget.doctorModel!.id!, // الـ ID اللي جاي من الـ Router
          startTime: timeController.text, // القيمة اللي في الـ controller
          notes: notesController.text,
        ),
      );
    }
  }
}
