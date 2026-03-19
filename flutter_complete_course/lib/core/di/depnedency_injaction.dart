import 'package:dio/dio.dart';
import 'package:flutter_complete_course/core/networking/api_service.dart';
import 'package:flutter_complete_course/core/networking/dio_factory.dart';
import 'package:flutter_complete_course/features/login/data/repos/login_repo.dart';
import 'package:flutter_complete_course/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_complete_course/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:flutter_complete_course/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  //registerLazySingleton mean create only one version and i will use in all app
  // registerFactory mean every time i use create new version

  // signup
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt())); 
}
