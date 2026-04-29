import 'package:flutter/material.dart';
import 'package:flutter_complete_course/core/theming/app_colors.dart';
import 'package:flutter_complete_course/core/theming/styles.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return    Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      Text('Hi, Ahmed!' , style: TextStyles.font18darkBluebold,),
                      Gap(5),
                  Text('How Are you Today?', style: TextStyles.font13GrayNormalReqular,)
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 24.0,
                backgroundColor: AppColors.moreLighterGray,
                child: SvgPicture.asset('assets/svgs/Alert.svg'),
              )
            ],
          );
  }
}