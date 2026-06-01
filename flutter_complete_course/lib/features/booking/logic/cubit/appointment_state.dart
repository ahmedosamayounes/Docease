import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/appointment_respose_model.dart';

part 'appointment_state.freezed.dart';

@freezed
class AppointmentState with _$AppointmentState {
  const factory AppointmentState.initial() = _Initial;
  const factory AppointmentState.loading() = Loading;
  const factory AppointmentState.success(AppointmentResponseModel appointmentResponseModel) = Success;
  const factory AppointmentState.error({required String errorMessage}) = Error;
}
