import 'package:flutter_complete_course/core/networking/api_error_handler.dart';
import 'package:flutter_complete_course/core/networking/api_result.dart';
import 'package:flutter_complete_course/features/home/data/apis/home_api_service.dart';
import 'package:flutter_complete_course/features/home/data/models/specialization_response_model.dart';

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
