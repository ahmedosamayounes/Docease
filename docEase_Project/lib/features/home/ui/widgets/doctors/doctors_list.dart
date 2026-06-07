import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/styles.dart';
import '../../../data/models/specialization_and_doctor_response_model.dart';

class DoctorsList extends StatelessWidget {
  final List<Doctors?>? doctors;
  const DoctorsList({super.key, this.doctors});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: false,
        padding: EdgeInsets.zero,

        itemCount: doctors?.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.pushNamed(
                Routes.bookingScreen,
                arguments: doctors?[index],
              );
            },
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 18.h),
                  child: Image.asset(
                    'assets/svgs/Rectangle 39859.png',
                    height: 110.h,
                    width: 110.w,
                  ),
                ),
                Gap(10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctors?[index]?.name ?? 'doctor name',
                        style: TextStyles.font16DarkBluebold,
                      ),
                      Gap(8.h),
                      Text(
                        '${doctors?[index]?.degree ?? 'degree'} | ${doctors?[index]?.phone ?? 'phone number'}',
                        style: TextStyles.font13GrayNormalRegular,
                      ),
                      Gap(8.h),
                      Text(
                        doctors?[index]?.email ?? 'email',
                        style: TextStyles.font13GrayNormalRegular,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
