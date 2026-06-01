import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/specialization_response_model.dart';
import '../../data/repo/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  
  HomeCubit(this.homeRepo) : super(HomeState.initial()){
    getUserName();
  }
  List<SpecializationsData?>? specializationsList = [];
  String? userName;
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

  void getUserName() async {
  userName = await SharedPrefHelper.getString('userName');
  debugPrint("Retrieved UserName: $userName");
}
}
