import 'package:dio/dio.dart';
import 'api_constants.dart';
import '../../features/login/data/models/login_reqeust_body.dart';
import '../../features/login/data/models/login_response.dart';
import '../../features/sign_up/data/models/sgin_up_requst_body.dart';
import '../../features/sign_up/data/models/sign_up_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.loginEndpoint)
  Future<LoginResponse> login(@Body() LoginReqeustBody loginRequestBody);

  @POST(ApiConstants.signUpEndpoint)
  Future<SignupResponse> signUp(@Body() SignUpRequestBody signUpRequestBody);
}
