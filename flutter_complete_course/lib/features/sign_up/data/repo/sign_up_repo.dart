import 'package:flutter_complete_course/core/networking/api_error_handler.dart';
import 'package:flutter_complete_course/core/networking/api_result.dart';
import 'package:flutter_complete_course/core/networking/api_service.dart';
import 'package:flutter_complete_course/features/sign_up/data/models/sgin_up_requst_body.dart';
import 'package:flutter_complete_course/features/sign_up/data/models/sign_up_response.dart';

class SignUpRepo {
  final ApiService apiService;
  SignUpRepo(this.apiService);

  Future<ApiResult<SignupResponse>> signUp(
    SignUpRequestBody signUpRequestBody,
  ) async {
    try {
      final response = await apiService.signUp(signUpRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
