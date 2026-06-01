import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/cubit/home_cubit.dart';
import '../../logic/cubit/home_state.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, ${context.watch<HomeCubit>().userName ?? 'User'}!',
                  style: TextStyles.font18darkBluebold,
                ),
                const Gap(5),
                Text(
                  'Find your doctor now',
                  style: TextStyles.font13GrayNormalRegular,
                ),
              ],
            ),
            const Spacer(),
            CircleAvatar(
              radius: 24.0,
              backgroundColor: AppColors.moreLighterGray,
              child: SvgPicture.asset('assets/svgs/Alert.svg'),
            ),
          ],
        );
      },
    );
  }
}
