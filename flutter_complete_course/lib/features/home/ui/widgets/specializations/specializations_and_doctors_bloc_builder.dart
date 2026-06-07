import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../logic/cubit/home_cubit.dart';
import '../../../logic/cubit/home_state.dart';
import '../doctors/doctors_shimmer_loading.dart';
import 'speciality_shimmer_loading.dart';
import 'specializations_list.dart';
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
            var specializationsList = specializationsData;
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

  Widget setupLoading() {
    return Expanded(
      child: Column(
        children: [
          const SpecialityShimmerLoading(),
          Gap(8.h),
          const DoctorsShimmerLoading(),
        ],
      ),
    );
  }
}
