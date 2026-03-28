import 'package:flutter/material.dart';
import 'package:flutter_complete_course/core/theming/app_colors.dart';
import 'package:flutter_complete_course/features/home/data/models/specialization_response_model.dart';
import 'package:gap/gap.dart';

class SpecializationsList extends StatelessWidget {
  final List<SpecializationsData?> specializationsData;
  const SpecializationsList({super.key, required this.specializationsData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        itemCount: specializationsData.length,
        padding: EdgeInsets.zero, // أهم خطوة: إزالة أي padding

        scrollDirection: Axis.horizontal,
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundColor: AppColors.lightWhite,
                  child: Image.asset(
                    'assets/images/icons8-medical-doctor-100.png',
                  ),
                ),
                Gap(12),
                Text(specializationsData[index]?.name ?? 'specialization'),
              ],
            ),
          );
        },
      ),
    );
  }
}
