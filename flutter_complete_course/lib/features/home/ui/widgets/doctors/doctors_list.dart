import 'package:flutter/material.dart';
import 'package:flutter_complete_course/core/helpers/extensions.dart';
import 'package:flutter_complete_course/core/routing/routes.dart';
import 'package:flutter_complete_course/core/theming/styles.dart';
import 'package:flutter_complete_course/features/booking/ui/booking_screen.dart';
import 'package:flutter_complete_course/features/home/data/models/specialization_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        padding: EdgeInsets.zero,

        itemCount: doctors?.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // هنا المفروض لما يختار دكتور
              context.pushNamed(
                Routes.bookingScreen,
                arguments: doctors?[index],
              );
            },
            child: Row(
              children: [
                Padding(
                  padding:  EdgeInsets.only(bottom: 18.h),
                  child: Image.asset(
                    'assets/svgs/Rectangle 39859.png',
                    height: 110.h,
                    width: 110.w,
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
                      Gap(8.h),
                      Text(
                        '${doctors?[index]?.degree ?? 'degree'} | ${doctors?[index]?.phone ?? 'phone number'}',
                        style: TextStyles.font13GrayNormalReqular,
                      ),
                      Gap(8.h),
                      //email Text
                      Text(
                        doctors?[index]?.email ?? 'email',
                        style: TextStyles.font13GrayNormalReqular,
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
