import 'package:dio/dio.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';
import '../../features/booking/data/apis/booking_api.dart';
import '../../features/booking/data/repo/appointment_repo.dart';
import '../../features/booking/logic/cubit/appointment_cubit.dart';
import '../../features/home/data/apis/home_api_service.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/login/data/repos/login_repo.dart';
import '../../features/login/logic/cubit/login_cubit.dart';
import '../../features/sign_up/data/repo/sign_up_repo.dart';
import '../../features/sign_up/logic/cubit/sign_up_cubit.dart';
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

  // home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));

  // booking
  getIt.registerLazySingleton<BookingApi>(() => BookingApi(dio));
  getIt.registerLazySingleton<AppointmentRepo>(() => AppointmentRepo(getIt()));
  getIt.registerFactory<AppointmentCubit>(() => AppointmentCubit(getIt()));
}
