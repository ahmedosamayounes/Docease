import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'widgets/doctors/doctors_blocbuilder.dart';
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
