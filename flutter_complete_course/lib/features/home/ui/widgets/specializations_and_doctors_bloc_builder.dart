import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_course/core/theming/app_colors.dart';
import 'package:flutter_complete_course/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter_complete_course/features/home/logic/cubit/home_state.dart';
import 'package:flutter_complete_course/features/home/ui/widgets/doctors_list.dart';
import 'package:flutter_complete_course/features/home/ui/widgets/specializations_list.dart';

class SpecializationsAndDoctorsBlocBuilder extends StatefulWidget {
  const SpecializationsAndDoctorsBlocBuilder({super.key});

  @override
  State<SpecializationsAndDoctorsBlocBuilder> createState() =>
      _SpecializationsAndDoctorsBlocBuilderState();
}

class _SpecializationsAndDoctorsBlocBuilderState
    extends State<SpecializationsAndDoctorsBlocBuilder> {
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
            return SizedBox(
              height: 100,
              child: const Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              ),
            );
          },
          specializationsSuccess: (specializationResponseModel) {
            var specializationsList =
                specializationResponseModel.specializationDataList;
            return Expanded(
              child: Column(
                children: [
                  SpecializationsList(
                    specializationsData: specializationsList ?? [],
                  ),
                  DoctorsList(doctors: specializationsList?[0]?.doctorsList),
                ],
              ),
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
}
