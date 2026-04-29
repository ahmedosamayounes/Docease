import 'package:json_annotation/json_annotation.dart';

part 'appointment_respose_model.g.dart';

@JsonSerializable()
class AppointmentResponseModel {
  final String message;
  final AppointmentData data;
  final bool status;
  final int code;

  AppointmentResponseModel({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory AppointmentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AppointmentResponseModelToJson(this);
}
@JsonSerializable()
class AppointmentData {
  final int id;
  final Doctor doctor;
  final Patient patient;

  @JsonKey(name: 'appointment_time')
  final String appointmentTime;

  @JsonKey(name: 'appointment_end_time')
  final String appointmentEndTime;

  final String status;
  final String? notes;

  @JsonKey(name: 'appointment_price')
  final int appointmentPrice;

  AppointmentData({
    required this.id,
    required this.doctor,
    required this.patient,
    required this.appointmentTime,
    required this.appointmentEndTime,
    required this.status,
    this.notes,
    required this.appointmentPrice,
  });

  factory AppointmentData.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AppointmentDataToJson(this);
}
@JsonSerializable()
class Doctor {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String photo;
  final String gender;
  final String address;
  final String description;
  final String degree;

  final Specialization specialization;
  final City city;

  @JsonKey(name: 'appoint_price')
  final int appointPrice;

  @JsonKey(name: 'start_time')
  final String startTime;

  @JsonKey(name: 'end_time')
  final String endTime;

  Doctor({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.gender,
    required this.address,
    required this.description,
    required this.degree,
    required this.specialization,
    required this.city,
    required this.appointPrice,
    required this.startTime,
    required this.endTime,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) =>
      _$DoctorFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DoctorToJson(this);
}
@JsonSerializable()
class Patient {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String gender;

  Patient({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
  });

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PatientToJson(this);
}
@JsonSerializable()
class Specialization {
  final int id;
  final String name;

  Specialization({
    required this.id,
    required this.name,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) =>
      _$SpecializationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SpecializationToJson(this);
}
@JsonSerializable()
class City {
  final int id;
  final String name;
  final Governrate governrate;

  City({
    required this.id,
    required this.name,
    required this.governrate,
  });

  factory City.fromJson(Map<String, dynamic> json) =>
      _$CityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CityToJson(this);
}
@JsonSerializable()
class Governrate {
  final int id;
  final String name;

  Governrate({
    required this.id,
    required this.name,
  });

  factory Governrate.fromJson(Map<String, dynamic> json) =>
      _$GovernrateFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GovernrateToJson(this);
}