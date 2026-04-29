import 'package:json_annotation/json_annotation.dart';

part 'appointment_request_model.g.dart';

@JsonSerializable()
class AppointmentRequestModel {
  @JsonKey(name: 'doctor_id')
  final int doctorId;
  
  @JsonKey(name: 'start_time')
  final String startTime;

  final String? notes;

  AppointmentRequestModel({
    required this.doctorId,
    required this.startTime,
    this.notes,
  });

  factory AppointmentRequestModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentRequestModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AppointmentRequestModelToJson(this);
}