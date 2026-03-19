import 'package:dio/dio.dart';
import 'package:flutter_complete_course/core/networking/api_constants.dart';
import 'package:flutter_complete_course/features/login/data/models/login_requst_body.dart';
import 'package:flutter_complete_course/features/login/data/models/login_response.dart';
import 'package:flutter_complete_course/features/sign_up/data/models/sgin_up_requst_body.dart';
import 'package:flutter_complete_course/features/sign_up/data/models/sign_up_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.loginEndpoint)
  Future<LoginResponse> login(@Body() LoginRequstBody loginRequestBody);

  @POST(ApiConstants.signUpEndpoint)
  Future<SignupResponse> signUp(@Body() SignUpRequestBody signUpRequestBody);
}
