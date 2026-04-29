import 'package:dio/dio.dart';
import 'package:flutter_complete_course/core/networking/api_constants.dart';
import 'package:flutter_complete_course/features/home/data/models/specialization_response_model.dart';
import 'package:retrofit/retrofit.dart';
part 'home_api_service.g.dart';
@RestApi(baseUrl:ApiConstants.apiBaseUrl)

abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;




  @GET(ApiConstants.specializationEndpoint)
  Future<SpecializationsResponseModel> getSpecializationsHome();
}
