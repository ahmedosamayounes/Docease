import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../apis/booking_api.dart';
import '../models/appointment_request_model.dart';
import '../models/appointment_respose_model.dart';

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
