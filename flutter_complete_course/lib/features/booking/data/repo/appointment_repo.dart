import 'package:flutter_complete_course/core/networking/api_error_handler.dart';
import 'package:flutter_complete_course/core/networking/api_result.dart';
import 'package:flutter_complete_course/features/booking/data/apis/booking_api.dart';
import 'package:flutter_complete_course/features/booking/data/models/appointment_request_model.dart';
import 'package:flutter_complete_course/features/booking/data/models/appointment_respose_model.dart';

class AppointmentRepo {
  final BookingApi bookingApi;
  AppointmentRepo(this.bookingApi);

  Future<ApiResult<AppointmentResponseModel>> appointment(
    AppointmentRequestModel appointmentRequestModel,
  ) async {
    try {
      final response = await bookingApi.appointment(appointmentRequestModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
