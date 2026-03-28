import 'package:flutter/material.dart';
import 'package:flutter_complete_course/core/theming/styles.dart';
import 'package:flutter_complete_course/features/home/data/models/specialization_response_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class DoctorsList extends StatelessWidget {
  final List<Doctors?>? doctors;
  const DoctorsList({super.key, this.doctors});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: false,
        padding: EdgeInsets.zero, // أهم خطوة: إزالة أي padding

        itemCount: doctors?.length,
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
                      doctors?[index]?.name ?? 'doctor name',
                      style: TextStyles.font16DarkBluebold,
                    ),
                    Gap(8),
                    Text(
                      '${doctors?[index]?.degree ?? 'degree'} | ${doctors?[index]?.phone ?? 'phone number'}',
                      style: TextStyles.font13GrayNormalReqular,
                    ),
                    Gap(8),
                    //email Text
                    Text(
                      doctors?[index]?.email ?? 'email',
                      style: TextStyles.font13GrayNormalReqular,
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
