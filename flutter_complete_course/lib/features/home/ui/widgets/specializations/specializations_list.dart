import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_course/core/theming/app_colors.dart';
import 'package:flutter_complete_course/core/theming/styles.dart';
import 'package:flutter_complete_course/features/home/data/models/specialization_response_model.dart';
import 'package:flutter_complete_course/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SpecializationsList extends StatefulWidget {
  final List<SpecializationsData?> specializationsData;
  const SpecializationsList({super.key, required this.specializationsData});

  @override
  State<SpecializationsList> createState() => _SpecializationsListState();
}

class _SpecializationsListState extends State<SpecializationsList> {
  var selectedSpecializationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.builder(
        itemCount: widget.specializationsData.length,
        padding: EdgeInsets.zero, // أهم خطوة: إزالة أي padding

        scrollDirection: Axis.horizontal,
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSpecializationIndex = index;
              });
              context.read<HomeCubit>().getDoctorsList(
                specializationId: widget.specializationsData[index]?.id,
              );
            },
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                children: [
                  selectedSpecializationIndex == index
                      ? CircleAvatar(
                        radius: 35.0,
                        backgroundColor: AppColors.lightWhite,
                        child: Image.asset(
                          'assets/svgs/image 247.png',
                        ),
                      )
                      : CircleAvatar(
                          radius: 30.0,
                          backgroundColor: AppColors.lightWhite,
                          child: Image.asset(
                              'assets/svgs/image 247.png',
                            ),
                        ),
                  Gap(12),
                  Text(
                    widget.specializationsData[index]?.name ?? 'specialization',
                    style: selectedSpecializationIndex == index
                        ? TextStyles.font14DarkBlueBold
                        : TextStyles.font13GrayRegular,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
