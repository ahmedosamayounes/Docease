import 'package:bloc/bloc.dart';
import 'package:flutter_complete_course/core/networking/api_result.dart';
import 'package:flutter_complete_course/features/home/data/repo/home_repo.dart';
import 'package:flutter_complete_course/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeState.initial());

  void getSpecializationsHome() async {
    emit(const HomeState.specializationsLoading());
    final response = await homeRepo.getSpecializationsHome();
    response.when(
      success: (specializationResponseModel) {
        emit(HomeState.specializationsSuccess(specializationResponseModel));
      },
      failure: (error) {
        emit(HomeState.specializationsError(error));
      },
    );
  }
}
