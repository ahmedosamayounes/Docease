import 'package:flutter/material.dart';

import 'package:flutter_complete_course/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:flutter_complete_course/features/home/ui/widgets/home_top_bar.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}
