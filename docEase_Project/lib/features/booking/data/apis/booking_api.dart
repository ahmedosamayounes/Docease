import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constants.dart';
import '../models/appointment_request_model.dart';
import '../models/appointment_respose_model.dart';

part 'booking_api.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class BookingApi {
  factory BookingApi(Dio dio, {String baseUrl}) = _BookingApi;

  @POST(ApiConstants.appointmentstoreEndPoint)
  Future<AppointmentResponseModel>appointment(@Body() AppointmentRequestModel appointmentRequestModel);

}
