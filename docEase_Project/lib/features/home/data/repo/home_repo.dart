import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../apis/home_api_service.dart';
import '../models/specialization_and_doctor_response_model.dart';

class HomeRepo {
  final HomeApiService homeApiService;

  HomeRepo(this.homeApiService);

  Future<ApiResult<SpecializationsResponseModel>>
  getSpecializationsHome() async {
    try {
      final response = await homeApiService.getSpecializationsHome();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
