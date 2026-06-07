import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/sgin_up_requst_body.dart';
import '../models/sign_up_response.dart';

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
