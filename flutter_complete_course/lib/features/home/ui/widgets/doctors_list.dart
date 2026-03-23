import 'package:flutter/material.dart';
import 'package:flutter_complete_course/core/theming/styles.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: false,
        padding: EdgeInsets.zero, // أهم خطوة: إزالة أي padding

        itemCount: 10,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Image.asset(
                  'assets/images/Image.png',
                  height: 110,
                  width: 110,
                ),
              ),
              Gap(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Randy Wigham',
                      style: TextStyles.font16DarkBluebold,
                    ),
                    Gap(8),
                    Text(
                      'RSUD Gatot Subroto',
                      style: TextStyles.font13GrayNormalReqular,
                    ),
                    Gap(8),
                    Row(
                      children: [
                        SvgPicture.asset('assets/svgs/magic-star.svg'),
                        Gap(5),
                        Text('4.8', style: TextStyles.font13GrayNormalReqular),
                        Gap(5),
                        Text(
                          '(4,279 reviews)',
                          style: TextStyles.font13GrayNormalReqular,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
