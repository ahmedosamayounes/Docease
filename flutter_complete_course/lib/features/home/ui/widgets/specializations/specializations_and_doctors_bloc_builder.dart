import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_course/core/theming/app_colors.dart';
import 'package:flutter_complete_course/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_complete_course/features/home/logic/cubit/home_state.dart';
import 'package:flutter_complete_course/features/home/ui/widgets/doctors/doctors_shimmer_loading.dart';
import 'package:flutter_complete_course/features/home/ui/widgets/specializations/speciality_shimmer_loading.dart';
import 'package:flutter_complete_course/features/home/ui/widgets/specializations/specializations_list.dart';
import 'package:gap/gap.dart';

class SpecializationsBlocBuilder extends StatelessWidget {
  const SpecializationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is SpecializationsLoading ||
          current is SpecializationsSuccess ||
          current is SpecializationsError,

      builder: (context, state) {
        return state.maybeWhen(
          specializationsLoading: () {
            return setupLoading();
          },
          specializationsSuccess: (specializationsData) {
            var specializationsList =   specializationsData;
            return SpecializationsList(
              specializationsData: specializationsList ?? [],
            );
          },
          specializationsError: (errorHandler) {
            return const SizedBox.shrink();
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
    /// shimmer loading for specializations and doctors
  Widget setupLoading() {
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          Gap(8),
          const DoctorsShimmerLoading(),
        ],
      ),
    );
  }

}
