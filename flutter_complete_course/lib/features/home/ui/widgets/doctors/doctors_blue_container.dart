import 'package:flutter/material.dart';
import 'package:flutter_complete_course/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DoctorsBlueContainer extends StatelessWidget {
  const DoctorsBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 180.h,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage(
                  'assets/svgs/Mask group.png' ,
                ),
                fit: BoxFit.cover,
                
              ),
              borderRadius: BorderRadius.circular(24.0.h),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Book and\nschedule with\nnearest doctor',
                  textAlign: TextAlign.start,
                  style: TextStyles.font18WhiteMedium.copyWith(height: 1.5),
                ),
                Gap(10.h),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48.0.h),
                      ),
                    ),
                    child: Text(
                      'Find Nearby',
                      style: TextStyles.font13PrimaryRegular,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 8.w,
            top: 0,
            child: Image.asset('assets/images/image 44.png', height: 200.h),
          ),
        ],
      ),
    );
  }
}
