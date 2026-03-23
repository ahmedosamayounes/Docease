import 'package:flutter/material.dart';
import 'package:flutter_complete_course/core/theming/app_colors.dart';
import 'package:flutter_complete_course/core/theming/styles.dart';
import 'package:flutter_complete_course/features/home/ui/widgets/home_top_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [Gap(30), HomeTopBar()]),
        ),
      ),
    );
  }
}
