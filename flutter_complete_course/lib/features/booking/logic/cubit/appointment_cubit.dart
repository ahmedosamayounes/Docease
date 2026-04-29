import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_course/core/networking/api_result.dart';
import 'package:flutter_complete_course/features/booking/data/models/appointment_request_model.dart';
import 'package:flutter_complete_course/features/booking/data/repo/appointment_repo.dart';
import 'package:flutter_complete_course/features/booking/logic/cubit/appointment_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


class AppointmentCubit extends Cubit<AppointmentState> {
  final AppointmentRepo _appointmentRepo;


  AppointmentCubit(this._appointmentRepo) : super(const AppointmentState.initial());


  void emitAppointmentStates(AppointmentRequestModel appointmentRequestModel) async {
    emit(const AppointmentState.loading());

    final response = await _appointmentRepo.appointment(appointmentRequestModel);

    response.when(
      success: (appointmentResponseModel) {
        emit(AppointmentState.success(appointmentResponseModel));
      },
      failure: (errorHandler) {
        emit(AppointmentState.error(
            errorMessage: errorHandler.apiErrorModel.message ?? 'error'),
        );
      },
    );
  }
}
