import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_course/core/theming/app_colors.dart';
import 'package:flutter_complete_course/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_complete_course/features/home/logic/cubit/home_state.dart';
import 'package:flutter_complete_course/features/home/ui/widgets/doctors/doctors_blocbuilder.dart';
import 'package:flutter_complete_course/features/home/ui/widgets/doctors/doctors_blue_container.dart';
import 'package:flutter_complete_course/features/home/ui/widgets/doctors/doctors_speciality_see_all.dart';

import 'package:flutter_complete_course/features/home/ui/widgets/home_top_bar.dart';
import 'package:flutter_complete_course/features/home/ui/widgets/specializations/specializations_and_doctors_bloc_builder.dart';


import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(30),
              HomeTopBar(),
              DoctorsBlueContainer(),
              Gap(18),
              DoctorsSpecialitySeeAll(),
              Gap(15),
              SpecializationsBlocBuilder(),
              const DoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
