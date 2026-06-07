import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'widgets/doctors/doctors_bloc_builder.dart';
import 'widgets/doctors/doctors_blue_container.dart';
import 'widgets/doctors/doctors_speciality_see_all.dart';
import 'widgets/home_top_bar.dart';
import 'widgets/specializations/specializations_and_doctors_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(30.h),
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              Gap(18.h),
              const DoctorsSpecialitySeeAll(),
              Gap(15.h),
              const SpecializationsBlocBuilder(),
              const DoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
