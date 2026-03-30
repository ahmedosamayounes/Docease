import 'package:bloc/bloc.dart';
import 'package:flutter_complete_course/core/helpers/extensions.dart';
import 'package:flutter_complete_course/core/networking/api_error_handler.dart';
import 'package:flutter_complete_course/core/networking/api_result.dart';
import 'package:flutter_complete_course/features/home/data/models/specialization_response_model.dart';
import 'package:flutter_complete_course/features/home/data/repo/home_repo.dart';
import 'package:flutter_complete_course/features/home/logic/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeState.initial());
  List<SpecializationsData?>? specializationsList = [];
  void getSpecializationsHome() async {
    emit(const HomeState.specializationsLoading());
    final response = await homeRepo.getSpecializationsHome();
    response.when(
      success: (specializationResponseModel) {
        specializationsList =
            specializationResponseModel.specializationDataList ?? [];

        // getting the doctors list for the first specialization by default.
        getDoctorsList(specializationId: specializationsList?.first?.id);

        emit(HomeState.specializationsSuccess(specializationsList));
      },
      failure: (error) {
        emit(HomeState.specializationsError(error));
      },
    );
  }

  void getDoctorsList({required int? specializationId}) {
    List<Doctors?>? doctorsList = getDoctorsListBySpecializationId(
      specializationId,
    );

    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      emit(HomeState.doctorsError(ErrorHandler.handle('No doctors found')));
    }
  }

  /// returns the list of doctors based on the specialization id
  getDoctorsListBySpecializationId(specializationId) {
    return specializationsList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
