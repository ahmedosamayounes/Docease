import 'package:dio/dio.dart';
import 'package:flutter_complete_course/core/networking/api_constants.dart';
import 'package:flutter_complete_course/features/booking/data/models/appointment_request_model.dart';
import 'package:flutter_complete_course/features/booking/data/models/appointment_respose_model.dart';
import 'package:flutter_complete_course/features/login/data/models/login_requst_body.dart';
import 'package:flutter_complete_course/features/login/data/models/login_response.dart';
import 'package:flutter_complete_course/features/sign_up/data/models/sgin_up_requst_body.dart';
import 'package:flutter_complete_course/features/sign_up/data/models/sign_up_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'booking_api.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class BookingApi {
  factory BookingApi(Dio dio, {String baseUrl}) = _BookingApi;

  @POST(ApiConstants.appointmentstoreEndPoint)
  Future<AppointmentResponseModel>appointment(@Body() AppointmentRequestModel appointmentRequestModel);

}
