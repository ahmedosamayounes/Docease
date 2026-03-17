// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_complete_course/core/networking/api_error_handler.dart';
import 'package:flutter_complete_course/core/networking/api_result.dart';
import 'package:flutter_complete_course/core/networking/api_service.dart';
import 'package:flutter_complete_course/features/login/data/models/login_requst_body.dart';
import 'package:flutter_complete_course/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService apiService;
  LoginRepo( this.apiService);

  Future<ApiResult<LoginResponse>> login(
    LoginRequstBody loginRequestBody,
  ) async {
    try {
      final response = await apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
