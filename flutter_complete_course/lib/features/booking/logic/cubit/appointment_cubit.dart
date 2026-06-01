import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/appointment_request_model.dart';
import '../../data/repo/appointment_repo.dart';
import 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final AppointmentRepo _appointmentRepo;

  AppointmentCubit(this._appointmentRepo)
    : super(const AppointmentState.initial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  void emitAppointmentStates(
    AppointmentRequestModel appointmentRequestModel,
  ) async {
    emit(const AppointmentState.loading());

    final response = await _appointmentRepo.appointment(
      appointmentRequestModel,
    );

    response.when(
      success: (appointmentResponseModel) {
        emit(AppointmentState.success(appointmentResponseModel));
      },
      failure: (errorHandler) {
        emit(
          AppointmentState.error(
            errorMessage: errorHandler.apiErrorModel.message ?? 'error',
          ),
        );
      },
    );
  }
}
